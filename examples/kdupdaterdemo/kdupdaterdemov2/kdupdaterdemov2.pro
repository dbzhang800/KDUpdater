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
RESOURCES += ../kdupdaterdemo.qrc

SRCREPODIR = $$KDTOOLS_SOURCE_TREE/examples/data/kdupdaterdemo/repository
DESTREPODIR = $$KDTOOLS_BUILD_TREE/examples/kdupdaterdemo/updateserver
DEFINES += REPO_DIR="\\\"$$DESTREPODIRT\\\""

win32{
    DESTDIR = $$OUT_PWD

    SOURCE_DIR = $$replace(PWD, /, \\)
    BUILD_DIR  = $$replace(OUT_PWD, /, \\)
    SRCREPODIR = $$replace(SRCREPODIR, /, \\)
    DESTREPODIR = $$replace(DESTREPODIR, /, \\)
    WINDESTDIR = $$replace(KDTOOLS_BIN_PATH, /, \\)

    COPYSCRIPT = copy $$SOURCE_DIR\\postbuild.bat $$BUILD_DIR\\postbuild.bat
    QMAKE_PRE_LINK += $$COPYSCRIPT

    CREATEREPOTARGETPRE1.commands = postbuild.bat $$SRCREPODIR $$DESTREPODIR $$WINDESTDIR
} else {
    macx:FOLDERSUFFIX="mac"
    !macx:FOLDERSUFFIX="unix"

    macx:SUFFIX=".app"
    !macx:SUFFIX=""
    ext = ".kvz"

    # copy Updates.xml and UpdateInstructions.xml to dest-dir
    CREATEREPOTARGET.commands = mkdir -p $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX &&
    CREATEREPOTARGET.commands += cp $$SRCREPODIR/Updates.xml $$DESTREPODIR/Updates.xml &&
    CREATEREPOTARGET.commands += cp $$SRCREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/UpdateInstructions.xml $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/UpdateInstructions.xml &&

    # copy generated application to dest-dir, then create the .kvz file
    CREATEREPOTARGET.commands += cp -R $$OUT_PWD/kdupdaterdemov2$$SUFFIX $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/kdupdaterdemo$$SUFFIX &&
    macx:CREATEREPOTARGET.commands += mv $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/kdupdaterdemo$$SUFFIX/Contents/MacOS/kdupdaterdemov2 $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/kdupdaterdemo$$SUFFIX/Contents/MacOS/kdupdaterdemo &&
    CREATEREPOTARGET.commands += $$KDTOOLS_BIN_PATH/ufcreator $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/ &&
#    CREATEREPOTARGET.commands += rm -rf $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX/kdupdaterdemo$$SUFFIX &&
    CREATEREPOTARGET.commands += mv $$OUT_PWD/kdupdaterdemo_$$FOLDERSUFFIX$$ext $$DESTREPODIR/kdupdaterdemo_$$FOLDERSUFFIX$$ext  #&&
#    CREATEREPOTARGET.commands += rm -rf $$OUT_PWD/kdupdaterdemov2$$SUFFIX

    CREATEREPOTARGETPRE1.commands = if [ -a $$DESTREPODIR ]; then rm -rf $$DESTREPODIR &&
    CREATEREPOTARGETPRE1.commands += $$CREATEREPOTARGET.commands
    CREATEREPOTARGETPRE1.commands += ; else
    CREATEREPOTARGETPRE1.commands += $$CREATEREPOTARGET.commands
    CREATEREPOTARGETPRE1.commands += ; fi
}
#message ( $$CREATEREPOTARGETPRE1.commands )

#QMAKE_EXTRA_TARGETS += CREATEREPOTARGET
QMAKE_POST_LINK = $$CREATEREPOTARGETPRE1.commands
