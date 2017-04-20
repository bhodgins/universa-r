package Universa::FilterPipeline::Named;

use Moo;
use Types::Standard qw(ConsumerOf HashRef);

with 'Universa::Role::Filter';

has '_filters' => (
    isa        => HashRef[ ConsumerOf['Universa::Role::Filter'] ],
    is         => 'ro',
    );

sub put {
    
}

sub get {
    
}

sub set {

}

__PACKAGE__->meta->make_immutable;
