/*
OVERVIEW
Thank you for using the Papilio ZAP IDE! This is the one place to go for all of your Papilio needs.

Use this system to Draw and Debug circuits for your FPGA without learning VHDL! 
Use the included schematic library to draw circuits with basic building blocks such as logic gates, shifters, multiplexers, and more. 
Or get higher level and design circuits with Soft Processors and peripherals such as UARTs, audio chips, VGA adapters, and bit coin miners. 
Debug your circuits with the included Logic Analyzer and virtual instruments such as switches, buttons, LEDs, and seven segment displays.

Papilio ZAP IDE brings all of the pieces of FPGA development together in one place making it easy to design FPGA circuits without becoming a VHDL guru. 

SETUP
If this is your first time using the Papilio ZAP IDE then please take some time to install Xilinx's ISE software and setup the environment.
http://gadgetfactory.net/learn/2013/10/23/install-xilinxs-free-ise-webpack/
http://gadgetfactory.net/learn/2013/10/29/papilio-schematic-library-getting-started/

USAGE
Start with any of the example projects linked below or create a new project with the Papilio/New Project menu.

When you have a project open you will see links in the comment section for loading a bit file, viewing the schematic of what's contained in the bit file, or editing the schematic and updating the bit file.

If you want to use the project as it is then click on the bit file link to load the circuit to your Papilio FPGA board. 
If the circuit includes a soft processor then you can load the sketch to the soft processor by selecting the appropriate serial port and clicking upload.

If you want to make your own circuit or modify an existing circuit then click on the link to modify the schematic. 
This will open up the project in Xilinx ISE and allow you to modify the schematic and synthesize a new bit file. 
After the bit file is updated you will have to click on the bit file link to load the new bit file to your Papilio FPGA.

TROUBLESHOOTING
Visit the following website for common problems.
http://gadgetfactory.net/learn/2014/03/06/papilio-designlab-software-common-problems/

Or visit the Papilio Forums.
http://forum.gadgetfactory.net

ZPUINO SOFT PROCESSOR PROJECTS
	Audio Project - Playing Amiga Mod Files
	Relive the glory days of the Amiga by playing those 16-bit Amiga Mod files on your Papilio. 
	This project uses a ZPUino Soft Processor with a wishbone audio passthrough hardware device connected to a delta-sigma DAC.
	There is a port of a small Amiga Mod player that runs on the ZPUino soft processor and generates audio data that is sent through the wishbone bus to the audio passthrough hardware.
	example://Audio_ModFile_simple/Audio_ModFile_simple.ino

	Audio Project - Commodore 64 SID
	Play those old Commodore 64 SID files or make a MIDI instrument with the Commodore 64 SID chip. 
	The VHDL model of the Commodore SID chip was created from a famous interview with Bob Yannes where he detailed the digital logic that was used to create the SID chip. 
	VHDL hackers were quick to jump on this information and recreate the SID chip with the exact same details of the original chip. 
	The exciting part is that the source code has the original interview in the comments, so you can go through the interview and see how the VHDL for what Bob Yannes described works. 
	A great learning tool indeed!
	No VHDL is required to use this chip though, its all schematic goodness. Just drop the chip onto a wishbone bus and use the included Arduino style libraries to drive it. This project shows you how.
	example://Audio_SID_simple/Audio_SID_simple.ino
	
	Audio Project - YM2149 Audio Chip
	Much like the Commodore project but with the YM2149 audio chip used in the Atari ST. There are tons of ym files out there and this chip and included libraries lets you play them all!
	example://Audio_YM2149_simple/Audio_YM2149_simple.ino
	
	Audio Project - RetroCade Synth
	How about putting all of these audio chips together and putting them under MIDI control? That's what this project does, there is even a special MegaWing to provide high quality audio jacks, MIDI connnectors, and a Digital readout.
	example://Audio_RetroCade_Synth/Audio_RetroCade_Synth.ino
	
	Hardware Project - LogicStart MegaWing 
	This is a demo project that shows you how to use draw a circuit that uses all of the LogicStart MegaWing components.
	example://MegaWing_Logicstart/MegaWing_Logicstart.ino
	
	Hardware Project - Analog Wing 
	This is a demo project that shows you how to use draw a circuit to use the SPI ADC Analog Wing.
	example://WING_Analog/WING_Analog.ino	
	
	Hardware Project - VGA8 Wing 
	This is a demo project that shows you how to use draw a circuit to use the 8 color VGA Wing.
	example://Wing_VGA8/Wing_VGA8.ino	

BENCHY DEBUGGING PROJECTS
	Waveform Generator
	Generate sin, cos, sawtooth, and square waves and control the frequency using a sketch.
	example://Benchy_Waveform_Generator/Benchy_Waveform_Generator.ino
	
	Stand Alone Logic Analyzer
	This is the "Sump" Logic Analyzer that is used in the Open Bench Logic Sniffer. Use this to make a standalone logic analyzer that is directly connected to the Papilio serial port. Sample at speeds up to 200Mhz!
	example://Benchy_Sump_LogicAnalyzer/Benchy_Sump_LogicAnalyzer.ino

	JTAG Logic Analyzer
	This is the "Sump" Logic Analyzer that is used in the Open Bench Logic Sniffer. This example uses the JTAG channel to communicate with your computer. 
	This allows you to debug your circuits without using the precious serial port. 
	Drop this into your circuit designs and probe your signals without impacting your design. Sample at speeds up to 200Mhz!
	example://Benchy_Sump_LogicAnalyzer_JTAG/Benchy_Sump_LogicAnalyzer_JTAG.ino
	
*/