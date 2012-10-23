include (../../../kdtools.pri)

TEMPLATE = app
QT += widgets
SOURCES += ../main.cpp \
    ../mainwindow.cpp \
    ../updaterdialog.cpp \
    ../updater.cpp
HEADERS += ../mainwindow.h \
    ../updaterdialog.h \
    ../updater.h
DEFINES += APP_VERSION="\\\"1.0\\\""
DESTREPODIR = $$KDTOOLS_SOURCES_TREE/examples/data/kdupdaterdemo/repository

DEFINES += REPO_DIR="\\\"$$DESTREPODIR\\\""
out_of_source_build:message("OUT OF SOURCE BUILD")
RESOURCES += ../kdupdaterdemo.qrc
