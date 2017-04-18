package Universa::Role::Entity;

use Moose::Role;

# Used for lookups:
has '_channel_pass' => (
    does           => 'Universa::Role::Channel',
    is             => 'ro',
    );

# TODO

1;
