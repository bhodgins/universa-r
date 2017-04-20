package Universa::Role::Channel;

use Moo::Role;
use Universa::Entity;
use Types::Standard qw(ConsumerOf Str Maybe);

has 'entity_pass' => (
    does          => ConsumerOf['Universa::Role::Entity'],
    is            => 'ro',
    );

has 'name'        => (
    isa           => Str,
    is            => 'ro',
    required      => 1,
    );

has 'filter'      => (
    isa           => Maybe[ ConsumerOf['Universa::Role::Filter'] ],
    is            => 'rw',
    default       => undef,
    );

requires 'BUILD';
after 'BUILD' => sub { shift->sync };

sub sync {

    # TODO: Sync with database
}

sub put {
    
}

sub entity {
    my ($self, $uuid, @args) = @_;

    Universa::Entity->new(
	channel_pass => $self,
	uuid         => $uuid,
	@args,
	);
}

1;
