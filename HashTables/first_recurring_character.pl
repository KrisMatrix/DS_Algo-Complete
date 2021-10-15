#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings 'experimental::signatures';

#Google Question - First Recurring Character
# Given an array = [2,5,1,2,3,5,1,2,4]
# It should return 2
#
# Given an array = [2,1,1,2,3,5,1,2,4]
# It should return 1
#
# Given an array = [2,3,4,5]
# It should return undef

sub firstRecurringCharacter(@input) { #O(n^2)
  for (my $i = 0; $i <= $#input; $i++) {
    for (my $j = $i + 1; $j <= $#input; $j++) {
      print $input[$i], " == ", $input[$j],"\n";
      if ($input[$i] == $input[$j]) {
        return $input[$i];
      }
    }
  }
  return undef;
}

sub firstRecurringCharacter2(@input) {  #O(n)
  my %map;
  for (my $i = 0; $i <= $#input; $i++) {
    print "input = ",$input[$i],"\n";
    if (!exists $map{$input[$i]}) {
      $map{$input[$i]}++;
    }
    else {
      return $input[$i]; 
    }
  }
  return undef;
}

print firstRecurringCharacter(qw(2 5 1 2 3 5 1 2 4)),"\n";
print firstRecurringCharacter(qw(2 1 1 2 3 5 1 2 4)),"\n";
print firstRecurringCharacter(qw(2 3 4 5)),"\n";

print firstRecurringCharacter2(qw(2 5 1 2 3 5 1 2 4)),"\n";
print firstRecurringCharacter2(qw(2 1 1 2 3 5 1 2 4)),"\n";
print firstRecurringCharacter2(qw(2 3 4 5)),"\n";
