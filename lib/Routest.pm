package Routest;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Router
  my $r = $self->routes;
  my $unbridged = $r->bridge('/')->to( cb => sub { 1 } );
  my $bridged = $r->bridge('/')->to( cb => sub { 1 } );

  $r->add_condition( has_param_one => sub { $_[1]->param('one') } );

  # This fails
  # Go to: /a
  # Go to: /a?one=1
  $unbridged->get('/a')->over('has_param_one')->to('one#hello');
  $bridged->get('/a')->to('two#hello');

  # This works
  # Go to: /b
  # Go to: /b?one=1
  $r->get('/b')->over('has_param_one')->to('one#hello');
  $r->bridge('/b')->to( cb => sub { 1 } )->get('/')->to('two#hello');
}

1;
