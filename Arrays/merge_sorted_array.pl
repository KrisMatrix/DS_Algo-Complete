#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings qw(experimental::signatures);

=pod

=head1 NAME

Merge Sorted Array

=head1 DESCRIPTION

Here we are creating a function that will merge two arrays. The assumption
is that the arrays in question are already sorted.

=cut

sub mergeSortedArrays($array1, $array2) {
  my @mergedArray;
  for (my $i = 0; $i <= $#$array1; $i++) {
    push(@mergedArray, $$array1[$i]);
  }
  for (my $i = 0; $i <= $#$array2; $i++) {
    push(@mergedArray, $$array2[$i]);
  }
  return \@mergedArray;
}

my @a = qw(1 3 4 6 20);
my @b = qw(2 3 4 5 6 9 11 76);
print "@{mergeSortedArrays(\@a, \@b)}\n";
@a = qw();
@b = qw(2 3 4 5 6 9 11 76);
print "@{mergeSortedArrays(\@a, \@b)}\n";
