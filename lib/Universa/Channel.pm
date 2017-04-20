package Universa::Channel;

use Moose;


sub BUILD {}

with 'Universa::Role::Channel';

__PACKAGE__->meta->make_immutable;
