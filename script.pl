#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

sub getTrendingTopics {
	open(my $file, "<", $_[0]) or die "Can't open file: $!";
	my %topics;
	my @hashtags;
	
	seek($file, 0, 0);
	
	while (<$file>) {

		if (/#.*(\s|\n)/) {
			my @array = split(/\s/, $&);
			foreach my $tag (@array) {
				push @hashtags, $tag;
			}		} 			
	}

	foreach my $name (@hashtags) {
		if (defined $topics{$name}) {
			$topics{$name}++;
		} else {
			$topics{$name} = 1;
		}
	}

	close($file) or die "Can't close file: $!";

	return %topics;
}

print getTrendingTopics("twitters.txt");
