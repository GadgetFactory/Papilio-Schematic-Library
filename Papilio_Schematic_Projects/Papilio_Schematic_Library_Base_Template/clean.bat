set projectname=Audio-MODFile-simple

REM Deletes all unnecessary files
@echo off
for /f %%F in ('dir /b /a-d ^| findstr /vile ".sch .xise .bit .bat .sym .vhd"') do del "%%F"
for /f %%F in ('dir /b  ^| findstr /vile "Sketch"') do rmdir /q /s "%%F"

move papilio_soc_base_papilio_pro.bit %projectname%-papilio-pro.bit
move papilio_soc_base_papilio_one.bit %projectname%-papilio-one.bit
