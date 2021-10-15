#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings qw(experimental::signatures);

sub reverse_string($string) {
  my @reverse_string;
  #check input
  if (!$string || length($string) < 2) {
    return "hmm that is not good";
  }
  my @string = split('', $string);
  for (my $i = length($string)-1; $i >= 0; $i--) {
    push(@reverse_string, $string[$i]); 
  }
  return @reverse_string;
}

my $string = 'KrisMatrix';
print $string,"\n";
print reverse_string($string),"\n";
print scalar reverse $string,"\n";  #reverse acts on array. If passed a string,
                                    # it converts to array then returns the
                                    # reverse array. scalar keywords changes
                                    # type from array to scalar. This gives us
                                    # a reversed string instead of reversed 
                                    # array.
#EOF                                  
