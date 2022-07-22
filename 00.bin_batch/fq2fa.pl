#!/usr/bin/perl 
use strict;
use warnings;
use PerlIO::gzip;

open IN,"<:gzip","$ARGV[0]" or die $!; 
open OUT,">$ARGV[1]" or die $!; 
while(1)
{   
    my $line_1 = <IN>;
    my $line_2 = <IN>;
    my $line_3 = <IN>;
    my $line_4 = <IN>;
    last unless(defined $line_1);
    chomp ($line_1,$line_2,$line_3,$line_4);
    print OUT ">$line_1\n";
    print OUT "$line_2\n";
}
close IN; 
close OUT;
