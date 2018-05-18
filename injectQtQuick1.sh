#!/bin/bash
SCRIPT_FILENAME="`cd \`dirname \"$0\"\`; pwd`/`basename \"$0\"`"
SCRIPT_ROOT=$(dirname "$SCRIPT_FILENAME")

set -e

usage()
{
   echo "$0 [qt src root directory]"
   exit 1
}

[ -z "$1" ] && usage

QTSRCDIR=$(realpath "$1")
QTQUICKDIR="$QTSRCDIR/qtquick1"

[ ! -f "$QTSRCDIR/qtbase/.qmake.conf" ] && usage

cd "$SCRIPT_ROOT"
cp -R qtquick1.594.patched "$QTQUICKDIR"

QTVERSION=$(grep "MODULE_VERSION = " "$QTSRCDIR/qtbase/.qmake.conf" | cut -d" " -f 3)
QTQUICKVERSION=$(grep "MODULE_VERSION = " "$QTQUICKDIR/.qmake.conf" | cut -d" " -f 3)

sed -i -e "s/$QTQUICKVERSION/$QTVERSION/g" "$QTQUICKDIR/.qmake.conf"

#cd "$QTQUICKDIR"
#mv "include/private/$QTQUICKVERSION" "include/private/$QTVERSION"

cd "$QTQUICKDIR"
rm -Rf "$QTQUICKDIR/include/QtDeclarative/$QTQUICKVERSION"

cd "$QTSRCDIR"
qtbase/bin/syncqt.pl "$QTQUICKDIR" -outdir "$QTQUICKDIR" -version "$QTVERSION"
