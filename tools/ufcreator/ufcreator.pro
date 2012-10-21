TEMPLATE = app
TARGET = ufcreator
DEPENDPATH += . ../../src/KDUpdater  ../../src
INCLUDEPATH +=. ../../src/KDUpdater  ../../src
QT -= gui
CONFIG += console
macx: CONFIG -= app_bundle

DESTDIR = ../../bin

SOURCES     += main.cpp \
           ../../src/KDUpdater/kdupdaterufcompresscommon.cpp

HEADERS += kdupdaterufcompressor.h \
           ../../src/KDUpdater/kdupdaterufcompresscommon_p.h

SOURCES += kdupdaterufcompressor.cpp


