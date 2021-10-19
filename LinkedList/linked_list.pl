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
    };
    bless $self, $class;
    return $self;
  }
}

package LinkedList {
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
      $self->{tail} = $new_node;
      $self->{length} += 1;
    }
  }

  sub prepend($self, $data) { #works
    my $new_node = Node->new($data); 
    $new_node->{next} = $self->{head};
    $self->{head} = $new_node;
    $self->{length} += 1;
  }

  sub insert($self, $index, $data) {
    my $new_node = Node->new($data);
    my $i = 0;
    my $temp = $self->{head};
    if ($index >= $self->{length}) {
      $self->append($data);
      return
    }
    if ($index == 0) {
      $self->prepend($data);
      return
    }
    while ($i < $self->{length}) {
      if ($i == $index-1) {
        my $temp2 = $temp->{next};
        $temp->{next} = $new_node;
        $new_node->{next} = $temp2;
        $self->{length} += 1;
        last;
      }
      $temp = $temp->{next};
      $i += 1;
    }
  }

  sub remove($self, $index) {
    my $temp = $self->{head};
    my $i = 0;
    if ($index >= $self->{length}) {
      print "Entered wrong index\n"; 
    }

    if ($index == 0) {
      $self->{head} = $self->{head}->{next};
      $self->length -= 1;
      return
    }

    while ($i < $self->{length}) {
      if ($i == $index - 1) {
        $temp->{next} = $temp->{next}->{next};
        $self->{length} -= 1;
        last;
      }
      $i += 1;
      $temp = $temp->{next};
    }
  }

  sub printl($self) {
    my $temp = $self->{head};
    while (defined $temp) {
      print $temp->{data},",";
      $temp = $temp->{next};
    }
    print "\n";
    print "Length = ", $self->{length},"\n";
  }

  sub reverse($self) {
    my $prev = undef;
    my $temp;
    $self->{tail} = $self->{head};
    while (defined $self->{head}) {
      $temp = $self->{head};
      $self->{head} = $self->{head}->{next};
      $temp->{next} = $prev;
      $prev = $temp;
    }
    $self->{head} = $temp;
  }
}

my $l = LinkedList->new();
$l->append(10);
$l->printl();
$l->append(5);
$l->printl();
$l->append(6);
$l->printl();
$l->prepend(1);
$l->printl();
$l->prepend(4);
$l->printl();
$l->insert(2, 99);
$l->printl();
$l->insert(34, 23);
$l->remove(2);
$l->printl();
$l->reverse();
$l->printl();
print $l->{head}->{data},", ", $l->{tail}->{data},"\n";
