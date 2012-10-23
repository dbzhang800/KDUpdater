CONFIG += kdtools_library_not_used
include (../../kdtools.pri)

TEMPLATE = app
TARGET = ufextractor
DEPENDPATH += . ../../src/KDUpdater ../../src
INCLUDEPATH +=. ../../src/KDUpdater ../../src
QT -= gui
CONFIG += console
macx:CONFIG -= app_bundle

DESTDIR = $$KDTOOLS_BIN_PATH

SOURCES     += main.cpp \
           ../../src/KDUpdater/kdupdaterufcompresscommon.cpp

HEADERS += ../../src/KDUpdater/kdupdaterufcompresscommon_p.h \
           ../../src/KDUpdater/kdupdaterufuncompressor_p.h \
           ../../src/KDToolsCore/kdsavefile.h \
           ../../src/KDToolsCore/kdmetamethoditerator.h

SOURCES += ../../src/KDUpdater/kdupdaterufuncompressor.cpp \
           ../../src/KDToolsCore/kdsavefile.cpp \
           ../../src/KDToolsCore/kdmetamethoditerator.cpp
