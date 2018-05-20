#!/bin/bash
SCRIPT_FILENAME="`cd \`dirname \"$0\"\`; pwd`/`basename \"$0\"`"
SCRIPT_ROOT=$(dirname "$SCRIPT_FILENAME")

set -e

usage()
{
   echo "$0 [qt src root directory] [install dir]"
   exit 1
}

[[ -z "$1" || -z "$2" ]] && usage

QTSRCDIR=$(realpath "$1")
[ ! -f "$QTSRCDIR/qtbase/.qmake.conf" ] && usage

DESTDIR=$(realpath "$2")
[ ! -d "$DESTDIR" ] && mkdir -p "$DESTDIR"

QTVERSION=$(grep "MODULE_VERSION = " "$QTSRCDIR/qtbase/.qmake.conf" | cut -d" " -f 3)

"$SCRIPT_ROOT/injectQtQuick1.sh" "$QTSRCDIR"

QTBUILDDIR=$QTSRCDIR-build
mkdir -p "$QTBUILDDIR"
cd "$QTBUILDDIR"

"$QTSRCDIR/configure" --prefix="$DESTDIR" -confirm-license -opensource -nomake examples -nomake tests -skip qtwebengine -icu -strip
make -j9
make install
