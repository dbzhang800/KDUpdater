include (../../../../kdtools.pri)
include (../../kdupdater.pri)

TEMPLATE    = app

QT          += widgets script
TARGET      = FirmwareDemo

CONFIG += kdupdaterguitextbrowser

kdupdaterguitextbrowser {
    DEFINES += KDUPDATERGUITEXTBROWSER KDUPDATERVIEW=QTextBrowser
    QT += gui
}
kdupdaterguiwebview {
    DEFINES += KDUPDATERGUIWEBVIEW KDUPDATERVIEW=QWebView
    QT += gui webkit
}

EXAMPLE_APP_DIR="$$OUT_PWD/appdir"

DEFINES += EXAMPLE_APP_DIR="\\\"$$EXAMPLE_APP_DIR\\\""

out_of_source_build:qmakeCleanAndCopy("$$PWD/appdir", "$$EXAMPLE_APP_DIR")

qmakeEcho("<UpdateSources>", ">", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("  <UpdateSource>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Name>KDABSource</Name>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Title>KDAB Update Source</Title>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Description>Update source from KDAB</Description>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("    <Url>file:///$${KDTOOLS_BASE}/examples/kdupdater/firmwaredemo/updateserver</Url>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("  </UpdateSource>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")
qmakeEcho("</UpdateSources>", ">>", "$$EXAMPLE_APP_DIR/UpdateSources.xml")

SOURCES     += main.cpp mainwindow.cpp helpdialog.cpp
HEADERS     += mainwindow.h helpdialog.h
