use strict;
use warnings;

package App::Blitz::Plugin::Markdown;
BEGIN {
  $App::Blitz::Plugin::Markdown::VERSION = '0.001';
}
use Carp qw(carp croak);
use Text::Markdown;
use UNIVERSAL;

sub md {
    my ( $self, $file ) = @_;
    open my $md, '<', $file
      or croak "Cannot open $file";
    my $parser = Text::Markdown->new;
    my $html = $parser->markdown( join( '', $haml ) );
    close $md or croak "Cannot close $file";
    return $html;
}
1;

# ABSTRACT: Markdown syntax parser for App::Blitz
