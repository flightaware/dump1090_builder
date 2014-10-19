# Dump1090 Package Builder

## FA version of dump1090

This is a companion builder to the public github FlightAware fork of dump1090, dump1090_mr.

PiAware can work with this or other versions of dump1090 or other programs that produce beast binary format on port 30005.

## Prerequisites

Install base packages
* dh-make
* lintian
* chrpath
* dpkg-sig

## Update system just to be safe

* sudo apt-get update
* sudo apt-get upgrade

## Update version numbers

* dump1090_mr/faup1090.h

To change the package version and/or package name
change PKG and/or VERSION in to top level of dump1090_builder:
* Makefile
* shellrc
		
## Make sure all involved packages are up to date

On a Raspberry Pi make sure you have installed all the software that
contributes to this build.  This includes:

* build and install rtlsdr, git clone git://git.osmocom.org/rtl-sdr.git
* build and install dump1090 and faup1090 by cloning the repo from
https://github.com/flightaware/dump1090_mr and doing

```
make
make -f makefaup1090
sudo make -f makefaup1090 full-install
```

## Possibly change the list of files that will be shipped

To change the actual contents of the debian package, edit:
* ship-list
* files/Makefile
	
## Build the package

To create a new .deb package:

* Create a src directory in your home directory and clone dump1090_builder there.

```
make pkg
cd dump1090-1.0
../files/xfer
```

The make pkg, unpacks, and repacks the source code into a 
correctly-formatted tarball with a name that dh_make recognizes.

'xfer' copies over some files necessary for the debian package to build, 
and then runs "dpkg-buildpackage -rfakeroot"

It also creates the package directory with the expected name and format (dump1090-1.90/).

There''s a pause during the process where I copy in a debian changelog.

The script offers to run lintian, which is a lint for debian packages.  It
takes a while but is a good idea, of course.

