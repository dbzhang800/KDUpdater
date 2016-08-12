include (../../KDUpdater.pri)

TEMPLATE = app
TARGET = ufextractor
DEPENDPATH += . ../../src
INCLUDEPATH +=. ../../src
QT -= gui
CONFIG += console
macx:CONFIG -= app_bundle

DESTDIR = $$KDUPDATER_BIN_PATH

SOURCES     += main.cpp
