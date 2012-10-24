include (../../../../kdtools.pri)
include (../../kdupdater.pri)
TEMPLATE    = app

QT          += widgets script
TARGET      = CompatExample

EXAMPLE_APP_DIR="$$OUT_PWD/appdir"

DEFINES += EXAMPLE_APP_DIR="\\\"$$EXAMPLE_APP_DIR\\\""

!build_pass:qmakeCleanAndCopy("$$KDTOOLS_SOURCE_TREE/examples/data/kdupdater/compatexample/appdir", "$$EXAMPLE_APP_DIR")

qmakeEcho("<UpdateSources>", ">", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("  <UpdateSource>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Name>LocalSource</Name>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Title>Local Update Source</Title>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Description>Update source from the local file system</Description>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Url>file:///$${KDTOOLS_SOURCE_TREE}/examples/kdupdater/compatexample/updateserver</Url>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("  </UpdateSource>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("</UpdateSources>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")

SOURCES     += main.cpp mainwindow.cpp
HEADERS     += mainwindow.h

