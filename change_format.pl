#!/usr/bin/perl -w
use strict;
open IN, "$ARGV[0]" or die $!;
my$t = <IN>;
print "number\t$t";

while (<IN>) {
	chomp;
	if (/(\S+)\t(\S+).*/) {
		if ($1 =~ /id.exposure/) {
			next;
		}else {
			print "$_\n";
		}
	}
}
close IN;

