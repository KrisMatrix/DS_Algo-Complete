#!/usr/bin/perl 
use warnings;
use strict;
use experimental 'signatures';

###############################################################################
# Two Sum Problem:
#
# Given an array of integers 'nums' and an integer 'target', return indices of 
# the two numbers such that they add up to target.
#
# You may assume that each input would have exactly one solution, and you may
# not use the same element twice.
#
# You can return the answer in any order.


# Given: (1) An array of numbers
#        (2) A target value. Two numbers from the array must add up to target.
#
# Step 1: Verify the Constraints:
#  1. If array has less than 2 elements, then return "invalid array"
#  2. The array cannot have duplicate values.
#  3. There is exactly one correct solution 
#  4. Return indices of array that add up to target (not the values).
#
# Step 2: Write out some test cases
#   Test1: nums = []  target 10    Result = null
#   Test2: nums = [1] target 10    Result = null
#   Test3: nums = [1,2] target 10  Result = "No indices add up to target"
#   Test4: nums = [1,2] tagert 3   Result = [0,1]
#   Test5: nums = [2,4,5,1] target 7   Result = [0,2]
#   Test6: nums = [2, 4, 3, 5, 1] target7 Result = [0,3]  #Technically multiple
#   # solutions are possible, but the constraint provided allows assumed only
#   # one solution possible, so technically an invalid array for the problem.
#   # We will ignore these issues, and therefore, we may only get one valid 
#   # solution.
#   Test7: nums = [2, 2, 4, 3] target = 6. Result = [0,2] #Another invalid nums
#   # as duplicate elements provided, but we will accept one plausible answer.
#
# Step 3: Figure out a solution without code.
#   function two_sum(target, nums) {
#     store = {}
#     for (i = 0; i < length(nums); i++){
#       if (num2find is already in hash store) {
#         return (store[num2find], i)
#       }
#       else {
#         store[target - num[i]] = i
#       }
#     }
#   }
#
# The worst case is O(n^2), but because of our hash, it should be a lost faster
# Time Complexity: O(n^2)
# Space Complexity: O(1)
# Step 4: Write out the solution in code.
###############################################################################
sub two_sum($target, @nums) {
  my %store;  #hash that stores elements
  for (my $i = 0; $i <= $#nums; $i++) {
    if (exists $store{$nums[$i]}) { #if element exists in store 
      return ($store{$nums[$i]}, $i); 
    }
    else {
      $store{$target - $nums[$i]} = $i;
    }
  }
  return ();
}

my @nums;
my $target;

@nums = qw();
$target = 10;
print "Test 1: ";
print join(",",two_sum($target, @nums)),"\n";

@nums = qw (1);
$target = 10;
print "Test 2: ";
print join(",",two_sum($target, @nums)),"\n";

@nums = qw (1 2);
$target = 10;
print "Test 3: ";
print join(",",two_sum($target, @nums)),"\n";

@nums = qw (1 2);
$target = 3;
print "Test 4: ";
print join(",",two_sum($target, @nums)),"\n";

@nums = qw(2 4 5 1);
$target = 7;
print "Test 5: ";
print join(",",two_sum($target, @nums)),"\n";

@nums = qw (2 4 3 5 1);
$target = 7;
print "Test 6: ";
print join(",",two_sum($target, @nums)),"\n";

@nums = qw(2 2 4 3);
$target = 6;
print "Test 7: ";
print join(",",two_sum($target, @nums)),"\n";

@nums = qw(1 5 4 0 9 8 6 2);
$target = 8;
print "Test 8: ";
print join(",",two_sum($target, @nums)),"\n";

#EOF
