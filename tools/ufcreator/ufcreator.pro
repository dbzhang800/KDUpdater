include (../../KDUpdater.pri)

TEMPLATE = app
TARGET = ufcreator
DEPENDPATH += . ../../src
INCLUDEPATH +=. ../../src
QT -= gui
CONFIG += console
macx: CONFIG -= app_bundle

DESTDIR = $$KDUPDATER_BIN_PATH

SOURCES     += main.cpp \
               kdupdaterufcompressor.cpp


