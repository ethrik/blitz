use strict;
use warnings;

package App::Blitz::Plugin::Haml;
use Carp qw(carp croak);
use Text::Haml;
use UNIVERSAL;

sub haml {
    my ( $self, $file ) = @_;
    open my $haml, '<', $file
      or croak "Cannot open $file";
    my $parser = Text::Haml->new;
    $parser->format('html5');
    my $html = $parser->render( join( '', $haml ) );
    close $haml or croak "Cannot close $file";
    return $html;
}
1;
