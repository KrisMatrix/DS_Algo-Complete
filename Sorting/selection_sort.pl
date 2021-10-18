#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings 'experimental::signatures';

#Selection Sort

sub selection_sort(@list) {
  for (my $i = 0; $i < $#list; $i++) {
    my $smallestIndex = $i;
    my $temp = $list[$i];
    for (my $j = $i+1; $j <= $#list; $j++) {
      if ($list[$smallestIndex] > $list[$j]) {
        $smallestIndex = $j;
      }
    }
    $list[$i] = $list[$smallestIndex];
    $list[$smallestIndex] = $temp;
  }
  return @list;
}

my @list = qw(8 5 2 6 9 3 1 4 0 7);
print selection_sort(@list),"\n";
