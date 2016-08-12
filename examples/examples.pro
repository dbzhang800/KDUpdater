TEMPLATE = subdirs

CONFIG      += ordered

SUBDIRS     += simpleexample kdupdaterdemo
contains(QT_CONFIG,script) {
        SUBDIRS += compatexample
        SUBDIRS += firmwaredemo
}

