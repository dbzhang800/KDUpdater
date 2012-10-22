TEMPLATE    = subdirs
CONFIG      += ordered
SUBDIRS     += simpleexample
contains(QT_CONFIG,script) {
        SUBDIRS += compatexample
        SUBDIRS += firmwaredemo
}
