#!/usr/bin/perl
use warnings;
use strict;
use experimental 'signatures';
use List::Util qw(min max);

###############################################################################
#Container With Most Water
#
#Problem: You are given an array of positive integers where each integer 
# represents an array of postive integers where each integer represents the
# height of a vertical line on a chart. Find two lines which together with the
# x-axis forms a container that would hold the greatest amount of water. 
# Return the area of water it would hold.
#
# Given: 1. An array of positive integers. 
#        2. Any two elements in the array may be considered to represents
#           the two vertical sides of a container
#        3. The difference in indices between the two elements will represent
#           the width of the base of the container.
#        4. The area is height of the lowest array value and the width.
#
# Return: Area 
###############################################################################

#Naive solution
# Double 'for' loop through the array and capture the height and width
# store the largest area. When done return max area.

sub container_with_most_water_naive(@array) { 
  #Time Complexity: O(n^2)
  #Space Complexity: O(1)
  my $maxArea = 0;
  for (my $i = 0; $i < $#array; $i++) {
    for (my $j = $i+1; $j <= $#array; $j++) {
      my $width = $j - $i;
      my $height = min($array[$j], $array[$i]);
      if ($width*$height > $maxArea) {
        $maxArea = $width*$height;
      }
    }
  }
  return $maxArea;
}

sub container_with_most_water_optimal(@array) { 
  #Time Complexity: O(n)
  #Space Complexity: O(1)
  my ($p1 , $p2, $maxArea) = (0, $#array, 0);
  while ($p1 < $p2) {
    my $width = $p2 - $p1;
    my $height = min($array[$p2], $array[$p1]);
    $maxArea = max($maxArea, $height * $width);
    if ($array[$p1] < $array[$p2]) {
      $p1++;
    }
    else {
      $p2--;
    }
  }
  return $maxArea;
}

my @array;

@array = qw(1 8 6 2 5 4 8 3 7);
print "Test Naive: ",container_with_most_water_naive(@array),"\n";
print "Test Optimal: ",container_with_most_water_optimal(@array),"\n";
