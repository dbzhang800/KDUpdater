TEMPLATE = app
include (../../../kdtools.pri)
QT += widgets
SOURCES += ../main.cpp \
    ../mainwindow.cpp \
    ../updaterdialog.cpp \
    ../updater.cpp
HEADERS += ../mainwindow.h \
    ../updaterdialog.h \
    ../updater.h
DEFINES += APP_VERSION="\\\"1.1\\\""
out_of_source_build:message("OUT OF SOURCE BUILD")
RESOURCES += ../kdupdaterdemo.qrc



win32{
    WINDESTDIR = $$DESTDIR
    WINDESTDIR = $$replace( WINDESTDIR, /, \\ )
    message ( $$WINDESTDIR )
    SRCDIR = $$replace( KDTOOLS_SOURCE_TREE, /, \\ )
    message ( $$SRCDIR )
    SRCREPODIR = $$SRCDIR\\examples\\data\\kdupdaterdemo\\repository
    message ($$SRCREPODIR)
    out_of_source_build {
        DESTREPODIR = $$WINDESTDIR\\data\\kdupdaterdemo\\repository
        COPYSCRIPT = copy $$SRCDIR\\examples\\kdupdaterdemo\\kdupdaterdemov2\\postbuild.bat $$KDTOOLS_BUILD_TREE\\examples\\kdupdaterdemo\\kdupdaterdemov2\\postbuild.bat
        QMAKE_PRE_LINK += $$COPYSCRIPT
        message($$COPYSCRIPT)
    } else {
        DESTREPODIR = $$SRCDIR
    }
    CREATEREPOTARGETPRE1.commands = postbuild.bat $$OUTOFSOURCE $$SRCREPODIR $$DESTREPODIR $$WINDESTDIR
    DESTREPODIRT = $$replace( DESTREPODIR, \\, / )
    DEFINES += REPO_DIR="\\\"$$DESTREPODIRT\\\""
} else {
    SRCDIR = $$KDTOOLS_SOURCE_TREE
    SRCREPODIR = $$SRCDIR/examples/data/kdupdaterdemo/repository
    macx:FOLDERSUFFIX="mac"
    !macx:FOLDERSUFFIX="unix"
    out_of_source_build {
        DESTREPODIR = $$DESTDIR/data/kdupdaterdemo/repository
        message ($$DESTREPODIR)
        CREATEREPOTARGETPRE1.commands = if [ -a $$DESTDIR/data ]; then rm -rf $$DESTDIR/data &&
        CREATEREPOTARGET.commands = mkdir -p $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX &&
        CREATEREPOTARGET.commands += cp $$SRCREPODIR/Updates.xml $$DESTREPODIR/Updates.xml &&
        CREATEREPOTARGET.commands += cp $$SRCREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/UpdateInstructions.xml $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/UpdateInstructions.xml &&
    } else {
        DESTREPODIR = $$SRCDIR
    }
    macx:SUFFIX=".app"
    !macx:SUFFIX=""
    ext = ".kvz"

    CREATEREPOTARGET.commands += cp -R $$DESTDIR/kdupdaterdemov2$$SUFFIX $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/kdupdaterdemo$$SUFFIX &&
    macx:CREATEREPOTARGET.commands += mv $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/kdupdaterdemo$$SUFFIX/Contents/MacOS/kdupdaterdemov2 $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/kdupdaterdemo$$SUFFIX/Contents/MacOS/kdupdaterdemo &&
    CREATEREPOTARGET.commands += $$DESTDIR/ufcreator $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/ &&
    CREATEREPOTARGET.commands += rm -rf $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/kdupdaterdemo$$SUFFIX &&
    CREATEREPOTARGET.commands += mv $$DESTDIR/../examples/kdupdaterdemo/kdupdaterdemov2/kdupdaterdemo_$$FOLDERSUFFIX$$ext $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX$$ext &&
    CREATEREPOTARGET.commands += rm -rf $$DESTDIR/kdupdaterdemov2$$SUFFIX

    out_of_source_build {
        CREATEREPOTARGETPRE1.commands += $$CREATEREPOTARGET.commands
        CREATEREPOTARGETPRE1.commands += ; else
        CREATEREPOTARGETPRE1.commands += $$CREATEREPOTARGET.commands
        CREATEREPOTARGETPRE1.commands += ; fi
    }
    DEFINES += REPO_DIR="\\\"$$DESTREPODIR\\\""
}
message ( $$CREATEREPOTARGETPRE1.commands )

#QMAKE_EXTRA_TARGETS += CREATEREPOTARGET
QMAKE_POST_LINK = $$CREATEREPOTARGETPRE1.commands
