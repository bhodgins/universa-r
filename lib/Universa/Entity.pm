package Universa::Entity;

use Moose;


sub BUILD {}

with 'Universa::Role::Entity';

__PACKAGE__->meta->make_immutable;
