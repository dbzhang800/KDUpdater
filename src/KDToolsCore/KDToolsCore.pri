TEMPLATE = lib
QT -= gui
HEADERS += $$PWD/kdtoolsglobal.h \
    $$PWD/kdsignalblocker.h \
    $$PWD/kdsemaphorereleaser.h \
    $$PWD/kdrect.h \
    $$PWD/kdlog.h \
    $$PWD/kdsignalspy.h \
    $$PWD/kdsavefile.h \
    $$PWD/kdautopointer.h \
    $$PWD/kdsharedmemorylocker.h \
    $$PWD/kdlockedsharedmemorypointer.h \
    $$PWD/kdthreadrunner.h \
    $$PWD/kdgenericfactory.h \
#    $$PWD/kdvariantconverter.h \
    $$PWD/kdmetamethoditerator.h \
    $$PWD/kdlog_p.h
SOURCES += $$PWD/kdtoolsglobal.cpp \
    $$PWD/kdsignalblocker.cpp \
    $$PWD/kdsemaphorereleaser.cpp \
    $$PWD/kdrect.cpp \
    $$PWD/kdlog.cpp \
    $$PWD/kdsignalspy.cpp \
    $$PWD/kdsavefile.cpp \
    $$PWD/kdautopointer.cpp \
    $$PWD/pimpl_ptr.cpp \
    $$PWD/kdsharedmemorylocker.cpp \
    $$PWD/kdlockedsharedmemorypointer.cpp \
    $$PWD/kdthreadrunner.cpp \
    $$PWD/kdgenericfactory.cpp \
#    $$PWD/kdvariantconverter.cpp \
    $$PWD/kdmetamethoditerator.cpp

win32: SOURCES += $$PWD/kdlog_win.cpp
unix: SOURCES += $$PWD/kdlog_unix.cpp
# Needed for kdlog_win.cpp:
win32-msvc*:LIBS += advapi32.lib
