package Universa::Role::Entity;

use Moo::Role;
use Universa::FilterProxy;
use Types::Standard qw(Str ConsumerOf HashRef Any Undef Maybe);

# Used for lookups:
has 'channel_pass'     => (
    isa                => ConsumerOf['Universa::Role::Channel'],
    is                 => 'ro',
    );

has '_default_channel' => (
    isa                => ConsumerOf['Universa::Role::Channel'],
    is                 => 'rw',
    builder            => '_build_default_channel',
    );

has 'uuid'             => (
    isa                => Maybe[Str],
    is                 => 'ro',
    builder            => '_build_uuid',
    lazy               => 1,
    );

has 'info'             => (
    isa                => HashRef[ Any, Undef ],
    is                 => 'ro',
    lazy               => 1,
    builder            => '_build_info',
    );

has '_filter' => (
    isa                => ConsumerOf['Universa::FilterPipeline'],
    is                 => 'ro',
    lazy               => 1,
    builder            => '_build_filter',
    );

sub _build_filter { Universa::FilterPipeline->new }
sub _build_uuid { '' }
sub _build_info { {} }

sub _build_default_channel { shift->inventory }
sub in { $_[0]->_default_channel->in( @_[1 .. $#_] ) }

sub inventory {
    my $self = shift;

    # Inventories are always inventory:UUID
    $self->channel( 'inventory:' . $self->uuid );
}

requires 'BUILD';
after 'BUILD' => sub { shift->sync };

sub filter {
    my ($self, $stage, @args) = @_;

    Universa::FilterProxy->new(
	entity_pass => $self,
	stage       => $stage,
	@args,
	);
}

sub channel {
    my ($self, $name, @args) = @_;

    Universa::Channel->new(
	entity_pass => $self,
	name        => $name,
	@args,
	);
}

sub sync {

    # TODO: Sync with database
}

1;
