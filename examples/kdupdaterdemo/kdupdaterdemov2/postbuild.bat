rem @echo off
rem parameter %1 srcrepodir, %2 destrepodir, %3 destdir

if EXIST %2 ( rmdir /s /q %2 )
mkdir %2\kdupdaterdemo_win
copy %1\Updates.xml %2\Updates.xml
copy %1\kdupdaterdemo_win\UpdateInstructions.xml %2\kdupdaterdemo_win\UpdateInstructions.xml

copy %2\..\kdupdaterdemov2\kdupdaterdemov2.exe %2\kdupdaterdemo_win\kdupdaterdemo.exe
%3\ufcreator.exe %2\kdupdaterdemo_win
rem del /f %2\kdupdaterdemo_win\kdupdaterdemo.exe
move %2\..\kdupdaterdemov2\kdupdaterdemo_win.kvz %2\kdupdaterdemo_win.kvz
rem del /f %2\kdupdaterdemov2\kdupdaterdemov2.exe
echo "Script run successfull"
