QT		+= xml network
CONFIG += kdtools

win32 {
    DEFINES	+= _CRT_SECURE_NO_DEPRECATE
}

defineTest(qmakeEcho) {
    content = $$1
    operator = $$2
    file = $$3

    line = "\"$$content\""

    win32 {
        line = $$replace(content, "<", "^<")
        line = $$replace(line, ">", "^>")
    }

    system("echo $$line $$operator $$file")
    return(true)
}

defineTest(qmakeCleanAndCopy) {
    dir = "$$1"
    dest = "$$2"

    win32 {
        dir = $$replace(dir, "/", "\\")
        dest = $$replace(dest, "/", "\\")
        exists($$dest) {
            system("del /S /Q \"$$dest\"")|error("Cannot remove $$dest")
        }
        system("xcopy /E /I /Y \"$$dir\" \"$$dest\"")|error("Cannot copy $$dir to $$dest")
    } else {
        exists($$dest) {
            system("rm -rf \"$$dest\"")|error("Cannot remove $$dest")
        } else {
            system("mkdir -p \"$$dest\"")
        }
        system("cp -r \"$$dir\" \"$$dest\"")|error("Cannot copy $$dir to $$dest")
    }
    return(true)
}
