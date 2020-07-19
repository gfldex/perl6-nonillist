use Test;
plan 2;

use NoNilList::Warning;

sub niler { Nil }

class CaptureWarn {
    my $.warnings;
    my $.last-warning;
    method print(|c) { $.warnings ~= c; $.last-warning = c }
}

my $*ERR = CaptureWarn.new;

ok niler.list === Empty, ‚Nil.list returns Empty‘;

# say $*ERR.warnings;

ok $*ERR.warnings.contains(‚Trying to turn Nil into a list.‘), ‚Warn on Nil.list.‘;
