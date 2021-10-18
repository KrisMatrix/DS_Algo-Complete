#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings 'experimental::signatures';

#This is basic recursion fibonacci. Very inefficient.

#my $calculations = 0;

sub fibonacci($n) {
  #$calculations++;
  if ($n < 2) {
    return $n;
  }
  return fibonacci($n-1) + fibonacci($n - 2);
}

print fibonacci(30),"\n"; #prints both value in fibo sequence as well as no of 
                          # recurisons.
