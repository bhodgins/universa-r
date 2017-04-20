package Universa::SocketFilter; # Stub filter for socket stuff...

use Moose;

with 'Universa::Role::Filter';


has 'stream_handle' => (
    isa             => 'IO::Async::Stream',
    is              => 'ro',
    required        => 1,
    );

sub put { $_[0]->stream_handle->write( $_[1] ) }

__PACKAGE__->meta->make_immutable;
