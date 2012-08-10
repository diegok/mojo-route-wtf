package Routest::One;
use Mojo::Base 'Mojolicious::Controller';

sub hello {
  my $self = shift;
  $self->render_text( 'Hello from One.pm!' );
}

1;
