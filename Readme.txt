Papilio Schematic Library - Schematic System on Chip (Source Code) - Current Version 1.4

Papilio SOC Home Page
http://papilio.cc

CHANGELOG
12/27/2013 Version 1.4.2
	-Fix for LogicStart GPIO problem.

12/20/2013 Version 1.4
	-Wishbone Template, for users to make their own Wishbone peripherals.
	-Benchy Waveform generator - generate sin, cos, and sawtooth waveforms.
	-Added a bunch of clock options - convert the 32Mhz clock to other standard speeds - 50Mhz, 100Mhz, 300Mhz, 900Mhz.
	-HQVGA - Use the VGA library with this HQVGA adapter in your project.
	-Hyperion Soft Processor for Papilio One 500K. Hyperion uses less BRAM memory for program code so you can use the HQVGA adapter on a P1 500K.
	-Sump Blaze Logic Analyzer - Add a logic analyzer to your project and debug external pins or internal FPGA logic.
	-LogicStart MegaWing Symbol
	-Arcade MegaWing Symbol (untested)

11/29/2013 Version 1.3
	-Support for Wing types allow you to connect a wing that overrides GPIO.
	-Audio example projects.
	-Made ZPUino symbols more spread out.

11/21/2013 Version 1.2
	-Support for Papilio One 250K board.
	-Base template projects were consolidated into a single directory.
	-The order of the Wing slots on the hardware symbols were re-ordered to be more user friendly.
	-Symbols were renamed to look nicer in a list.
	-Clocks were added to the soft processor symbols.
	-All VHDL files moved into libraries.

11/5/2013 Version 1.1
	-Wishbone buses were streamlined down to two connections.
	-Symbols were renamed and Symbol Library re-organized.
	-Wings A, B, and C were broken down from buses into individual pins.

9/12/2013 Version 1.0
	Initial Release