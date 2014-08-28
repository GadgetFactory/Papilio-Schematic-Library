    @setlocal enableextensions enabledelayedexpansion
    set startdir=%cd%
    set temp=%startdir%
    set folder=
:loop
    if not "x%temp:~-1%"=="x\" (
        set folder=!temp:~-1!!folder!
        set temp=!temp:~0,-1!
        goto :loop
    )
    echo.startdir = %startdir%
    echo.folder   = %folder%
    endlocal && set folder=%folder%

if exist papilio_pro.bit (
	mkdir saved_bitfiles
	copy papilio_pro.bit saved_bitfiles\%folder%-papilio-pro.bit
	move Papilio_Pro_summary.html saved_bitfiles\%folder%-papilio-pro-summary.html
) else (
    echo "No File"
)

if exist papilio_one_500k.bit (
	mkdir saved_bitfiles
	copy papilio_one_500k.bit saved_bitfiles\%folder%-papilio-one_500K.bit
	move papilio_one_500k_summary.html saved_bitfiles\%folder%-papilio-one-500K-summary.html
) else (
    echo "No File"
)

if exist papilio_one_250k.bit (
	mkdir saved_bitfiles
	copy papilio_one_250k.bit saved_bitfiles\%folder%-papilio-one_250K.bit
	move papilio_one_250k_summary.html saved_bitfiles\%folder%-papilio-one-250K-summary.html
) else (
    echo "No File"
)

REM Deletes all unnecessary files
for /f %%F in ('dir /b /a-d ^| findstr /vile ".sch .xise .bit .bat .sym .vhd .pdf .ino .cmd_log .cmd .xst .prj .vhf .ut .h .cpp"') do del "%%F"
REM for /f %%F in ('dir /b  ^| findstr /vile "Sketch saved_bitfiles rebuild LX9 500K 250K smallfs ols-0.9.7 Libraries ym_converter"') do rmdir /q /s "%%F"
rmdir /q /s iseconfig

if exist LX9 (
	cd LX9
	move Papilio_Pro.cmd_log Papilio_Pro.cmd
	for /f %%F in ('dir /b /a-d ^| findstr /vile ".sch .xise .bit .bat .sym .vhd .pdf .ino .cmd_log .cmd .xst .prj .vhf .ut .html"') do del "%%F"
	for /f %%F in ('dir /b  ^| findstr /vile "Sketch saved_bitfiles rebuild LX9 500K 250K"') do rmdir /q /s "%%F"
	cd ..
)
if exist 250K (
	cd 250K
	move Papilio_One_250K.cmd_log Papilio_One_250K.cmd
	for /f %%F in ('dir /b /a-d ^| findstr /vile ".sch .xise .bit .bat .sym .vhd .pdf .ino .cmd_log .cmd .xst .prj .vhf .ut .html"') do del "%%F"
	for /f %%F in ('dir /b  ^| findstr /vile "Sketch saved_bitfiles rebuild LX9 500K 250K"') do rmdir /q /s "%%F"
	cd ..
)
if exist 500K (
	cd 500K
	move Papilio_One_500K.cmd_log Papilio_One_500K.cmd
	for /f %%F in ('dir /b /a-d ^| findstr /vile ".sch .xise .bit .bat .sym .vhd .pdf .ino .cmd_log .cmd .xst .prj .vhf .ut .html"') do del "%%F"
	for /f %%F in ('dir /b  ^| findstr /vile "Sketch saved_bitfiles rebuild LX9 500K 250K"') do rmdir /q /s "%%F"
	cd ..
)

