use MONKEY-SEE-NO-EVAL;

class X::TypeCheck::NilToList is Exception is export {
   has $.message = ‚Trying to turn Nil into a List doesn't make sense.‘;
}

sub EXPORT($_?) {
    given $_ {
        when 'Warning' {
            Nil.^add_method('list', my method (Nil:) {
                note 'Trying to turn Nil into a list.';
                note Backtrace.new.list.tail.Str;
                Empty
            });
            Nil.^compose;
        }
        when 'Fatal' {
            Nil.^add_method('list', my method {
                 X::TypeCheck::NilToList.new().fail();
            });
            Nil.^compose;
        }
        default {
            die 'Please use NoNilList::Warning or NoNilList::Fatal.';
        }
    }
  %()
}
