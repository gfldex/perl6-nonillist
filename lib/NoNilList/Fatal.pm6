unit module NoNilList::Fatal;
use MONKEY-TYPING;

die 'NoNilList::Warning and NoNilList::Fatal are mutual exclusive' if ::NoNilList::Warning::('Warning');

class X::TypeCheck::NilToList is Exception is export {
   has $.message = ‚Trying to turn Nil into a List doesn't make sense.‘;
}

augment class Nil {
    method list() {
        X::TypeCheck::NilToList.new().fail();
    }
}

constant Fatal = True;
