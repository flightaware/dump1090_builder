#!/bin/bash

set -e
TOP=`dirname $0`

clone_or_update() {
  repo=$1
  branch=$2
  target=$3

  if [ -d $target/.git ]
  then
    (cd $target; git pull; git checkout $branch)
  else
    git clone --depth=1 $repo $target -b $branch
  fi
}

# setup:

OUTDIR=$TOP/package

mkdir -p $OUTDIR
clone_or_update https://github.com/flightaware/dump1090.git sensible $OUTDIR/dump1090

# copy our control files
rm -fr $OUTDIR/debian
mkdir $OUTDIR/debian
cp \
 $TOP/changelog \
 $TOP/sensible/* \
  $OUTDIR/debian

# ok, ready to go.
echo "Ok, package is ready to be built in $OUTDIR"
echo "run 'dpkg-buildpackage -b' there (or move it to a Pi and do so there, or use pbuilder, etc)"
