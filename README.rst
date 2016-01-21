
Truckee-LAFS
============

Truckee is near Tahoe. This branch of Tahoe-LAFS includes changes which are not
yet ready for inclusion upstream due to lack of review, tests, or other
reasons.

This branch will not be rebased, and is expected to occasionally have the
upstream Tahoe-LAFS master merged.

**Upstream was last merged into Truckee in January 2016.**

Current differences between Truckee and the Tahoe-LAFS upstream master which
don't have open pull requests:

- Support for multiple introducers (`#68`_)
- Support for introducerless operation (`#467`_)
- Connection hints for storage servers are listed on the welcome page, in
  addition to the resolved IP address. This is useful for troubleshooting grids
  that use Tor hidden services. There is no ticket for this, but the changes
  can be found in the `show-locations`_ branch.
- patches form meskio and bertagaz to make the paths of various directories
  configurable (`#2045`_)

These are the patches in truckee which *do* have open pull requests upstream:

- None currently, but there should be some soon.

Patches that were in truckee but are now merged upstream:

- tarcieri's redesigned directory listing page (`pull request #32`_)
- The list of storage servers on the WUI's welcome page includes a new "Space
  Available" column. (`#648`_)
- There is a new configuration option called ``peers.preferred`` which contains
  a list of storage server node IDs to move to the beginning of the server
  selection list. See ``configuration.rst`` for more information. (`#467`_)
- The "since" and "announced" columns have been replaced with more useful
  values (`#1973`_)

Truckee currently lives at https://github.com/leif/tahoe-lafs

This URL will display the full diff of truckee vs master:
https://github.com/tahoe-lafs/tahoe-lafs/compare/master...leif:truckee

Because truckee is not rebased, there are many duplicate or near-duplicate
commits in its history from merging and re-merging the in-progress feature
branches. Rebased feature branches should be findable via the linked tickets.

.. _#68: https://tahoe-lafs.org/trac/tahoe-lafs/ticket/68
.. _#467: https://tahoe-lafs.org/trac/tahoe-lafs/ticket/467
.. _#648: https://tahoe-lafs.org/trac/tahoe-lafs/ticket/648
.. _#1973: https://tahoe-lafs.org/trac/tahoe-lafs/ticket/1973
.. _#2045: https://tahoe-lafs.org/trac/tahoe-lafs/ticket/2045
.. _pull request #32: https://github.com/tahoe-lafs/tahoe-lafs/pull/32
.. _show-locations: https://github.com/leif/tahoe-lafs/commits/show-locations

==========
Tahoe-LAFS
==========

Tahoe-LAFS is a Free and Open decentralized cloud storage system. It distributes
your data across multiple servers. Even if some of the servers fail or are taken
over by an attacker, the entire file store continues to function correctly,
preserving your privacy and security.

To get started please see `quickstart.rst`_ in the docs directory.

LICENCE
=======

Copyright 2006-2016 The Tahoe-LAFS Software Foundation, and other contributors

You may use this package under the GNU General Public License, version 2 or, at
your option, any later version.  You may use this package under the Transitive
Grace Period Public Licence, version 1.0, or at your option, any later
version. (You may choose to use this package under the terms of either licence,
at your option.)  See the file `COPYING.GPL`_ for the terms of the GNU General
Public License, version 2.  See the file `COPYING.TGPPL.rst`_ for the terms of
the Transitive Grace Period Public Licence, version 1.0.

See `TGPPL.PDF`_ for why the TGPPL exists, graphically illustrated on three slides.

.. _quickstart.rst: https://github.com/tahoe-lafs/tahoe-lafs/blob/master/docs/quickstart.rst
.. _COPYING.GPL: https://github.com/tahoe-lafs/tahoe-lafs/blob/master/COPYING.GPL
.. _COPYING.TGPPL.rst: https://github.com/tahoe-lafs/tahoe-lafs/blob/master/COPYING.TGPPL.rst
.. _TGPPL.PDF: https://tahoe-lafs.org/~zooko/tgppl.pdf

----

.. image:: https://travis-ci.org/tahoe-lafs/tahoe-lafs.png?branch=master
  :target: https://travis-ci.org/tahoe-lafs/tahoe-lafs

.. image:: https://coveralls.io/repos/tahoe-lafs/tahoe-lafs/badge.png?branch=master
  :target: https://coveralls.io/r/tahoe-lafs/tahoe-lafs?branch=master
