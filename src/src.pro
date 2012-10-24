CONFIG += kdtools_library_not_used
include (../kdtools.pri)

TEMPLATE    = lib
TARGET = $$LIBNAME
VERSION = 2.3.0
DESTDIR = $$KDTOOLS_LIB_PATH
INCLUDEPATH += .

win32{
    DLLDESTDIR = $$KDTOOLS_BIN_PATH
    QMAKE_DISTCLEAN += $$KDTOOLS_BIN_PATH/$${TARGET}.dll
}

macx {
    CONFIG += absolute_library_soname
    QMAKE_LFLAGS_SONAME = -Wl,-install_name,$$KDTOOLS_LIB_PATH/
}

QT          += xml network
CONFIG += create_prl
DEFINES += emit=""
DEFINES += QT_NO_KEYWORDS QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII QT_NO_CAST_FROM_BYTEARRAY

DEFINES += KDTOOLS_SHARED BUILD_SHARED_KDTOOLSCORE BUILD_SHARED_KDUPDATER

CONFIG += kdupdatergui kdupdaterguitextbrowser

include (KDToolsCore/KDToolsCore.pri)
include (KDUpdater/KDUpdater.pri)
