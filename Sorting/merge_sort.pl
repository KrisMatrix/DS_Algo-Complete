#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings 'experimental::signatures';

#Merge Sort
sub merge_sort($arr_ref) {
  #Break the array in half and call merge. The Divide 
  #Merge the arrays with merge. Since you want to recursively
  # break up and merge the array, you need to pass the merge_sort()
  # for left and right as args to merge().

  my @arr = @{$arr_ref};
  my $length = $#arr;
  if ($length == 0) { #if only one element.
    return @arr;
  }
  my @left = @arr[0..int($length/2)];
  my @right = @arr[int($length/2)+1 .. $#arr];

  return merge( [merge_sort(\@left)], [merge_sort(\@right)] ); 
  #The square brackets are necessary. merge_sort() is supposed to return
  # an array. merge() needs array reference. The square brackets acheive this.
}

sub merge($left_ref, $right_ref) {
  my @result;
  my @left = @{$left_ref};
  my @right = @{$right_ref};
  my $l = 0;
  my $r = 0;
  while ($l <= $#left and $r <= $#right) {
    if ($left[$l] < $right[$r]) {
      push(@result, $left[$l]);
      $l++;
    }
    else {
      push(@result, $right[$r]);
      $r++;
    }
  }

  while ($l <= $#left) {
    push(@result, $left[$l]);
    $l++;
  }
  while ($r <= $#right) {
    push(@result, $right[$r]);
    $r++;
  }
  return @result;
}

my @list = qw (6 5 3 1 8 7 2 4);
print merge_sort(\@list),"\n";
