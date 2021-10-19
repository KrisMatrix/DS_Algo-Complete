#!/usr/bin/perl
use warnings;
use strict;
use experimental 'signatures';
use Data::Dumper;

package Node {
  sub new {
    my ($class, $args) = @_;
    my $self = {
      left => undef,
      right => undef,
      value => $args,
    };
    bless $self, $class;
    return $self;
  }
}

package BinarySearchTree {
  sub new {
    my $class = shift;
    my $self = {
      root => undef,
    };
    bless $self, $class;
    return $self;
  }

  sub insert($self, $value) {
    my $new_node = Node->new($value);
    #print "New Node: $new_node\n";
    #print "Value: $value\n";
    #print "Node value:", $new_node->{value},"\n";
    if (!defined $self->{root}) {
      $self->{root} = $new_node;
    }
    else {
      my $currentNode = $self->{root};
      while(1) {
        #if new node is less than current node, go left. 
        # if there is no node on the left, then insert. If
        # there IS a node then, repeat.
        if ($value < $currentNode->{value}) {   #go to left side of tree
          if (!defined $currentNode->{left}) {
            $currentNode->{left} = $new_node;
            return $self;
          }
          $currentNode = $currentNode->{left};
        }
        else { # go to right side of tree
          if (!defined $currentNode->{right}) {
            $currentNode->{right} = $new_node;
            return $self;
          }
          $currentNode = $currentNode->{right};
        }
      }
    }
  }

  sub lookup($self, $value) {
    my $currentNode = $self->{root};
    while(1) {
      if (!defined $currentNode->{value}) { #we have reached an empty node 
        return 0;
      }
      else {
        if ($value < $currentNode->{value}) { #There is node. Check if lookup
                                              # value is less than value in
                                              # current node. If yes, go left.
          $currentNode = $currentNode->{left};
        }
        elsif ($value > $currentNode->{value}) {#There is node. Check if lookup
                                                # value is greater than value 
                                                # in current node. If yes, go 
                                                # right.
          $currentNode = $currentNode->{right};
        }
        else {
          return $currentNode;
        }
      }
    }
  }

  sub remove($self, $value) {
    if (!defined $self->{root}) {
      return 0;
    }
    my $currentNode = $self->{root};
    my $parentNode = undef;
    while (defined $currentNode) {
      if ($value < $currentNode->{value}) {
        $parentNode = $currentNode;
        $currentNode = $currentNode->{left};
      }
      elsif ($value > $currentNode->{value}) {
        $parentNode = $currentNode;
        $currentNode = $currentNode->{right};
      }
      elsif ($value == $currentNode->{value}) {
        if (!defined $currentNode->{right}) { #Option 1: no right child
          if (!defined $parentNode) {
            $self->{root} = $currentNode->{left};
          }
          else {
            if ($currentNode->{value} < $parentNode->{value}) {
              $parentNode->{left} = $currentNode->{left};
            }
            elsif ($currentNode->{value} > $parentNode->{value}) {
              $parentNode->{right} = $currentNode->{left};
            }
          }
        }
        elsif (!defined $currentNode->{right}->{left}) {  #Option 2: Right child doesn't have a left child
          if (!defined $parentNode) {
            $self->{root} = $currentNode->{left};
          }
          else {
            $currentNode->{right}->{left} = $currentNode->{left};
            #if parent  > current, make right child of the left the parent
            if ($currentNode->{value} < $parentNode->{value}) {
              $parentNode->{left} = $currentNode->{right};
            }
            #if parent < current, make right child a right child of the parent
            elsif ($currentNode->{value} > $parentNode->{value}) {
              $parentNode->{right} = $currentNode->{right};
            }
          }
        }
        else {  #Option 3: Right child that has a left child
          #find the right child's left most child
          my $leftmost = $currentNode->{right}->{left};
          my $leftmostParent = $currentNode->{right};
          while (!defined $leftmost->{left}) {
            $leftmostParent = $leftmost;
            $leftmost = $leftmost->{left};
          }

          #Parent's left subtree is now leftmost's right subtree
          $leftmostParent->{left} = $leftmost->{right};
          $leftmost->{left} = $currentNode->{left};
          $leftmost->{right} = $currentNode->{right};

          if (!defined $parentNode) {
            $self->{root} = $leftmost;
          }
          else {
            if ($currentNode->{value} < $parentNode->{value}) {
              $parentNode->{left} = $leftmost;
            }
            elsif ($currentNode->{value} > $parentNode->{value}) {
              $parentNode->{right} = $leftmost;
            }
          }
        }
        return 1;
      }
    }
  }

  sub breadthFirstSearch($self) {
    my $currentNode = $self->{root};
    my @list;
    my @queue;  #concern with BFS is that @queue can be become really large.
    push(@queue, $currentNode);

    while ($#queue >= 0) {  #while queue has contents
      $currentNode = shift @queue;
      push(@list, $currentNode->{value});
      if ($currentNode->{left}) {
        push(@queue, $currentNode->{left});
      }
      if ($currentNode->{right}) {
        push(@queue, $currentNode->{right});
      }
    }
    return @list;
  }

  sub recursiveBFS($self, $queue_ref, $list_ref) {
    my @queue = @{$queue_ref};
    my @list = @{$list_ref};
    if ($#queue < 0) {
      return @list;
    }
    my $currentNode = shift @queue;
    push(@list, $currentNode->{value});
    
    if ($currentNode->{left}) {
      push(@queue, $currentNode->{left});
    }
    if ($currentNode->{right}) {
      push(@queue, $currentNode->{right});
    }
    return $self->recursiveBFS(\@queue, \@list);
  }
}

my $tree = BinarySearchTree->new();

#             9
#         /       \
#       4         20
#     /   \     /    \
#    1    6     15    170

$tree->insert(9);
$tree->insert(4);
$tree->insert(20);
$tree->insert(1);
$tree->insert(6);
$tree->insert(15);
$tree->insert(170);
print "Simple BFS: ",join(",",$tree->breadthFirstSearch()),"\n";
print "Recursive BFS: ",join(",",$tree->recursiveBFS([$tree->{root}],[])),"\n";
#square brackets 
# to pass as 
# reference
