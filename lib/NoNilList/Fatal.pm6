unit module NoNilList::Fatal;

die 'NoNilList::Warning and NoNilList::Fatal are mutual exclusive' if ::NoNilList::Warning::('Warning');

constant Fatal = True;

use NoNilList 'Fatal';
