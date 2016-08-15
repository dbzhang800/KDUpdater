TEMPLATE = subdirs

CONFIG      += ordered

SUBDIRS     += simpleexample kdupdaterdemo
qtHaveModule(script) {
        SUBDIRS += compatexample
        SUBDIRS += firmwaredemo
}

