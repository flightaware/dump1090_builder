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

if [ $# -lt 1 ]
then
  echo "syntax: $0 <wheezy|jessie>" >&2
  exit 1
fi

case $1 in
  wheezy|jessie) dist=$1 ;;
  *)
    echo "unknown build distribution $1" >&2
    echo "syntax: $0 <wheezy|jessie>" >&2
    exit 1
    ;;
esac

OUTDIR=$TOP/package-$dist

mkdir -p $OUTDIR

clone_or_update https://github.com/flightaware/dump1090.git dump1090-v1.2-3 $OUTDIR/dump1090

# copy our control files
rm -fr $OUTDIR/debian
mkdir $OUTDIR/debian
cp -r \
 $TOP/changelog \
 $TOP/common/* \
 $TOP/$dist/* \
  $OUTDIR/debian

case $dist in
  wheezy)
    echo "Updating changelog for wheezy backport build"
    dch --changelog $OUTDIR/debian/changelog --bpo --distribution wheezy-backports "Automated backport build via dump1090_builder"
    ;;
  jessie)
    ;;
  *)
    echo "You should fix the script so it knows about a distribution of $dist" >&2
    ;;
esac

# ok, ready to go.
echo "Ok, package is ready to be built in $OUTDIR"
echo "run 'dpkg-buildpackage -b' there (or move it to a Pi and do so there, or use pbuilder, etc)"
