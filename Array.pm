package Common::Array;
use strict;
use Exporter 'import';

our @EXPORT_OK=qw/indexOf/;

sub indexOf {
    my $m=shift;
    for(my $i=0; $i <= scalar @_; $i++) { return $i if($m eq $_[$i]); }
    return undef;
}

1;
