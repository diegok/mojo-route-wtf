use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('Routest');

$t->get_ok('/b')->status_is(200)->content_like(qr/Two/i);
$t->get_ok('/b?one=1')->status_is(200)->content_like(qr/One/i);

$t->get_ok('/a')->status_is(200)->content_like(qr/Two/i);

#Why this fails?
$t->get_ok('/a?one=1')->status_is(200)->content_like(qr/One/i);

done_testing();
