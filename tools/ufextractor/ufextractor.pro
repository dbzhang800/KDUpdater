TEMPLATE = app
TARGET = ufextractor
DEPENDPATH += . ../../src/KDUpdater ../../src
INCLUDEPATH +=. ../../src/KDUpdater ../../src
QT -= gui
CONFIG += console
macx:CONFIG -= app_bundle

DESTDIR = ../../bin

SOURCES     += main.cpp \
           ../../src/KDUpdater/kdupdaterufcompresscommon.cpp

HEADERS += ../../src/KDUpdater/kdupdaterufcompresscommon_p.h \
           ../../src/KDUpdater/kdupdaterufuncompressor_p.h \
           ../../src/KDToolsCore/kdsavefile.h \
           ../../src/KDToolsCore/kdmetamethoditerator.h

SOURCES += ../../src/KDUpdater/kdupdaterufuncompressor.cpp \
           ../../src/KDToolsCore/kdsavefile.cpp \
           ../../src/KDToolsCore/kdmetamethoditerator.cpp
