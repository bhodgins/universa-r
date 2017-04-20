package Universa::Role::Filter;

use Moose::Role;
use Types::Standard qw(Str);

has 'stage' => (
    isa     => Str,
    is      => 'ro',
    default => '',
    lazy    => 1,
    );

# By default, filters just pass through whatever:
sub put { @_[1 .. $#_] }
sub get { @_[1 .. $#_] }

1;
