package Common::File;
use strict;
use Text::Template;
use Exporter 'import';

our @EXPORT_OK = qw(fContent    template    safeSlurp
                    slurp       hSlurp      mTime);

# Writing:

sub makes {
    my ($f,$c) = (@_);
    open FH, ">$f";
    print FH $c;
    close FH;
}

# Reading:

sub template {
    my ($fn,%h) = (@_);
    my $tmpl=Text::Template->new(TYPE => 'FILE', SOURCE => $fn);
    return $tmpl->fill_in(HASH => \%h);
}
sub safeSlurp {
    my ($f) = (@_);
    return (-f $f) ? slurp($f) : '';
}
sub slurp {
    open FH, $_[0];
    my $c = do { local $/; <FH>; };
    close FH;
    return $c;
}
sub hSlurp {
    my ($fh) = (@_);
    return do { local $/; <$fh>; };
}

# Info:

sub mTime { return [stat($_[0])]->[9]; }

1;
