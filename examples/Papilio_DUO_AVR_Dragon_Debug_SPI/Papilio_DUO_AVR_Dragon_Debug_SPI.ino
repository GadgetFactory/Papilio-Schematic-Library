/*
 Gadget Factory
 Use this circuit to connect an AVR Dragon debugger to the Papilio DUO. You can use this to program and debug the ATmega32U4 using AVR Studio.
 
 There is a tutorial for this circuit on the Learn website:
 Todo: add the url. 
 
 To learn more about the Papilio Schematic Library please visit http://learn.gadgetfactory.net
 
 To use this sketch do the following steps:
 1)
 Load the bit file that defines the circuit required by this sketch by clicking on the bit file link below that corresponds to the type of Papilio board you have. 
 You should see the Papilio Loader pop up and program the circuit for this example to your Papilio Board. 
 IMPORTANT NOTE: Please be sure that you are programming the bit file to SPI Flash. ZPUino will not work if written to FPGA only.
 
 2)
 Make sure you have selected the correct ZPUino board type and com port, the Papilio always uses channel B of the FT2232 so it is usually the second com port you see.
 The board type should be ZPUino Vanilla or Hyperion depending on what the schematic shows, or look at the Board Type section below.
 Be sure to select the board type for the type of Papilio you have.
 
 3)
 Make sure you have the required hardware attached to your Papilio, look at the schematic to see what is required. Or look at the Hardware section below.
 You can open a PDF showing the circuit defined in the bit file by selecting the appropriate link to view the scheamtic for the type of Papilio board you have.

 4)
 Run the sketch, it should communicate with the ZPUino included in the bit file you loaded earlier. 
 
 If you want to modify the circuit then make sure you have Xilinx ISE Webpack installed and click on the appropriate link below to modify the schematic.
 If you do not have Xilinx ISE Webpack installed visit this tutorial to learn how. http://gadgetfactory.net/learn/2013/10/23/install-xilinxs-free-ise-webpack/
 
 If the links below do not work then then open the sketch directory from Sketch/Show Sketch Folder (Ctl-K) and manually access the files defined in the links below.
 
 Papilio Pro
   Click to program bit file: sketchdir://LX9/papilio_pro.bit
   Click to view schematic:   sketchdir://schematic_papilio_pro.pdf
   Click to modify schematic: sketchdir://PSL_Papilio_Pro_LX9.xise
  
 Tutorials:
   http://gadgetfactory.net/learn/2013/10/29/papilio-schematic-library-getting-started/
  
 Related library documentation:

 Hardware:
   To connect the Dragon to the DUO turn the Dragon upside down and line up pin 1 of the Dragon's JTAG port with pin 53 of the Papilio DUO. If this is done correctly then all of the pins for the ISP and JTAG ports will be connected to the Papilio DUO at once.

   
 Special Application Notes:

 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 There is no code to accompany this example.
 */

