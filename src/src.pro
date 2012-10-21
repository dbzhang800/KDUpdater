TEMPLATE    = lib
TARGET = $$qtLibraryTarget(hkdupdater)
VERSION = 2.3.0
DESTDIR = ../lib
INCLUDEPATH += .

QT          += xml network
CONFIG += create_prl
DEFINES += emit=""
DEFINES += QT_NO_KEYWORDS QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII QT_NO_CAST_FROM_BYTEARRAY

DEFINES += KDTOOLS_SHARED BUILD_SHARED_KDTOOLSCORE BUILD_SHARED_KDUPDATERs


CONFIG += kdupdatergui kdupdaterguitextbrowser

include (KDToolsCore/KDToolsCore.pri)
include (KDUpdater/KDUpdater.pri)
