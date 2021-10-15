#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings 'experimental::signatures';

sub factorial($n) {
  if ($n == 1) {
    return 1;
  }
  else {
    return $n * factorial($n - 1);
  }
}

sub factorial2($n) {
  my $prod = 1;
  for (my $i = 1; $i <= $n; $i++) {
    $prod *= $i; 
  }
  return $prod;
}


print factorial(5),"\n";
print factorial2(5),"\n";
