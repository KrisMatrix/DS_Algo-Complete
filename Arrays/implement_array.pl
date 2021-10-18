#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings qw(experimental::signatures);

#I won't go into detail on perl objects, but I will provide a simple equivalent
# Package can be thought of a similar to Class in other languages
# $self is like 'this' in JS
# The arrow operator is like the dot operator in JS for objects.

package MyArray {

  sub new {
    my $class = shift;
    my $self = {
      length => 0,
      data => [],           #You are storing an array reference
    };
    bless $self, $class;
    return $self;
  }
  
  sub get($self, $index) {  #return value at index
    return $self->{data}[$index];
  }
  
  sub push($self, $value) { #push value to end of array and return length
    $self->{data}[$self->{length}] = $value;
    $self->{length}++;
    return $self->{length};
  }
  
  sub pop($self) {  #remove value at end of array and return the value
    my $lastItem = $self->{data}[$self->{length} - 1];
    delete $self->{data}[$self->{length} - 1];
    $self->{length}--;
    return $lastItem;
  }

  sub delete($self, $index) { #remove value at index
    my $deletedItem = $self->{data}[$index];
    $self->_shiftItems($index); 
    return $deletedItem;
  }

  sub _shiftItems($self, $index) {
    for my $i ($index..$self->{length}-1) {
      $self->{data}[$i] = $self->{data}[$i+1];
    }
    delete $self->{data}[$self->{length}-1];
    $self->{length} -= 1;
  }
}

package main;

my $newArray = new MyArray();
$newArray->push(3);
$newArray->push('hi');
$newArray->push('you');
$newArray->push(34);
$newArray->push(20);
$newArray->push('hey');
$newArray->push('welcome');
print "@{$newArray->{data}}\n"; #You are dereferencing an array.
$newArray->pop();
print "@{$newArray->{data}}\n"; #You are dereferencing an array.
print $newArray->delete(3),"\n";
print "@{$newArray->{data}}\n"; #You are dereferencing an array.

#EOF
