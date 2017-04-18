package Universa::Core;

use Moose;
use Moose::Exporter;


Moose::Exporter->setup_import_methods(
    as_is => [ 'universa' => \&universa ],
    );

# Singleton stuff:
our $UNIVERSA;
sub BUILD  { $Universa::Core::UNIVERSA||= shift }
sub universa { $Universa::Core::UNIVERSA }

with 'Universa::Role::Channel';
with 'Universa::Role::ChannelCollector';

# Channel name overload:
has 'name'  => (
    isa     => 'Str',
    is      => 'ro',
    default => 'universa',
    );

__PACKAGE__->meta->make_immutable;
