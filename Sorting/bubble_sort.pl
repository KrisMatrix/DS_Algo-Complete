#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings 'experimental::signatures';

# Bubble Sort
# Loops through each index. Check the value in current index with
# the value in the next index. If next index value is smaller, then
# swap.

sub bubble_sort(@list) {  #O(n^2)
  for (my $i = 0; $i < $#list; $i++) {
    for (my $j = $i+1; $j <= $#list; $j++) {
      if ($list[$i] > $list[$j]) {
        my $temp = $list[$i];
        $list[$i] = $list[$j];
        $list[$j] = $temp;
      }
    }
      print "$i: @list\n";
  }
  return @list;
}


my @list = qw(6 5 3 1 8 7 2 4);
print bubble_sort(@list),"\n"
