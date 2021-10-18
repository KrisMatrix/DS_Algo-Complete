#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings 'experimental::signatures';

#Insertion Sort
#The way this logic works is you start an index i and index i+1. The value
# in Index i+1 is set as key. You then check the values preceding index i + 1 
# and if they are bigger, we increment 'their' indices (or shift right in array)
# when you get to index where the value is in fact smaller than key, you stop.
# There should be a gap in the array. Copy the key value into the gap. Then
# increment index.

sub insertion_sort(@list) {
  my $key;
  for (my $i = 1; $i <= $#list; $i++) {
    $key = $list[$i]; #the value that you want to compare with
    my $j = $i - 1;

    while ($j >= 0 and $list[$j] > $key) {  #start from one index before the 
                                            # index of the key. If this value 
                                            # is greater than the key, then 
                                            # shift the value to the right (ie
                                            # one index to the right. Keep 
                                            # going until we get to an index
                                            # where the value is no longer
                                            # larger than key. Insert key after
                                            # than index.
      $list[$j + 1] = $list[$j];
      $j = $j - 1;
    }
    $list[$j + 1] = $key;
    print "$i: @list\n";
  }
  return @list;
}

my @list = qw(6 5 1 3 8 7 2 4);
print insertion_sort(@list),"\n";

#6 5 1 3 8 7 2 4  --> Start
#5 6 1 3 8 7 2 4  --> i = 1
#1 5 6 3 8 7 2 4  --> i = 2
#1 3 5 6 8 7 2 4  --> i = 3
#1 3 5 6 7 8 2 4  --> i = 4
#1 3 5 6 7 8 2 4  --> i = 5
#1 2 3 5 6 7 8 4  --> i = 6
#1 2 3 4 5 6 7 8  --> i = 7
