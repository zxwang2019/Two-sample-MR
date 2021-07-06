#!/usr/bin/perl -w
use strict;
open IN,"metaboliteMap.txt" or die $!;

#use Data::Dumper;

my %hash;
while (<IN>) {
	chomp;
	my @a = split /\t/;
	$hash{$a[0]} = $a[1];
}
close IN;

#print Dumper (\%hash);

open IN2, "$ARGV[0]" or die $!;
while (<IN2>) {
	if (/(\S+)\.(\S+)/) {
#		print "$1\t$2\n";
		if (exists $hash{$1}) {
			print "$1\t$hash{$1}\n";
		}
	}
}
close IN2;
