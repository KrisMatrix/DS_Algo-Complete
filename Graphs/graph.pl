#!/usr/bin/perl
use warnings;
use strict;
use experimental 'signatures';

package Graph {
  sub new {
    my $class = shift;
    my $self = {
      numberOfNodes => 0,
      adjacentList => {},
    };

    bless $self, $class;
    return $self;
  }

  sub addVertex($self, $node) {
    $self->{adjacentList}{$node} = [];
    $self->{numberOfNodes}++;
  }

  sub addEdge($self, $node1, $node2) {
    push(@{$self->{adjacentList}{$node1}}, $node2);
    push(@{$self->{adjacentList}{$node2}}, $node1);
  }

  sub showConnections($self) {
    print "The number of nodes are: ",$self->{numberOfNodes},"\n";
    print "The nodes and edges in the graph are: ";
    foreach my $key (sort keys %{$self->{adjacentList}}) {
      print "$key: ",join(",",@{${$self->{adjacentList}}{$key}}),"\n";
    }

  }
}

my $myGraph = Graph->new();
#add vertices/nodes
$myGraph->addVertex('0');
$myGraph->addVertex('1');
$myGraph->addVertex('2');
$myGraph->addVertex('3');
$myGraph->addVertex('4');
$myGraph->addVertex('5');
$myGraph->addVertex('6');

#add edges
$myGraph->addEdge('0', '1');
$myGraph->addEdge('0', '2');
$myGraph->addEdge('2', '1');
$myGraph->addEdge('3', '1');
$myGraph->addEdge('2', '4');
$myGraph->addEdge('3', '4');
$myGraph->addEdge('5', '4');
$myGraph->addEdge('5', '6');

$myGraph->showConnections();
