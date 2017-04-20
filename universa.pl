#!/usr/bin/env perl

use warnings;
use strict;

use lib 'lib';
use Universa::Core qw(universa);
use Universa::SocketFilter;
use Data::Dumper;
use IO::Async::Loop;
use IO::Async::Listener;

Universa::Core->new;
my $loop = IO::Async::Loop->new;

my $listener = IO::Async::Listener->new(
    on_stream => sub {
	my (undef, $stream) = @_;

	# Begin the login process:
	my $unknown_player = universa->entity;
	my $so_terminal = Universa::SocketFilter->new(stream_handle => $stream);
	$unknown_player->filter($so_terminal);
	
	$stream->configure(
	    on_read => sub {
		my ($self, $buffref, $eof) = @_;

		# On data
		$buffref = '';
		return 0;
	    },
	    );

	$loop->add($stream);
    },
    );

$loop->add($listener);
$listener->listen(
    addr => {
	family   => 'inet',
	port     => 9801,
	ip       => '0.0.0.0',
	socktype => 'stream',
    }
    )->get;

print "Ready.\n";
exit $loop->run;
