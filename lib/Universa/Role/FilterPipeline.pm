package Universa::Role::Filter;

use Moose::Role;


# By default, filters just pass through whatever:
sub put { @_[1 .. $#_] }
sub get { @_[1 .. $#_] }

1;
