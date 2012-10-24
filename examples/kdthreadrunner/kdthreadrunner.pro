TEMPLATE = app
include (../../kdtools.pri)
DESTDIR = $$KDTOOLS_BIN_PATH

QT += widgets

SOURCES += kdthreadrunner_test.cpp
