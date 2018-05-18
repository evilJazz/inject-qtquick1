TEMPLATE = lib
CONFIG += plugin
CONFIG -= check_examples 
CONFIG += install_ok
QT += declarative

DESTDIR +=  ../plugins
OBJECTS_DIR = tmp
MOC_DIR = tmp

TARGET = FileDialog

HEADERS +=      directory.h \
                file.h \
                dialogPlugin.h

SOURCES +=      directory.cpp \
                file.cpp \
                dialogPlugin.cpp
