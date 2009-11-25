package Common::Time;
use strict;
use POSIX qw/strftime/;
use Exporter 'import';

our @EXPORT_OK = qw(curDate  curTime);

sub curDate { return strftime("%D", localtime($_[0]) ); }
sub curTime { return strftime("%r", localtime($_[0]) ); }

1;
