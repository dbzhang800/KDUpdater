TEMPLATE = app
include (../../KDUpdater.pri)
DESTDIR = $$KDUPDATER_BIN_PATH

QT += widgets

SOURCES += kdthreadrunner_test.cpp
