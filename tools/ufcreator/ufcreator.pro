CONFIG += kdtools_library_not_used
include (../../kdtools.pri)

TEMPLATE = app
TARGET = ufcreator
DEPENDPATH += . ../../src
INCLUDEPATH +=. ../../src
QT -= gui
CONFIG += console
macx: CONFIG -= app_bundle

DESTDIR = $$KDTOOLS_BIN_PATH

SOURCES     += main.cpp \
           ../../src/kdupdaterufcompresscommon.cpp

HEADERS += kdupdaterufcompressor.h \
           ../../src/kdupdaterufcompresscommon_p.h

SOURCES += kdupdaterufcompressor.cpp


