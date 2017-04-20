package Universa::FilterPipeline;

use Moo;
use Types::Standard qw(ArrayRef ConsumerOf);

with 'Universa::Role::Filter';

has '_filters' => (
    isa        => ArrayRef[ ConsumerOf['Universa::Role::Filter'] ],
    is         => 'ro',
    );
    
# Outward:
sub put {
    my ($self, $data) = @_;

    foreach my $filter ( @{ $self->_filters } ) {
	$data = $filter->put($data);
    }

    $data;
}

# Inward:
sub get {
    my ($self, $data) = @_;

    foreach my $filter ( @{ $self->_filters } ) {
	$data = $filter->get($data);
    }

    $data;
}

__PACKAGE__->meta->make_immutable;
