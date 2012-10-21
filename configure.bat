@echo off
rem This file was generated automatically.
rem Please edit generate-configure.sh/autogen.py rather than this file.

rem configuration

set PRODUCT_CAP=KDTOOLS
set product_low=kdtools
set Product_mix=KDTools
set Product_Space=KD Tools

set VERSION=2.3.0

set INSTALLATION_SUPPORTED=true
set STATIC_BUILD_SUPPORTED=true
set HAS_DESIGNER_PLUGIN=true

rem function definitions

rem find SRCDIR

rem ensure SRCDIR and BUILDDIR do not end in \'s:
set SRCDIR=%~dp0%.
set BUILDDIR=%CD%\.
set PACKSCRIPTS_DIR=%SRCDIR%\..\admin\packscripts

rem find Qt

if "%QTDIR%" == "" (
  rem This is the batch equivalent of QTDIR=`qmake -query QT_INSTALL_PREFIX`...
  for /f "tokens=*" %%V in ('qmake -query QT_INSTALL_PREFIX') do set QTDIR=%%V
)

if "%QTDIR%" == "" (
  echo You need to set QTDIR or add qmake to the PATH
  exit /B 1
)

echo Qt found: %QTDIR%

rem config variables

set shared=yes
set debug=no
set release=no
set prefix=
set plugins_prefix=
set unittests=no
set compat=yes
set kdupdatergui=textbrowser


if exist "%PACKSCRIPTS_DIR%" (
    set unittests=yes

)

rem check license

if exist "%PACKSCRIPTS_DIR%" goto :CheckLicenseComplete
if exist "%SRCDIR%\.license.accepted" goto :CheckLicenseComplete

set license_file=

if exist "%SRCDIR%\LICENSE.GPL.txt" (
    if exist "%SRCDIR%\LICENSE.US.txt" (
        if exist "%SRCDIR%\LICENSE.txt" (
            echo.
            echo Please choose your license.
            echo.
            echo Type 1 for the GNU General Public License ^(GPL^).
            echo Type 2 for the %Product_Space% Commercial License for USA/Canada.
            echo Type 3 for the %Product_Space% Commercial License for anywhere outside USA/Canada.
            if exist "%SRCDIR%\LICENSE.LGPL.txt" (
            echo Type 4 for the GNU Lesser General Public License ^(LGPL^).
            )
            echo Anything else cancels.
            echo.
            set /p license=Select:
        )
    ) else (
        license=1
    )
) else (
    if exist "%SRCDIR%\LICENSE.US.txt" (
        license=2
    ) else (
        if exist "%SRCDIR%\LICENSE.txt" (
            license=3
        ) else (
            if exist "%SRCDIR%\LICENSE.LGPL.txt" (
                license=4
            ) else (
                echo "Couldn't find license file, aborting"
                exit /B 1
            )
        )
    )
)

if "%license%" == "1" (
    set license_name=GNU General Public License ^(GPL^)
    set license_file=LICENSE.GPL.txt
    goto :CheckLicense
) else (
    if "%license%" == "2" (
        set license_name=%Product_Space% USA/Canada Commercial License
        set license_file=LICENSE.US.txt
        goto :CheckLicense
    ) else (
        if "%license%" == "3" (
            set license_name=%Product_Space% Commercial License
            set license_file=LICENSE.txt
            goto :CheckLicense
        ) else (
            if "%license%" == "4" (
                set license_name=GNU Lesser General Public License ^(LGPL^)
                set license_file=LICENSE.LGPL.txt
                goto :CheckLicense
            ) else (
                exit /B 1
            )
        )
    )
)

:CheckLicense
echo.
echo License Agreement
echo.
echo You are licensed to use this software under the terms of
echo the %license_name%.
echo.
echo Type '?' to view the %license_name%.
echo Type 'yes' to accept this license offer.
echo Type 'no' to decline this license offer.
echo.
set /p answer=Do you accept the terms of this license?

if "%answer%" == "no" goto :CheckLicenseFailed
if "%answer%" == "yes" (
    echo. > "%SRCDIR%\.license.accepted"
    goto :CheckLicenseComplete
)
if "%answer%" == "?" more "%SRCDIR%\%license_file%"
goto :CheckLicense

:CheckLicenseFailed
echo You are not licensed to use this software.
exit /B 1

:CheckLicenseComplete

rem options parsing

:Options
if "%1" == ""          goto :EndOfOptions

if "%1" == "-prefix"   goto :Prefix
if "%1" == "/prefix"   goto :Prefix

if "%1" == "-override-version"  goto :OverrideVersion
if "%1" == "/override-version"  goto :OverrideVersion

if "%1" == "-plugins-prefix" goto :PluginsPrefix
if "%1" == "/plugins-prefix" goto :PluginsPrefix

if "%1" == "-shared"   goto :Shared
if "%1" == "/shared"   goto :Shared

if "%1" == "-static"   goto :Static
if "%1" == "/static"   goto :Static

if "%1" == "-release"  goto :Release
if "%1" == "/release"  goto :Release

if "%1" == "-debug"    goto :Debug
if "%1" == "/debug"    goto :Debug

if "%1" == "-unittests" goto :Unittests
if "%1" == "/unittests" goto :Unittests

if "%1" == "-no-unittests" goto :NoUnittests
if "%1" == "/no-unittests" goto :NoUnittests

if "%1" == "-compat" goto :Compat
if "%1" == "/compat" goto :Compat

if "%1" == "-no-compat" goto :NoCompat
if "%1" == "/no-compat" goto :NoCompat

if "%1" == "-kdupdatergui" goto :Kdupdatergui
if "%1" == "/kdupdatergui" goto :Kdupdatergui


if "%1" == "-help"     goto :Help
if "%1" == "/help"     goto :Help
if "%1" == "--help"    goto :Help
if "%1" == "/?"        goto :Help

echo Unknown option: %1
goto :usage

:OptionWithArg
shift
:OptionNoArg
shift
goto :Options

:PluginsPrefix
    if "%HAS_DESIGNER_PLUGIN%" == "true" (
      set plugins_prefix="%2"
      goto :OptionWithArg
    ) else (
      echo Installation not supported, -plugins-prefix option ignored
      goto :OptionWithArg
rem   goto :usage
    )
:Prefix
    if "%INSTALLATION_SUPPORTED%" == "true" (
      set prefix=%2
      goto :OptionWithArg
    ) else (
      echo Installation not supported, -prefix option ignored
      goto :OptionWithArg
rem   goto :usage
    )
:OverrideVersion
    set VERSION=%2
    goto :OptionWithArg
:Shared
    set shared=yes
    goto :OptionNoArg
:Static
if "%STATIC_BUILD_SUPPORTED%" == "true" (
    set shared=no
    goto :OptionNoArg
) else (
  echo Static build not supported, -static option not allowed
  goto :usage
)
:Release
    set release=yes
    goto :OptionNoArg
:Debug
    set debug=yes
    goto :OptionNoArg
:Unittests
    set unittests=yes
    goto :OptionNoArg
:NoUnittests
    set unittests=no
    goto :OptionNoArg
:Compat
    set compat=yes
    goto :OptionNoArg
:NoCompat
    set compat=no
    goto :OptionNoArg
:Kdupdatergui
    set kdupdatergui=%2
    goto :OptionWithArg

:Help
    goto :usage

:EndOfOptions

rem apply defaults to unset options

set default_prefix=C:\KDAB\%Product_mix%-%VERSION%
for /f "tokens=*" %%V in ('"%QTDIR%"\bin\qmake -query QT_INSTALL_PLUGINS') do set default_plugins_prefix=%%V

if "%prefix%" == "" (
    set prefix=%default_prefix%
)
if "%plugins_prefix%" == "" (
    echo test > "%default_plugins_prefix%\_kdt_wchk.txt"
    if errorlevel 1 (
        set plugins_prefix=%default_plugins_prefix%
    ) else (
        set plugins_prefix=%prefix%\plugins
    )
    del /Q "%default_plugins_prefix%\_kdt_wchk.txt"
)



rem clean previous build

del /Q /S Makefile* 2> NUL
del /Q /S debug 2> NUL
del /Q /S release 2> NUL
if exist "%SRCDIR%\src\src.pro" (
    del /Q lib 2> NUL
    del /Q bin 2> NUL
)

rem write .qmake.cache

del .qmake.cache 2> NUL
echo. > .qmake.cache

echo %PRODUCT_CAP%_BASE = "%SRCDIR%" >> .qmake.cache
echo %PRODUCT_CAP%_BUILD_DIR  = "%BUILDDIR%" >> .qmake.cache
echo %PRODUCT_CAP%_BASE = "$$replace( %PRODUCT_CAP%_BASE, "\\\\", "/" )" >> .qmake.cache
echo %PRODUCT_CAP%_BUILD_DIR  = "$$replace( %PRODUCT_CAP%_BUILD_DIR,  "\\\\", "/" )" >> .qmake.cache

if "%release%" == "yes" (
    if "%debug%" == "yes" (
        echo CONFIG += debug_and_release build_all >> .qmake.cache
	set release=yes ^(combined^)
	set debug=yes ^(combined^)
    ) else (
        echo CONFIG += release >> .qmake.cache
        echo CONFIG -= debug >> .qmake.cache
	echo CONFIG -= debug_and_release >> .qmake.cache
    )
) else (
    if "%debug%" == "yes" (
        echo CONFIG -= release >> .qmake.cache
	echo CONFIG += debug >> .qmake.cache
	echo CONFIG -= debug_and_release >> .qmake.cache
    ) else (
	echo CONFIG += debug_and_release build_all >> .qmake.cache
	set release=yes ^(combined^)
	set debug=yes ^(combined^)
    )
)

if "%shared%" == "yes" (
    echo CONFIG += shared >> .qmake.cache
) else (
    echo CONFIG += static >> .qmake.cache
    rem This is needed too, when Qt is static, otherwise it sets -DQT_DLL and linking fails.
    echo CONFIG += qt_static >> .qmake.cache
)


if "%unittests%" == "yes" (
    echo CONFIG += unittests >> .qmake.cache
)

if "%compat%" == "no" (
    echo DEFINES += KDTOOLS_NO_COMPAT >> .qmake.cache
)

if "%kdupdatergui%" == "textbrowser" (
    echo CONFIG += kdupdatergui kdupdaterguitextbrowser >> .qmake.cache
)

if "%kdupdatergui%" == "webview" (
    echo CONFIG += kdupdatergui kdupdaterguiwebview >> .qmake.cache
)


if NOT "%SRCDIR%" == "%BUILDDIR%" (
	echo OUTOFSOURCEBUILD = true >> .qmake.cache
	echo "SRCDIR = %SRCDIR%"
	echo "BUILDDIR = %BUILDDIR%"
)

echo %PRODUCT_CAP%_INSTALL_PREFIX = "%prefix%" >> .qmake.cache
echo %PRODUCT_CAP%_PLUGINS_PREFIX = "%plugins_prefix%" >> .qmake.cache


echo VERSION=%VERSION% >> .qmake.cache
echo CONFIG += %product_low%_target >> .qmake.cache

if exist "%QTDIR%\include\Qt\private" (
    echo CONFIG += have_private_qt_headers >> .qmake.cache
    echo INCLUDEPATH += "%QTDIR%/include/Qt/private" >> .qmake.cache
) else (
    rem echo QTDIR must point to an installation that has private headers installed.
    rem echo Some features will not be available.
)

rem link .prf files to builddir

if not exist %product_low%.pro (

    rem ie. builddir != srcdir

    if exist "%SRCDIR%\features" (
        if not exist "%BUILDDIR%\features" (
            mkdir "%BUILDDIR%\features"
            if not errorlevel 0 (
                echo Could not create directory %BUILDDIR%\features
                goto :CleanEnd
            )
        )
        for %%P in ("%SRCDIR%\features"\*.prf) do (
            echo include^( "$$%PRODUCT_CAP%_BASE/features/%%~nxP" ^) > "%BUILDDIR%\features\%%~nxP"
            if not errorlevel 0 (
                echo Could not create forward .prf file %BUILDDIR%\features\%%nxP
                goto :CleanEnd
            )
        )
    )
)

rem call qmake

rem Make a copy so that each run of qmake on $product.pro starts clean
copy .qmake.cache .confqmake.cache

"%QTDIR%\bin\qmake"  "%SRCDIR%\%product_low%.pro" "%PRODUCT_CAP%_BASE=%CD%"

if errorlevel 1 (
    echo qmake failed
    goto :CleanEnd
)

rem display configuration summary

echo %Product_mix% v%VERSION% configuration:
echo.
if "%INSTALLATION_SUPPORTED%" == "true" (
  echo   Install Prefix.............: %prefix%
  echo     ^(default: %default_prefix%^)
  echo   Install Plugins Prefix.....: %plugins_prefix%
  echo     ^(default: %default_plugins_prefix%^)
)
echo   Debug...................: %debug% ^(default: combined^)
echo   Release.................: %release% ^(default: combined^)
if "%STATIC_BUILD_SUPPORTED%" == "true" (
  echo   Shared build............: %shared% ^(default: yes^)
)
echo   Compiled-In Unit Tests.....: %unittests% ^(default: no^)
echo   Older KD Tools Source-Level
echo     Compatibility............: %compat% ^(default: yes^)
echo   Compile KDUpdater GUI using: %kdupdatergui% ^(default: textbrowser^)

echo.

echo Ok, now run nmake ^(for Visual Studio^) or mingw32-make ^(for mingw^) to build the framework.
if "%HAS_DESIGNER_PLUGIN%" == "true" (
if not "%plugins_prefix%" == "%default_plugins_prefix%" (
echo Please add %plugins_prefix% to Qt's list of plugin paths.
)
)
goto :end

:usage
IF "%1" NEQ "" echo %0: unknown option "%1"
echo usage: %0 [options]
echo where options include:
if "%INSTALLATION_SUPPORTED%" == "true" (
  echo.
  echo   -prefix ^<dir^> 
  echo       set installation prefix to ^<dir^>, used by make install
  if "%HAS_DESIGNER_PLUGIN%" == "true" (
    echo.
    echo   -plugins-prefix ^<dir^>
    echo       set plugins installation prefix to ^<dir^>, used by make install
  )
)
echo.
echo   -release / -debug
echo       build in debug/release mode
if "%STATIC_BUILD_SUPPORTED%" == "true" (
  echo.
  echo   -static / -shared
  echo       build static/shared libraries
)
echo.
echo   -unittests / -no-unittests
echo      enable/disable compiled-in unittests
echo.
echo   -compat / -no-compat
echo      enable/disable source-level compatibility
echo      with older KD Tools releases
echo.
echo   -kdupdatergui none,textbrowser,webview
echo      set the GUI mode for KDUpdater, or disable the GUI

echo.

:CleanEnd
del .qmake.cache

:end
