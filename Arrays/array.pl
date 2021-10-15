#!/usr/bin/perl
use warnings;
use strict;

=pod 

=head1 NAME

Array Operations and their Big O.

=head1 DESCRIPTION

This script shows simple array operations in perl and their Big O notation.

=cut

my @strings = qw(a b c d);
print "Initial: @strings\n";

#push
push(@strings, 'e');  #O(1)
print "Push: @strings\n";

#pop
pop(@strings);        #O(1)
print "Pop: @strings\n";

#push and pop are O(1) because you add and remove only
# from the end. You don't need to readjust the array.

#unshift
unshift(@strings, 'x'); #O(n)
print "Unshift: @strings\n";

#shift
shift(@strings);      #O(n)
print "Shift: @strings\n";

#shift and unshift are O(n) because we add and remove from
# the beginning, and this means all the values that follow
# need to be shifted as well.

#splice
splice(@strings,2,1,'y'); #O(n)
print "Splice: @strings\n";

#Splice, like shift/unshift is an O(n). You are inserting
# elements in between and this will cause the elments 
# following the insertion point to shift.

#EOF
