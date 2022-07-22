#!/usr/bin/perl
use warnings;
use strict;
use SVG;
use Data::Dumper;


open IN,"$ARGV[0]" or die $!; #50t_stdata.updated.tsv
my $header = <IN>;
print $header;
while(<IN>)
{
	chomp;
	my @array = split /\t/,$_;
	my @pos = split /x/,$array[0];
	my $x = 50 - $pos[0] + 1;
	my $y = $pos[1];
	print "$x"."x$y";
	for(my $i=1;$i<@array;$i++)
	{
		print "\t$array[$i]";
	}
	print "\n";
}
close IN;
