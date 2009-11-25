package Common::File;
use strict;
use Text::Template;
use File::Temp 'tempfile';
use Exporter 'import';

our @EXPORT_OK = qw(fContent    template    safeSlurp
                    slurp       hSlurp      mTime);

# Writing:

sub make {
    my ($f,$c) = (@_);
    my ($tfh, $tfn) = tempfile();
    print $tfh $c;
    rename($tfn, $f) or return 0;
    return 1;
}

# Reading:

sub template {
    my ($fn,%h) = (@_);
    my $tmpl = Text::Template->new(TYPE => 'FILE', SOURCE => $fn);
    return $tmpl->fill_in(HASH => \%h);
}
sub slurp {
    my ($f) = (@_);
    return (-f $f) ? slurp($f) : undef;
}
sub _slurp {
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
