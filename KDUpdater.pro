TEMPLATE = subdirs

CONFIG += ordered

SUBDIRS += src
SUBDIRS += tools
SUBDIRS += examples

lessThan(QT_MAJOR_VERSION, 4) {
    message("Cannot build KDUpdater with Qt $${QT_VERSION}.")
    error("Use at least Qt 5.0")
}
