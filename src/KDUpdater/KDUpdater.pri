TEMPLATE    = lib

QT          += xml network
QT -= gui

# Input
INSTALLHEADERS = \
           $$PWD/kdupdater.h \
           $$PWD/kdupdaterpackagesinfo.h \
           $$PWD/kdupdaterapplication.h \
           $$PWD/kdupdatertarget.h \
           $$PWD/kdupdaterupdatesourcesinfo.h \
           $$PWD/kdupdaterupdate.h \
           $$PWD/kdupdaterupdateoperation.h \
           $$PWD/kdupdaterupdateoperationfactory.h \
           $$PWD/kdupdaterupdatefinder.h \
           $$PWD/kdupdaterupdateinstaller.h \
           $$PWD/kdupdatertask.h \
           $$PWD/kdupdaterfiledownloader.h \
           $$PWD/kdupdaterfiledownloaderfactory.h \
           $$PWD/kdupdaterpackagesmodel.h \
           $$PWD/kdupdaterupdatesourcesmodel.h \
           $$PWD/kdupdaterupdatesmodel.h \

PRIVATEHEADERS = $$PWD/kdupdaterfiledownloader_p.h \
                 $$PWD/kdupdaterupdateoperations_p.h \
                 $$PWD/kdupdaterupdatesinfo_p.h \

SOURCES += $$PWD/kdupdaterpackagesinfo.cpp \
           $$PWD/kdupdaterapplication.cpp \
           $$PWD/kdupdatertarget.cpp \
           $$PWD/kdupdaterupdatesourcesinfo.cpp \
           $$PWD/kdupdaterupdate.cpp \
           $$PWD/kdupdaterfiledownloader.cpp \
           $$PWD/kdupdaterfiledownloader_mac.cpp \
           $$PWD/kdupdaterfiledownloaderfactory.cpp \
           $$PWD/kdupdaterupdateoperation.cpp \
           $$PWD/kdupdaterupdateoperations.cpp \
           $$PWD/kdupdaterupdateoperationfactory.cpp \
           $$PWD/kdupdaterupdatesinfo.cpp \
           $$PWD/kdupdaterupdatefinder.cpp \
           $$PWD/kdupdaterupdateinstaller.cpp \
           $$PWD/kdupdatertask.cpp \
           $$PWD/kdupdaterpackagesmodel.cpp \
           $$PWD/kdupdaterupdatesourcesmodel.cpp \
           $$PWD/kdupdaterufcompresscommon.cpp \
           $$PWD/kdupdaterupdatesmodel.cpp \

PRIVATEHEADERS += $$PWD/kdupdaterufcompresscommon_p.h \
           $$PWD/kdupdaterufuncompressor_p.h

SOURCES += $$PWD/kdupdaterufuncompressor.cpp

kdupdatergui {
    SOURCES +=        $$PWD/kdupdaterupdatesdialog.cpp \
                      $$PWD/kdupdaterpackagesview.cpp \
                      $$PWD/kdupdaterupdatesourcesview.cpp

    INSTALLHEADERS += $$PWD/kdupdaterupdatesdialog.h \
                      $$PWD/kdupdaterpackagesview.h \
                      $$PWD/kdupdaterupdatesourcesview.h

    kdupdaterguitextbrowser {
        DEFINES += KDUPDATERGUITEXTBROWSER KDUPDATERVIEW=QTextBrowser
    }
    kdupdaterguiwebview {
        DEFINES += KDUPDATERGUIWEBVIEW KDUPDATERVIEW=QWebView
        QT += webkit
    }
    FORMS   +=        $$PWD/addupdatesourcedialog.ui \
                      $$PWD/updatesdialog.ui

    QT += gui
}

HEADERS += $$INSTALLHEADERS $$PRIVATEHEADERS
