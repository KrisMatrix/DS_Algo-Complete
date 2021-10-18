#!/usr/bin/perl
use warnings;
use strict;
use feature 'signatures';
no warnings qw(experimental::signatures);
use Data::Dumper;

package HashTable {
  sub new { 
    # constructor will create an array of a certain size
    my ($class, $args) = @_;
    my $self = {
      data => [],
    };
    if ($args->{size}) {
      $self->{data} = [('') x $args->{size}];
    }
  
    bless $self, $class;
    return $self;
  }
  
  sub _hash($self, $key) {
    my $hash = 0;
    my $length = @{$self->{data}};
    for (my $i = 0; $i < length($key); $i++) {
      $hash = ($hash + ord(substr($key,$i,1))*$i) % $length;
      #Note: Andrei uses JS where charCodeAt returns utf-16. ord() is giving
      # us Ascii number. The logic is the same, but values may be different.
    }
    return $hash;
  }
  
  sub set($self, $key, $value) {
    my $address = $self->_hash($key);
    if (!$self->{data}[$address]) {
      $self->{data}[$address] = [];
    }
    $self->{data}[$address] = [$key, $value];
  }
  
  sub get($self, $key) {
    my $address = $self->_hash($key);
    my @currentBucket = @{$self->{data}[$address]};
    if ($#currentBucket) {
      for (my $i = 0; $i <= $#currentBucket; $i++) {
        if ($currentBucket[$i] eq $key) {
          return $currentBucket[$i+1];
        }
      }
    }
    return undef;
  }
  
  sub keys($self) {
    my @keysArray;
    for (my $i = 0; $i < $#{$self->{data}}; $i++) {
      if ($self->{data}[$i]) {
        push(@keysArray, $self->{data}[$i][0]);
      }
    }
    return \@keysArray;
  }
}
package main;

my $my_hash_table = HashTable->new({size => 50});
$my_hash_table->set('grapes', 10000);
$my_hash_table->set('apples', 54);
$my_hash_table->get('apples');
print $my_hash_table->get('grapes'),"\n";
print $my_hash_table->get('apples'),"\n";
print Dumper($my_hash_table->keys()),"\n";
