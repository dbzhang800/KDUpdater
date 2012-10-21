TEMPLATE = subdirs
SUBDIRS = KDToolsCore \
KDToolsGui \
KDUnitTest \
KDUpdater

INSTALL_HEADERS.files = KDToolsGlobal \
KDUnitTestGlobal \

INSTALL_HEADERS.path = $$KDTOOLS_INSTALL_PREFIX/include
INSTALLS += INSTALL_HEADERS
