# DBD::Mock [![Build Status](https://api.travis-ci.org/ravengerUA/dbd-mock.png)](https://travis-ci.org/ravengerUA/dbd-mock)

This is a simple mock DBD implementation used for testing. It's
entirely self-contained so that you can extract the single library
file (DBD/Mock.pm), put it in your own distribution and be able to run
DBI-based tests even though you don't have information about a
database. (If you're doing so you should probably get rid of the docs
to save space...)

## INSTALLATION

To install this module type the following:

   perl Makefile.PL
   make
   make test
   make install

## DEPENDENCIES

This module requires these other modules and libraries:

  DBI (wouldn't make too much sense without it...)

## COPYRIGHT AND LICENCE

Copyright (C) 2004 Chris Winters <chris@cwinters.com>
Copyright (C) 2004-2007 Stevan Little <stevan@iinteractive.com>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 