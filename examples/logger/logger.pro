TEMPLATE = app

include( ../../kdtools.pri)
DESTDIR = $$KDTOOLS_BIN_PATH

QT += widgets

CONFIG += console
SOURCES=logger.cpp
