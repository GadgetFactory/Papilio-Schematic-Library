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

if exist papilio_soc_base_papilio_pro.bit (
	mkdir saved_bitfiles
	move papilio_soc_base_papilio_pro.bit saved_bitfiles\%folder%-papilio-pro.bit
	move Papilio_SOC_Base_Papilio_Pro_summary.html saved_bitfiles\%folder%-papilio-pro-summary.html
) else (
    echo "No File"
)

if exist papilio_soc_base_papilio_one.bit (
	mkdir saved_bitfiles
	move papilio_soc_base_papilio_one.bit saved_bitfiles\%folder%-papilio-one.bit
	move Papilio_SOC_Base_Papilio_One_summary.html saved_bitfiles\%folder%-papilio-one-summary.html
) else (
    echo "No File"
)

REM Deletes all unnecessary files
for /f %%F in ('dir /b /a-d ^| findstr /vile ".sch .xise .bit .bat .sym .vhd"') do del "%%F"
for /f %%F in ('dir /b  ^| findstr /vile "Sketch saved_bitfiles"') do rmdir /q /s "%%F"
