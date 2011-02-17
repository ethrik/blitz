use strict;
use warnings;

package App::Blitz;
use Module::Pluggable require => 1;
our $VERSION = '0.1.0';

sub css {
    my ( $self, $file ) = @_;
    my ( $ext, $css );
    if ( $file =~ /^(.*)\.(.*)$/xi ) {
        $ext = $2;
    }
    foreach my $plugin ( $self->plugins ) {
        $css = $plugin->$ext($file) if $plugin->can($ext);
    }
    eval { require CSS::Packer; } or return $css;
    my $packer = CSS::Packer->init();
    $packer->minify( \$css, { remove_comments => 1, remove_newlines => 1 } );
    return $css;
}

sub html {
    my ( $self, $file ) = @_;
    my ( $ext, $html );
    if ( $file =~ /^(.*)\.(.*)$/xi ) {
        $ext = $2;
    }
    foreach my $plugin ( $self->plugins ) {
        $html = $plugin->$ext($file) if $plugin->can($ext);
    }
    eval { require HTML::Packer; } or return $html;
    my $packer = HTML::Packer->init();
    $packer->minify( \$html, { remove_comments => 1, remove_newlines => 1 } );
    return $html;
}
1;
