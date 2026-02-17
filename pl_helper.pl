#!/usr/bin/perl
use strict;
use warnings;

# 3/13/24 DCU
# Usage: perl script_name.pl

while (1) {
    system("clear");

    print "==Option Menu==\n";
    print "1 - Cve List To Tutorial Conversion\n";
    print "2 - Add Words To Wordlist\n";
    print "3 - Update CVS\n";
    print "e - exit\n";
    print "Enter your option\n";

    my $option = <STDIN>;
    chomp $option;

    if ($option eq '1') {
        print "Opening Form...\n";
        system("perl cvelist2tut.pl");
    } elsif ($option eq '2') {
        print "Opening...\n";
        system("perl add_word.pl");
    } elsif ($option eq '3') {
        print "Updating CVS...\n";
        system("cvs update");
    } elsif ($option eq 'e') {
        print "Ok bye\n";
        last;
    } else {
        print "Enter valid option\n";
    }

    print "Do you want to continue (Y/N)\n";
    my $opt = <STDIN>;
    chomp $opt;
    last unless $opt =~ /^y/i;
    system("clear");
}
