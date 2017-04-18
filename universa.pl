#!/usr/bin/env perl

use warnings;
use strict;

use lib 'lib';
use Universa::Core qw(universa);
use Data::Dumper;
use IO::Async::Loop;

Universa::Core->new;
my $entity = universa->channel('foobar')->entity('test');
print Dumper $entity;

exit IO::Async::Loop->new->run;
