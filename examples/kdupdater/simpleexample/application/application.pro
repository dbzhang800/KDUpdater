include (../../../../KDUpdater.pri)
include (../../kdupdater.pri)

TEMPLATE    = app
DESTDIR = $$KDUPDATER_BIN_PATH

DEFINES -= QT_NO_KEYWORDS QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII

QT += widgets

TARGET      = SimpleExample

EXAMPLE_APP_DIR="$$OUT_PWD/appdir"

DEFINES += EXAMPLE_APP_DIR="\\\"$$EXAMPLE_APP_DIR\\\""

!build_pass:qmakeCleanAndCopy("$$KDUPDATER_SOURCE_TREE/examples/data/kdupdater/simpleexample/appdir", "$$EXAMPLE_APP_DIR")

qmakeEcho("<UpdateSources>", ">", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("  <UpdateSource>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Name>LocalSource</Name>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Title>Local Update Source</Title>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Description>Update source from the local file system</Description>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Url>file:///$${KDUPDATER_SOURCE_TREE}/examples/kdupdater/simpleexample/updateserver</Url>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("  </UpdateSource>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("</UpdateSources>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")

SOURCES     += main.cpp mainwindow.cpp
HEADERS     += mainwindow.h
FORMS       += mainwindow.ui

