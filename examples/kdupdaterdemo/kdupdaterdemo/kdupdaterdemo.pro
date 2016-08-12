include (../../../KDUpdater.pri)

TEMPLATE = app
DESTDIR = $$KDUPDATER_BIN_PATH
QT += widgets
SOURCES += ../main.cpp \
    ../mainwindow.cpp \
    ../updaterdialog.cpp \
    ../updater.cpp
HEADERS += ../mainwindow.h \
    ../updaterdialog.h \
    ../updater.h
DEFINES += APP_VERSION="\\\"1.0\\\""
DESTREPODIR = $$KDUPDATER_BUILD_TREE/examples/kdupdaterdemo/updateserver

DEFINES += REPO_DIR="\\\"$$DESTREPODIR\\\""
RESOURCES += ../kdupdaterdemo.qrc
