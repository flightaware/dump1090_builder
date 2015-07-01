#!/bin/bash

set -e
TOP=`dirname $0`

clone_or_update() {
  repo=$1
  branch=$2
  target=$3

  echo "Retrieving $branch from $repo"

  if [ -d $target/.git ]
  then
    (cd $target && git fetch origin)
  else
    git clone --depth=1 --no-single-branch $repo $target
  fi

  (cd $target && git checkout -q --detach $branch --)
  (cd $target && git log -1 --oneline)
}

# setup:

OUTDIR=$TOP/package

mkdir -p $OUTDIR

clone_or_update https://github.flightaware.com/flightaware/dump1090_mr.git origin/master $OUTDIR/dump1090

# copy our control files
rm -fr $OUTDIR/debian
mkdir $OUTDIR/debian
cp -r \
 $TOP/changelog \
 $TOP/sensible/* \
  $OUTDIR/debian

# ok, ready to go.
echo "Ok, package is ready to be built in $OUTDIR"
echo "run 'dpkg-buildpackage -b' there (or move it to a Pi and do so there, or use pbuilder, etc)"
