/*
 Gadget Factory
 Papilio Schematic Library Example
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

 Papilio DUO
   Click to program bit file: sketchdir://DUO_LX9/papilio_duo_lx9.bit
   Click to view schematic:   sketchdir://schematic_papilio_DUO.pdf
   Click to modify schematic: sketchdir://PSL_Papilio_DUO_LX9.xise

 Tutorials:
   http://gadgetfactory.net/learn/2013/10/29/papilio-schematic-library-getting-started/
  
 Related library documentation:

 Hardware:
   This example circuit is wired for an Audio Wing connected to CH, to use with any of the other hardware click the link to modify the schematic to adjust for your hardware.
 
 Board Type:
   ZPUino Vanilla Variant for your hardware type
   
 Special Application Notes:

 created 2014
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

int ledPins[] = { 
  0, 2, 4, 6, 15, 17, 19, 21, 25, 29, 33, 37, 41, 45, 49, 53, 22, 26, 30, 34, 38, 42, 46, 50  };       // an array of pin numbers to which LEDs are attached
int ledCount = 24;           // the number of pins (i.e. the length of the array)

int buttonPins[] = { 
  1, 3, 5, 7, 14, 16, 18, 20, 23, 27, 31, 35, 39, 43, 47, 51, 24, 28, 32, 36, 40, 44, 48, 52 };       // an array of pin numbers to which Buttons are attached
int buttonCount = 24;           // the number of pins (i.e. the length of the array)

// variables will change:
int buttonState = 0;         // variable for reading the pushbutton status
int thisPin;
int ledState = LOW;

// first visible ASCIIcharacter '!' is number 33:
int thisByte = 33; 
// you can also write ASCII characters in single quotes.
// for example. '!' is the same as 33, so you could also use this:
//int thisByte = '!'; 

void setup() {
  // initialize the LED pins as an output:
  for (int thisPin = 0; thisPin < ledCount; thisPin++)  {
    pinMode(ledPins[thisPin], OUTPUT);  
  }
  
  // initialize the pushbutton pin as an input:
  for (int thisPin = 0; thisPin < ledCount; thisPin++)  {
    pinMode(buttonPins[thisPin], INPUT);      
  }  
  
  //Free up ISP pins
  pinMode(10, INPUT);
  pinMode(11, INPUT);
  pinMode(12, INPUT);
  pinMode(13, INPUT);
  
  //Delay for 5 seconds to prevent detection as a Micorsoft Serial BallPoint serial mouse.
  delay(5000);
  
  //Setup Serial port and send out Title
  Serial.begin(9600); 

  // prints title with ending line break 
  Serial.println("Papilio DUO Quick Start V1.0 - ASCII Table ~ Character Map"); 
}

void loop(){
  //This sends the ASCII table to the serial port.
  
  // prints value unaltered, i.e. the raw binary version of the 
  // byte. The serial monitor interprets all bytes as 
  // ASCII, so 33, the first number,  will show up as '!' 
  //Serial.print(thisByte, BYTE);    

  Serial.print("dec: "); 
  // prints value as string as an ASCII-encoded decimal (base 10).
  // Decimal is the  default format for Serial.print() and Serial.println(),
  // so no modifier is needed:
  Serial.print(thisByte);      
  // But you can declare the modifier for decimal if you want to.
  //this also works if you uncomment it:

  // Serial.print(thisByte, DEC);  


  Serial.print(", hex: "); 
  // prints value as string in hexadecimal (base 16):
  Serial.print(thisByte, HEX);     

  Serial.print(", oct: "); 
  // prints value as string in octal (base 8);
  Serial.print(thisByte, OCT);     

  Serial.print(", bin: "); 
  // prints value as string in binary (base 2) 
  // also prints ending line break:
  Serial.println(thisByte, BIN);   

  // if printed last visible character '~' or 126, stop: 
  if(thisByte == 126) {     // you could also use if (thisByte == '~') {
    thisByte = 33;
  } 
  // go on to the next character
  thisByte++;  
  
  //This section blinks the LED's and keeps them solid if a button is pressed. 
  delay(200);                  // wait for a second 
  ledState = !ledState;  
  for (int thisPin = 0; thisPin < buttonCount; thisPin++)  {
    // read the state of the pushbutton value:
    buttonState = digitalRead(buttonPins[thisPin]);
  
    // check if the pushbutton is pressed.
    // if it is, the buttonState is HIGH:
    if (buttonState == HIGH) {     
      // turn LED on:    
      digitalWrite(ledPins[thisPin], HIGH);  
    } 
    else {
      // toggle LED:
      digitalWrite(ledPins[thisPin], ledState); 
    }
  }
  //digitalWrite(13,ledState);  //For LED1
}
