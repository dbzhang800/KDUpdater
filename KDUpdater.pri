## Common file which will be included by all other .pro files.

# We don't support Qt4
lessThan(QT_MAJOR_VERSION, 5) {
    message("Cannot build KDUpdater with Qt $${QT_VERSION}.")
    error("Use at least Qt 5.0")
}

# Generate proper library name
SAVED_TEMPLAET = $$TEMPLATE
TEMPLATE = fake_lib
LIBNAME = $$qtLibraryTarget(hkdupdater)
TEMPLATE = $$SAVED_TEMPLAET

KDUPDATER_SOURCE_TREE = $$PWD
isEmpty(KDUPDATER_BUILD_TREE): KDUPDATER_BUILD_TREE = $$shadowed($$PWD)

KDUPDATER_LIB_PATH = $$KDUPDATER_BUILD_TREE/lib
KDUPDATER_BIN_PATH = $$KDUPDATER_BUILD_TREE/bin

# link to the library
!build_kdupdater_library {
    config += link_prl
    INCLUDEPATH += $$KDUPDATER_SOURCE_TREE/src
    LIBS += -L$$KDUPDATER_LIB_PATH -l$$LIBNAME
    unix:QMAKE_RPATHDIR += $$KDUPDATER_LIB_PATH
    DEFINES += KDUPDATER_SHARED
}
