#!/usr/bin/perl
use warnings;
use strict;
use experimental 'signatures';

package Node {
  sub new {
    my ($class, $args) = @_;
    my $self = {
      data => $args,
      next => undef,
      prev => undef,
    };
    bless $self, $class;
    return $self;
  }
}

package DoublyLinkedList {
  sub new {
    my $class = shift;
    my $self = {
      head => undef,
      tail => undef,
    };
    bless $self, $class;
    return $self;
  }

  sub append($self, $data) {  #works
    my $new_node = Node->new($data);
    if (!defined $self->{head}) {
      $self->{head} = $new_node;
      $self->{tail} = $self->{head};
      $self->{length} = 1;
    }
    else {
      $self->{tail}->{next} = $new_node;
      $new_node->{prev} = $self->{tail};
      $self->{tail} = $new_node;
      $self->{length} += 1;
    }
  }

  sub prepend($self, $data) { #works
    my $new_node = Node->new($data); 
    $new_node->{next} = $self->{head};
    $self->{head}->{prev} = $new_node;
    $self->{head} = $new_node;
    $self->{length} += 1;
  }

  sub insert($self, $index, $data) {
    my $new_node = Node->new($data);
    if ($index == 0) {
      $self->prepnend($data);
      return
    }
    if ($index >= $self->{length}) {
      $self->append($data);
      return
    }
    else {
      my $leader = $self->traversetoindex($index-1);
      my $holder = $leader->{next};
      $leader->{next} = $new_node;
      $new_node->{next} = $holder;
      $new_node->{prev} = $leader;
      $holder->{prev} = $new_node;
      $self->{length} += 1;
    }
  }

#
  sub remove($self, $index) {
    if ($index == 0) {
      $self->{head} = $self->{head}->{next};
      $self->{length} -= 1;
      return
    }
    if ($index == $self->{length} - 1) {
      $self->{tail} = $self->{tail}->{prev};
      $self->{tail}->{next} = undef;
      $self->{length} -= 1;
      return
    }
    my $leader = $self->traversetoindex($index-1);
    my $unwanted_node = $leader->{next};
    my $holder = $unwanted_node->{next};
    $leader->{next} = $holder;
    $holder->{prev} = $leader;
    $self->{length} -= 1;
  }

  sub traversetoindex($self, $index) {
    my $curr_node = $self->{head};
    my $i = 0;
    while ($i != $index) {
      $curr_node = $curr_node->{next};
      $i += 1;
    }
    return $curr_node;
  }

  sub printt($self) {
    my $temp = $self->{head};
    while (defined $temp) {
      print $temp->{data},",";
      $temp = $temp->{next};
    }
    print "\n";
    print "Length = ", $self->{length},"\n";
  }
}

my $d = DoublyLinkedList->new();
$d->append(10);
$d->append(5);
$d->append(6);
$d->prepend(1);
$d->insert(2, 22);
$d->remove(3);
$d->printt();
