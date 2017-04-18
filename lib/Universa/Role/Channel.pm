package Universa::Role::Channel;

use Moose::Role;
use Universa::Entity;


has 'name'   => (
    isa      => 'Str',
    is       => 'ro',
    required => 1,
    );

sub entity {
    my ($self, $uuid, @args) = @_;

    Universa::Entity->new(
	channel_pass => $self,
	uuid         => $uuid,
	@args,
	);
}

1;
