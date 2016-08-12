TEMPLATE = app

include( ../../KDUpdater.pri)
DESTDIR = $$KDUPDATER_BIN_PATH

QT += widgets

CONFIG += console
SOURCES=logger.cpp
