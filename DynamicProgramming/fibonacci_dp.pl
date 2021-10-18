#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
use feature 'current_sub';
no warnings 'experimental::signatures';

#This is dynamic programming implementation fibonacci.

my $calculations = 0;

sub fibonacci() {
  my %cache;
  return sub ($n){
    if ($cache{$n}) {
      return $cache{$n};
    }
    else {
      if ($n < 2) {
        return $n;
      }
      else {
        return __SUB__->($n-1) + __SUB__->($n - 2);
      }
    }   
  };
}



my $fasterFib = fibonacci();
print $fasterFib->(30),"\n";
