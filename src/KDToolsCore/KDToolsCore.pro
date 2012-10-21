TEMPLATE = lib
QT -= gui
KDTOOLS -= gui \
    core
KDTOOLS += none
CONFIG += kdtools \
    per_platform_sources
HEADERS += kdtoolsglobal.h \
    kdsignalblocker.h \
    kdsemaphorereleaser.h \
    kdrect.h \
    kdlog.h \
    kdsignalspy.h \
    kdsavefile.h \
    kdautopointer.h \
    kdsharedmemorylocker.h \
    kdlockedsharedmemorypointer.h \
    kdthreadrunner.h \
    kdgenericfactory.h \
    kdvariantconverter.h \
    kdmetamethoditerator.h
SOURCES += kdtoolsglobal.cpp \
    kdsignalblocker.cpp \
    kdsemaphorereleaser.cpp \
    kdrect.cpp \
    kdlog.cpp \
    kdsignalspy.cpp \
    kdsavefile.cpp \
    kdautopointer.cpp \
    pimpl_ptr.cpp \
    kdsharedmemorylocker.cpp \
    kdlockedsharedmemorypointer.cpp \
    kdthreadrunner.cpp \
    kdgenericfactory.cpp \
    kdvariantconverter.cpp \
    kdmetamethoditerator.cpp

#
include(../stage.pri)

# Needed for kdlog_win.cpp:
win32-msvc*:LIBS += advapi32.lib
OTHER_FILES += ../../examples/kdupdaterdemo/packages.xml
