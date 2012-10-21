TEMPLATE    = app

CONFIG      += qtestlib console
# Work around mingw issue: mingw doesn't bundle manifest files with the generated .exe. Without the manifest, Windows 7/UAC tries to be smart and considers anything with "update" in the name 
# as an installer, and tries to execute it with admin permissions, which makes make test fail.
TARGET      = Upd_ateSourcesViewTest

include( ../stage.pri )

LIBS        += $$KD_UPDATER_LIBS

SOURCES     += main.cpp
