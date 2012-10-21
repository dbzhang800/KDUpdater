TEMPLATE    = app

TARGET      = CompressorTest

include(../stage.pri)

INCLUDEPATH += ../../tools/ufcreator ../../src/KDUpdater

SOURCES     += main.cpp

HEADERS += ../../tools/ufcreator/kdupdaterufcompressor.h \

SOURCES += ../../tools/ufcreator/kdupdaterufcompressor.cpp \
