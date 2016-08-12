CONFIG += kdtools_library_not_used
include (../../kdtools.pri)

TEMPLATE = app
TARGET = ufextractor
DEPENDPATH += . ../../src
INCLUDEPATH +=. ../../src
QT -= gui
CONFIG += console
macx:CONFIG -= app_bundle

DESTDIR = $$KDTOOLS_BIN_PATH

SOURCES     += main.cpp \
           ../../src/kdupdaterufcompresscommon.cpp

HEADERS += ../../src/kdupdaterufcompresscommon_p.h \
           ../../src/kdupdaterufuncompressor_p.h \
           ../../src/kdsavefile.h \
           ../../src/kdmetamethoditerator.h

SOURCES += ../../src/kdupdaterufuncompressor.cpp \
           ../../src/kdsavefile.cpp \
           ../../src/kdmetamethoditerator.cpp
