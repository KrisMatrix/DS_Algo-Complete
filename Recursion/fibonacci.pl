#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings 'experimental::signatures';

sub fibonacci($n) { #O(n)
  if ($n == 1) {
    return 0;
  }
  elsif ($n == 2) {
    return 1;
  }
  else {
    my $sum = 0 + 1;
    my @result;
    push(@result, 0);
    push(@result, 1);
    for (my $i = 2; $i < $n; $i++) {
      $sum = $result[$i-1] + $result[$i-2];
      #print "THIS: $result[$i-1] + $result[$i - 2] = ", $result[$i-1] + $result[$i-2],"\n";
      push(@result, $result[$i-1] + $result[$i-2]);
    }
    return $sum;
  }
}

sub fibonacci2($n) {  #O(n^2)
  if ($n == 1) {
    return 0;
  }
  elsif ($n == 2) {
    return 1;
  }
  return fibonacci2($n-1) + fibonacci2($n-2);
}

my $sum = 0;
for (my $i = 1; $i <= 10; $i++) {
  print fibonacci($i),",";
  $sum += fibonacci2($i);
}
print "\n";
print "SUM: $sum\n";

my $sum2 = 0;
for (my $i = 1; $i <= 10; $i++) {
  print fibonacci2($i),",";
  $sum2 += fibonacci2($i);
}
print "\n";
print "SUM: $sum2\n";
