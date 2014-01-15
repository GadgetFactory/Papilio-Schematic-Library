/*
 Gadget Factory
 LogicStart MegaWing Example
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
   
 Papilio One 500K
   Click to program bit file: sketchdir://500K/papilio_one_500k.bit
   Click to view schematic:   sketchdir://schematic_papilio_one_500k.pdf
   Click to modify schematic: sketchdir://PSL_Papilio_One_500K.xise

 Tutorials:
   http://gadgetfactory.net/learn/2013/10/29/papilio-schematic-library-getting-started/
  
 Related library documentation:

 Hardware:
   This example circuit is wired for an VGA Wing connected to CH, to use with any of the other hardware click the link to modify the schematic to adjust for your hardware.
 
 Board Type:
   ZPUino Hyperion "The Lord of Light" with HQVGA adapter for your hardware type

 created 2014
 by Alvaro Lopes and Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

#define FREQ 17000          //Freq for all players 

#define LS_JOY_RIGHT WB11
#define LS_JOY_LEFT  WB12
#define LS_JOY_DOWN  WB13
#define LS_JOY_UP    WB14
#define LS_JOY_SELECT WB15


#include <SD.h>
#include "SmallFS.h"
#include "modplayer.h"
#include "ramFS.h"
#include "cbuffer.h"
#include "VGA.h"
#include <SevenSegHW.h>
#include "SPIADC.h"
#include "SPI.h"

MODPLAYER modplayer;
SEVENSEGHW sevenseg;

int ledPins[] = { 
  WC8, WC9, WC10, WC11, WC12, WC13, WC14, WC15  };       // an array of pin numbers to which LEDs are attached
int ledCount = 8;           // the number of pins (i.e. the length of the array)

int switchPins[] = { 
  WC0, WC1, WC2, WC3, WC4, WC5, WC6, WC7 };       // an array of pin numbers to which Buttons are attached
int switchCount = 8;           // the number of pins (i.e. the length of the array)

int buttonState = 0;         // variable for reading the pushbutton status
int thisPin;
int ledState = LOW;
unsigned adcvalue = 5;
int cnt = 0;
int extcnt = 0;
int mode = 0;
unsigned channel=0;
int timeout=0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
   //Start SmallFS
  if (SmallFS.begin()<0) {
	Serial.println("No SmalLFS found.");
  }
  else{
     Serial.println("SmallFS Started.");
  }  
  
 //Setup timer for YM and mod players, this generates an interrupt at 1700hz
  TMR0CTL = 0;
  TMR0CNT = 0;
  TMR0CMP = ((CLK_FREQ/2) / FREQ )- 1;
  TMR0CTL = _BV(TCTLENA)|_BV(TCTLCCM)|_BV(TCTLDIR)|
  	_BV(TCTLCP0) | _BV(TCTLIEN);
  INTRMASK = BIT(INTRLINE_TIMER0); // Enable Timer0 interrupt
  INTRCTL=1;     
   
  //Set what wishbone slot the audio passthrough device is connected to.
  modplayer.setup(5);

  modplayer.loadFile("music.mod");
  modplayer.play(true);
  
  //Setup VGA Hello World
  VGA.begin(VGAWISHBONESLOT(9),CHARMAPWISHBONESLOT(10));
  VGA.clear();
  VGA.setBackgroundColor(BLACK);
  VGA.setColor(RED);
  VGA.printtext(32,0," LogicStart");
  VGA.printtext(35,10,"Hello World");
  VGA.printtext(15,30, "Hello World RED");
  VGA.setColor(GREEN);
  VGA.printtext(15,40, "Hello World GREEN");
  VGA.setColor(BLUE);
  VGA.printtext(15,50, "Hello World BLUE");
  VGA.setColor(YELLOW);
  VGA.printtext(15,60, "Hello World YELLOW");
  VGA.setColor(PURPLE);
  VGA.printtext(15,70, "Hello World PURPLE");
  VGA.setColor(CYAN);
  VGA.printtext(15,80, "Hello World CYAN");
  VGA.setColor(WHITE);
  VGA.printtext(15,90, "Hello World WHITE");   
  VGA.setBackgroundColor(WHITE);  
  VGA.setColor(BLACK);  
  VGA.printtext(15,100, "Hello World BLACK"); 
  
  sevenseg.begin(11);
  sevenseg.setBrightness(15);
  sevenseg.setHexValue(0000);
  
  // initialize the LED pins as an output:
  for (int thisPin = 0; thisPin < ledCount; thisPin++)  {
    pinMode(ledPins[thisPin], OUTPUT);  
  }
  
  // initialize the switch pins as an input:
  for (int thisPin = 0; thisPin < ledCount; thisPin++)  {
    pinMode(switchPins[thisPin], INPUT);      
  }    
  
  //Start SPI ADC for analog input
  analog.begin(CS(12),WISHBONESLOT(6),ADCBITS(SPIADC_12BIT));
  
}

void _zpu_interrupt()
{
  //Interrupt runs at 17KHz
  modplayer.zpu_interrupt();
  if (timeout!=0)
    timeout--;
}

void loop() {
  // put your main code here, to run repeatedly: 
  if (modplayer.getPlaying() == 1)
    modplayer.audiofill();
    
  //Handle LED's and Switches
  for (int thisPin = 0; thisPin < switchCount; thisPin++)  {
    // read the state of the pushbutton value:
    buttonState = digitalRead(switchPins[thisPin]);
  
    // check if the switch is on.
    // if it is, the buttonState is HIGH:
    if (buttonState == HIGH) {     
      // turn LED on:    
      digitalWrite(ledPins[thisPin], HIGH);  
    } 
    else {
      // toggle LED:
      digitalWrite(ledPins[thisPin], LOW); 
    }
  }    
  
  //Handle joystick and reading SPI ADC
  if ((extcnt & 0x17) == 0) {

    if (!digitalRead(LS_JOY_SELECT)) {
      sevenseg.setHexValue(0x8888);
    } else {
      if (timeout==0) {
        if (mode==0) {
          if ((cnt & 0x3F)==0)
            sevenseg.setIntValue(analog.read(channel),1);
          } else {
            sevenseg.setIntValue(cnt,0);
          }
        }
      }

    /* Check for mode change */
    if (!digitalRead(LS_JOY_LEFT))
      mode=0;
    else if (!digitalRead(LS_JOY_RIGHT))
      mode=1;

    if (timeout==0) {
      if (!digitalRead(LS_JOY_UP)) {
        if (channel<7)
          channel++;
          /* Print something and add timeout */
          timeout = 17000;
          chanUpdate();
        } else if (!digitalRead(LS_JOY_DOWN)) {
          if (channel!=0)
            channel--;
            timeout = 17000;
            chanUpdate();
          }
    }
        cnt++;
  }
      extcnt++;
}

static void chanUpdate()
{
	sevenseg.setDigitValue(channel,0,3);
        sevenseg.custom(0,2);
        sevenseg.custom(SEGF|SEGE|SEGB|SEGC|SEGG,1);
        sevenseg.setHexValue(0xC,0);
}
