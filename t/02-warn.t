use Test;
plan 1;

use NoNilList::Warning;

sub niler { Nil }

class CaptureWarn {
    my $.warnings;
    my $.last-warning;
    method print(|c) { $.warnings ~= c; $.last-warning = c }
}

my $*ERR = CaptureWarn.new;

niler.list;

ok $*ERR.warnings.contains(‚Trying to turn Nil into a list.‘), ‚Warn on Nil.list.‘;
