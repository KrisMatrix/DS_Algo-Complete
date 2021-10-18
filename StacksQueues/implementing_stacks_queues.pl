#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings 'experimental::signatures';
use Data::Dumper; #Need this for simplifying printing of contents in complex DS

#This is the linkedlist implementation

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
      top => undef,
      bottom => undef,
      length => 0,
    };
    bless $self, $class;
    return $self;
  }
  
  sub peek($self) {
    #return $self->{top};
    return $self->{top};
  }
  
  sub push($self, $value) {
    my $newNode = Node->new({value => $value});
    if ($self->{length} == 0) {
      $self->{top} = $newNode;
      $self->{bottom} = $newNode;
    }
    else {
      my $holdingPointer = $self->{top};
      $self->{top} = $newNode;
      $self->{top}->{next} = $holdingPointer;
    }
    $self->{length}++;
    #return $self; #This will return reference.
    return $self;
  }
  
  sub pop($self) {
    if (!$self->{top}) {
      return undef;
    }
    if ($self->{top} == $self->{bottom}) {
      $self->{ottom} = undef;
    }
    #my $holdingPointer = $self->{top};
    $self->{top} = $self->{top}->{next};
    $self->{length}--;
    #return $holdingPointer;
    #return $self; #this will return reference
    return $self;
  }
}

package Queue {
  sub new {
    my $class = shift;
    my $self = {
      first => undef,
      last => undef,
      length => 0,
    };
  
    bless $self, $class;
    return $self;
  }
  
  sub peek($self) {
    return $self->{first};
  }
  
  sub enqueue($self, $value) {
    my $newNode = Node->new({value => $value});
    if ($self->{length} == 0) {
      $self->{first} = $newNode;
      $self->{last} = $newNode;
    }
    else {
      $self->{last}->{next} = $newNode;
      $self->{last} = $newNode;
    }
    $self->{length}++;
  }
  
  sub dequeue($self) {
    if (!$self->{first}) {
      return undef;
    }
    if ($self->{first} == $self->{last}) {
      $self->{last} = undef;
    }
    my $holdingPointer = $self->{first};
    $self->{first} = $self->{first}->{next};
    $self->{length}--;
    #return $self;
    return $holdingPointer;
  }
}

#package main;
$Data::Dumper::Terse = 1;         # don't output names where feasible

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
