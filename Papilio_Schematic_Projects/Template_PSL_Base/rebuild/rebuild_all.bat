copy * ..\*
del ..\rebuild_all.bat
cd ..
mkdir xst\projnav.tmp
Papilio_Pro.cmd
clean.bat
Papilio_One_500K.cmd
clean.bat
Papilio_One_250K.cmd
clean.bat