TEMPLATE = subdirs
INSTALL_HEADERS.files = KDGenericFactory \
KDGenericFactoryBase \
kdgenericfactory.h \
KDSemaphoreReleaser \
kdsemaphorereleaser.h \
KDAutoPointer \
kdautopointer.h \
KDSaveFile \
kdsavefile.h \
KDSignalBlocker \
kdsignalblocker.h \
KDVariantConverter \
kdvariantconverter.h \
KDCompositeLogDevice \
KDEncodingLogDevice \
KDStderrLogDevice \
KDSystemLogDevice \
KDLog \
KDFileLogDevice \
KDLogDevice \
KDSignalLogDevice \
kdlog.h \
KDLockedSharedMemoryArray \
KDLockedSharedMemoryPointer \
kdlockedsharedmemorypointer.h \
KDThreadRunner \
KDThreadRunnerBase \
kdthreadrunner.h \
KDMetaMethodIterator \
kdmetamethoditerator.h \
KDPoint \
KDRect \
kdrect.h \
KDSharedMemoryLocker \
kdsharedmemorylocker.h \
pimpl_ptr \
pimpl_ptr.h \
KDSignalSpy \
kdsignalspy.h \
KDToolsCore \

INSTALL_HEADERS.path = $$KDTOOLS_INSTALL_PREFIX/include/KDToolsCore
INSTALLS += INSTALL_HEADERS
