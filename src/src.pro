CONFIG += build_kdupdater_library
include (../KDUpdater.pri)

TEMPLATE    = lib
TARGET = $$LIBNAME
VERSION = 2.3.0
DESTDIR = $$KDUPDATER_LIB_PATH
INCLUDEPATH += .

win32{
    DLLDESTDIR = $$KDUPDATER_BIN_PATH
    QMAKE_DISTCLEAN += $$KDUPDATER_BIN_PATH/$${TARGET}.dll
}

macx {
    CONFIG += absolute_library_soname
    QMAKE_LFLAGS_SONAME = -Wl,-install_name,$$KDUPDATER_LIB_PATH/
}

QT          += xml network
CONFIG += create_prl
DEFINES += emit=""
DEFINES += QT_NO_KEYWORDS QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII QT_NO_CAST_FROM_BYTEARRAY

DEFINES += BUILD_KDUPDATER

CONFIG += kdupdatergui kdupdaterguitextbrowser

include (src.pri)
