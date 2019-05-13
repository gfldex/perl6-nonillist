use MONKEY-SEE-NO-EVAL;

class X::TypeCheck::NilToList is Exception is export {
   has $.message = ‚Trying to turn Nil into a List doesn't make sense.‘;
}

sub EXPORT($_?) {
    given $_ {
        when 'Warning' {
            EVAL ‚use MONKEY-TYPING; augment class Nil {
                method list() {
                    note 'Trying to turn Nil into a list.';
                    note Backtrace.new.list.tail.Str;
                    Empty
                }
            }‘;

        }
        when 'Fatal' {
            EVAL ‚use MONKEY-TYPING; augment class Nil {
               method list() {
                   X::TypeCheck::NilToList.new().fail();
               }
            }‘;
        }
        default {
            die 'Please use NoNilList::Warning or NoNilList::Fatal.';
        }
    }
  %()
}
