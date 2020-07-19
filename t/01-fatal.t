use Test;
plan 2;

use NoNilList::Fatal;

sub niler { Nil }

fails-like { niler().list }, X::TypeCheck::NilToList, 'Converting Nil to List directly fails.';
throws-like { .say for niler() }, X::TypeCheck::NilToList, 'Converting Nil to List indirectly fails.';

