include (../../KDUpdater.pri)

TEMPLATE    = app
DESTDIR = $$KDUPDATER_BIN_PATH

QT          += widgets script
TARGET      = FirmwareDemo

EXAMPLE_APP_DIR="$$OUT_PWD/apptempdata"

DEFINES += EXAMPLE_APP_DIR="\\\"$$EXAMPLE_APP_DIR\\\""

!build_pass:qmakeCleanAndCopy("$$PWD/appdata", "$$EXAMPLE_APP_DIR")

UPDATEURL = file:///$$PWD/updateserver
UPDATEURL = $$replace(UPDATEURL, file:////, file:///)

qmakeEcho("<UpdateSources>", ">", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("  <UpdateSource>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Name>KDABSource</Name>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Title>KDAB Update Source</Title>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Description>Update source from KDAB</Description>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Url>$$UPDATEURL</Url>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("  </UpdateSource>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("</UpdateSources>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")

SOURCES     += src/main.cpp src/mainwindow.cpp src/helpdialog.cpp
HEADERS     += src/mainwindow.h src/helpdialog.h
