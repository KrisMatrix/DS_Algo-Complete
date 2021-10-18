#!/usr/bin/perl
use warnings;
use strict;
use experimental 'signatures';

sub addTo80($n) {
  print "long time\n";
  return $n + 80;
}


sub memoizedAddTo80() {
  my %cache;
  return sub ($n) {
    if (exists $cache{$n}) {
      #do nothing
    }
    else {
      print "Long time\n";
      $cache{$n} = $n + 80;
    }
    return $cache{$n};
  };
}

my $memoized = memoizedAddTo80();
print $memoized->(5),"\n";
print $memoized->(5),"\n";
