unit module NoNilList::Warning;

die 'NoNilList::Warning and NoNilList::Fatal are mutual exclusive' if ::NoNilList::Fatal::('Fatal');

constant Warning = True;

use NoNilList 'Warning';

