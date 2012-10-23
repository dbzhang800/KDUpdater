SAVED_TEMPLAET = $$TEMPLATE
TEMPLATE = fake_lib
LIBNAME = $$qtLibraryTarget(hkdupdater)
TEMPLATE = $$SAVED_TEMPLAET

KDTOOLS_SOURCE_TREE = $$PWD
isEmpty(KDTOOLS_BUILD_TREE) {
    sub_dir = $$_PRO_FILE_PWD_
    sub_dir ~= s,^$$re_escape($$PWD),,
    KDTOOLS_BUILD_TREE = $$clean_path($$OUT_PWD)
    KDTOOLS_BUILD_TREE ~= s,$$re_escape($$sub_dir)$,,
}
!isEqual(KDTOOLS_SOURCE_TREE, $$KDTOOLS_BUILD_TREE):CONFIG += out_of_source_build

KDTOOLS_LIB_PATH = $$KDTOOLS_BUILD_TREE/lib
KDTOOLS_BIN_PATH = $$KDTOOLS_BUILD_TREE/bin

!kdtools_library_not_used {
    config += link_prl
    INCLUDEPATH += $$KDTOOLS_SOURCE_TREE/src $$KDTOOLS_SOURCE_TREE/src/KDToolsCore $$KDTOOLS_SOURCE_TREE/src/KDUpdater
    LIBS += -L$$KDTOOLS_LIB_PATH -l$$LIBNAME

    DEFINES += KDTOOLS_SHARED
}
