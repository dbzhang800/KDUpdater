include (../../KDUpdater.pri)

TEMPLATE    = app
DESTDIR = $$KDUPDATER_BIN_PATH

DEFINES -= QT_NO_KEYWORDS QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII

QT += widgets

TARGET      = SimpleExample

EXAMPLE_APP_DIR="$$OUT_PWD/apptempdata"

DEFINES += EXAMPLE_APP_DIR="\\\"$$EXAMPLE_APP_DIR\\\""

!build_pass:qmakeCleanAndCopy("$$PWD/appdata", "$$EXAMPLE_APP_DIR")

qmakeEcho("<UpdateSources>", ">", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("  <UpdateSource>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Name>LocalSource</Name>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Title>Local Update Source</Title>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Description>Update source from the local file system</Description>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Url>file:///$${PWD}/updateserver</Url>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("  </UpdateSource>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("</UpdateSources>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")

SOURCES     += src/main.cpp src/mainwindow.cpp
HEADERS     += src/mainwindow.h
FORMS       += src/mainwindow.ui

