# Dump1090 Package Builder

## FA version of dump1090

This is a companion builder to the public github FlightAware fork of dump1090, dump1090_mr.

PiAware can work with this or other versions of dump1090 or other programs that produce beast binary format on port 30005.

## Checking everything is up to date

Update dump1090_builder/changelog if needed.

Check the clone_or_update calls in sensible-build.sh to check that it is
including the correct repositories / branches.

## Prepare the package tree

Run dump1090_builder/sensible-build.sh. It will:

* create dump1090_builder/package/, the package directory
* check out dump1090 into package/
* copy some control files from dump1090_builder/sensible/ to package/debian/
* copy the changelog from dump1090_builder/changelog to package/debian/changelog

If you are going to be building on another machine, you can copy the
package directory there; it is selfcontained.

## Check build prerequisites

Ensure that your build machine has the build dependencies mentioned in
package/debian/control:

* build-essential
* debhelper
* librtlsdr-dev (you may need to build this yourself)
* libusb-1.0-0-dev
* pkg-config

If you use pdebuild it will do this for you.

## Build it

Change to the package directory on your build machine and build with a
debian package building tool of your choice:

  $ dpkg-buildpackage -b

or

  $ debuild

or

  $ pdebuild

etc.

## Fixing problems

If the build fails and you need to make some changes to fix it, you can
directly edit the contents of the package directory and rebuild. Once
you're happy you should commit the changes to the main repositories and
rerun sensible-build.sh - it will update / re-checkout the clones in
package/

The repositories under package/ are deliberately checked out in detached-
HEAD mode, both for sensibleness of updates and to discourage you from
doing any major changes directly in there!
