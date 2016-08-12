include (../../../KDUpdater.pri)
TEMPLATE    = app
DESTDIR = $$KDUPDATER_BIN_PATH

QT          += widgets script
TARGET      = CompatExample

EXAMPLE_APP_DIR="$$OUT_PWD/appdir"

DEFINES += EXAMPLE_APP_DIR="\\\"$$EXAMPLE_APP_DIR\\\""

!build_pass:qmakeCleanAndCopy("$$KDUPDATER_SOURCE_TREE/examples/data/compatexample/appdir", "$$EXAMPLE_APP_DIR")

qmakeEcho("<UpdateSources>", ">", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("  <UpdateSource>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Name>LocalSource</Name>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Title>Local Update Source</Title>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Description>Update source from the local file system</Description>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Url>file:///$${KDUPDATER_SOURCE_TREE}/examples/compatexample/updateserver</Url>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("  </UpdateSource>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("</UpdateSources>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")

SOURCES     += main.cpp mainwindow.cpp
HEADERS     += mainwindow.h

