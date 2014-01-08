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
for /f %%F in ('dir /b /a-d ^| findstr /vile ".sch .xise .bit .bat .sym .vhd .pdf .ino .cmd_log .cmd .xst .prj .vhf .ut"') do del "%%F"
for /f %%F in ('dir /b  ^| findstr /vile "Sketch saved_bitfiles rebuild"') do rmdir /q /s "%%F"

move Papilio_Pro.cmd_log Papilio_Pro.cmd
move Papilio_One_500K.cmd_log Papilio_One_500K.cmd
move Papilio_One_250K.cmd_log Papilio_One_250K.cmd

REM stash rebuild files
mkdir rebuild
move *.cmd rebuild
move *.xst rebuild
move *.prj rebuild
move *.vhf rebuild
move *.ut rebuild