# NoNilList

[![Build Status](https://travis-ci.org/gfldex/perl6-nonillist.svg?branch=master)](https://travis-ci.org/gfldex/perl6-nonillist)

Warn or fail when turning Nil into a list.

## MOTIVATION

Nil can pop up in many places where one might not expect it. This is usually 
fine. It can become problematic when it is turned into a list.

```
sub niler { }

my @a = niler();
say so @a.elems == 1; # True

@a := niler.list;
say so @a.elems == 1; # True

for niler() {
    say 1; # 1
}
```

Here we turn the absense of a value into a list with one element.

## USAGE

`use NoNilList::Fatal;`

This will die on `Nil.list`.

`use NoNilList::Warnings;`

This will warn and return `Empty` on `Nil.list`.

## LICENSE

All files (unless noted otherwise) can be used, modified and redistributed
under the terms of the Artistic License Version 2. Examples (in the
documentation, in tests or distributed as separate files) can be considered
public domain.

ⓒ2019 Wenzel P. P. Peppmeyer
