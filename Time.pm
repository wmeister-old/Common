package Common::Time;
use strict;
use POSIX qw/strftime/;
use Exporter 'import';

our @EXPORT_OK = qw(prettyDate  prettyTime);

sub prettyDate { return strftime("%D", localtime($_[0]) ); }
sub prettyTime { return strftime("%r", localtime($_[0]) ); }

1;
