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
DESTREPODIR = $$KDTOOLS_BUILD_TREE/examples/kdupdaterdemo/updateserver

DEFINES += REPO_DIR="\\\"$$DESTREPODIR\\\""
RESOURCES += ../kdupdaterdemo.qrc
