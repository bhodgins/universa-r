package Universa::Role::ChannelCollector;

use Moose::Role;

use Universa::Channel;
use MooseX::Params::Validate;


has '_channels' => (
    isa         => 'HashRef[Universa::Channel|Undef]',
    is          => 'ro',
    lazy        => 1,
    builder     => '_build_channels',
    );

sub _build_channels { {} }

sub channel {
    my ($self, $name, @args) = @_;
    
    Universa::Channel->new( name => $name, @args );
}

1;
