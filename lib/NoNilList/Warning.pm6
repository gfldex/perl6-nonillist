unit module NoNilList::Warning;
use MONKEY-TYPING;

die 'NoNilList::Warning and NoNilList::Fatal are mutual exclusive' if ::NoNilList::Fatal::('Fatal');

augment class Nil {
    method list() {
        note 'Trying to turn Nil into a list.';
        note Backtrace.new.list.tail.Str;
        Empty
    }
}

constant Warning = True;
