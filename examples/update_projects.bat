for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\PSL_Papilio_Pro_LX9.xise copy Template_PSL_Base\PSL_Papilio_Pro_LX9.xise "%%F"\*
for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\PSL_Papilio_One_250K.xise copy Template_PSL_Base\PSL_Papilio_One_250K.xise "%%F"\*
for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do if exist "%%F"\PSL_Papilio_One_500K.xise copy Template_PSL_Base\PSL_Papilio_One_500K.xise "%%F"\*
for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do copy Template_PSL_Base\clean.bat "%%F"\*
for /f %%F in ('dir /AD /b  ^| findstr /vile "Template_PSL_Base"') do copy Template_PSL_Base\build_all.bat "%%F"\*