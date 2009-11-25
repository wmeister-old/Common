package Common::Web;
use strict;
use URI::Escape;
use CGI ();
use Exporter 'import';

our @EXPORT_OK = qw/header redirect referer fatalError validUploadFileName/;
our $baseURL   = 'http://'. $ENV{SERVER_NAME};
our $cwdURL    = $baseURL . ($ENV{REQUEST_URI} =~ m#(.*/)[^/]*#)[0];

sub header {
    my ($type) = (@_);
    if($type =~ /^html$/i) {
        print "Content-type: text/html; charset=utf-8\n\n",
    } elsif($type =~ /^te?xt$/i) {
        print "Content-type: text/plain\n\n",
    }
}
sub referer { return (split /\?/, $ENV{'HTTP_REFERER'}, 2)[0]; }
sub fatalError {
    my ($url, $error) = (@_);
    redirect("$url?error=". uri_escape($error) );
    exit 0;
}
sub validUploadFileName {
    my ($fn) = (@_);
    return 1 if $fn =~ /^[a-zA-Z0-9_\.-]+$/;
    return 0;
}
sub redirect {
    print CGI->redirect($_[0]);
}

1;
