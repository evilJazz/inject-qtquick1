inject-qtquick1
---------------

This little helper script injects the last supported version of QtQuick 1 taken from Qt 5.5.1 into a more recent Qt release. Currently tested with Qt 5.9.

Simply download the latest source release of Qt and extract it.

Run

    ./inject-qtquick1.sh <QTSRCDIR>

where QTSRCDIR is the root of the extracted Qt source code.

The script will inject the qtquick1.594.patched directory into the Qt source tree and update the version information and headers as required.

The subdirectory "qtquick1.594.patched" includes the patched copy of the pristine copy of "qtquick1.551.pristine" taken from the source code of Qt 5.5.1.

The convenience script

    ./compileQt.sh <QTSRCDIR> <QTDIR_INSTALLPATH>

can be used to inject QtQuick 1 and compile Qt in one swoop. This is currently only tested on Linux.
