#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings 'experimental::signatures';
use Data::Dumper; #Need this for simplifying printing of contents in complex DS

#This is the array implementation

package Node {
  sub new {
    my ($class, $args)  = @_;
    my $self = {
      value => $args->{value},
      next => undef,
    };
  }
}

package Stack {
  sub new {
    my $class = shift;
    my $self = {
      array => [],
    };
    bless $self, $class;
    return $self;
  }
  
  sub peek($self) {
    return $self->{array}[ $#{$self->{array}} ];
  }
  
  sub push($self, $value) {
    push(@{$self->{array}} , $value);
    return $self;
  }
  
  sub pop($self) {
    pop(@{$self->{array}});
    return $self;
  }
}

package Queue {
  sub new {
    my $class = shift;
    my $self = {
      array => [],
    };
    bless $self, $class;
    return $self;
  }
  
  sub peek($self) {
    return $self->{array}[0];
  }
  
  sub enqueue($self, $value) {
    push(@{$self->{array}} , $value);
    return $self;
  }
  
  sub dequeue($self) {
    shift(@{$self->{array}});
   return $self;
  }
}
#package main;
$Data::Dumper::Terse = 1;         # don't output names where feasible
my $my_stack = Stack->new();
$my_stack->push('google');
print Dumper($my_stack); 
$my_stack->push('udemy');
$my_stack->push('discord');
print Dumper($my_stack->peek());  #because the methods return referemce, we use
                                  # Dumper to print contents as strings.
$my_stack->pop();
print Dumper($my_stack->peek());


my $my_queue = Queue->new();
$my_queue->enqueue('Joy');
print Dumper($my_queue);
$my_queue->enqueue('Matt');
print Dumper($my_queue);
$my_queue->enqueue('Pavel');
print Dumper($my_queue);
$my_queue->peek();
print Dumper($my_queue);
$my_queue->dequeue();
print Dumper($my_queue);
$my_queue->dequeue();
print Dumper($my_queue);
$my_queue->dequeue();
print Dumper($my_queue);
$my_queue->dequeue();
print Dumper($my_queue);
