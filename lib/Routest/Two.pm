package Routest::Two;
use Mojo::Base 'Mojolicious::Controller';

sub hello {
  my $self = shift;
  $self->render_text( 'Hello from Two.pm!' );
}

1;
