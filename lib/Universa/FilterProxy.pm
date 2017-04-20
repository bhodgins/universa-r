package Universa::FilterProxy; # Syntatic sugar class for entities.
# usage: $entity->filter(STAGE)->add($filter_object);

use Moo;
use Types::Standard qw(ConsumerOf Str);


has 'entity_pass' => (
    isa           => ConsumerOf['Universa::Role::Entity'],
    is            => 'ro',
    required      => 1,
    );

has 'stage'       => (
    isa           => Str,
    is            => 'ro',
    required      => 1,
    );

sub add {
    my ($self, $filter) = @_;

    
}

__PACKAGE__->meta->make_immutable;
