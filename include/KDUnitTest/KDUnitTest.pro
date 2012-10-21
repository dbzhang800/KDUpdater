TEMPLATE = subdirs
INSTALL_HEADERS.files = kdunittest_static_export \
kdunittest_static_export.h \
Runner \
TestRegistry \
testregistry.h \
Test \
GenericFactory \
TestFactory \
test.h \
KDUnitTest \

INSTALL_HEADERS.path = $$KDTOOLS_INSTALL_PREFIX/include/KDUnitTest
INSTALLS += INSTALL_HEADERS
