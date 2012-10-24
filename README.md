About KDUpdater
================

Original source file taken from KD Tools 2.3.0

http://www.kdab.com/kdab-products/kd-tools/

How to build
==============

This project can only be compiled using Qt5.

Just open the KDUpdater.pro using Qt Creator, then build&run should work.

Examples
=================

how does kdupdaterdemo work
----------------------------

First, Updates.xml and UpdateInstructions.xml will be copied from 
`examples/data/kdupdaterdemo` to `examples/kdupdaterdemo/updateserver/`

Then, generated application kdupdaterdemov2 will be copied to the
`examples/kdupdaterdemo/updateserver/kdupdaterdemo_{win,unix,mac}` directory

Finally, ufcreater is used to convert the kdupdaterdemo_{win, unix, mac}
to a .kvz file.

So, when kdupdaterdemo is running, it will get Updates.xml from the updateserver first, then download the 
.kvz file which contains UpdateInstructions.xml and the new kdupdaterdemo.
