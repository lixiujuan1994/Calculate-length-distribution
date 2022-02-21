#!/usr/bin/perl -w
use strict;
#coding:utf8

open(INFILE, "sequence_length.txt");
open(OUTFILE, ">sequence_length_distribution.txt") ||   die "Cannot open the newfile: $!\n";


my $length;
my $up_200=0;
my $up_300=0;
my $up_500=0;
my $up_1000=0;
my $up_2000=0;
readline INFILE;
while(<INFILE>){
    chomp;
    $_=~/\S+\t(\w+)/;
	$length=$1;
	if($length>=200 && $length<300){
		$up_200=$up_200+1;
		}
	elsif($length>=300 && $length<500){
	$up_300=$up_300+1;
	}
	elsif($length>=500 && $length<1000){
	$up_500=$up_500+1;
	}
	elsif($length>=1000 && $length<2000){
	$up_1000=$up_1000+1;
	}
	else{
	$up_2000=$up_2000+1;
	}
}
print OUTFILE "200-300\t$up_200\n";
print OUTFILE "300-500\t$up_300\n";
print OUTFILE "500-1000\t$up_500\n";
print OUTFILE "1000-2000\t$up_1000\n";
print OUTFILE "2000+\t$up_2000\n";
