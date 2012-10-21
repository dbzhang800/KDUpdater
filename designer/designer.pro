TEMPLATE = lib

CONFIG += plugin kdtools designer
KDTOOLS = gui core

TARGET = kdtools_designer_plugin

include( ../stage.pri )

RESOURCES = designer.qrc

SOURCES = plugin.cpp

target.path = "$$KDTOOLS_PLUGINS_PREFIX/designer"

INSTALLS += target

exists( templates ) {

	templates.path =$$[QT_INSTALL_PREFIX]/bin/templates # sic!
	templates.files = templates/*.ui

	INSTALLS += templates

}
