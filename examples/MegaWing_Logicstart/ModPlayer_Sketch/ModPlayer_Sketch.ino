/*
  Gadget Factory
  Mod File Example
   
 Hardware:
 Due to the size of the mod player libraries this will only run on the Papilio Pro.
 This will work with any hardware with an audio jack: Audio Wing, LogicStart MegaWing, Arcade MegaWing, RetroCade MegaWing.
 
 ZPUino Variant:
 Use the Papilio Schematic Library to create a ZPUino that contains the audio passthrough component.

 created 2013
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
#define FREQ 17000          //Freq for all players 

#include <SD.h>
#include "SmallFS.h"
#include "modplayer.h"
#include "ramFS.h"
#include "cbuffer.h"

MODPLAYER modplayer;

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
  
}

void _zpu_interrupt()
{
  //Interrupt runs at 17KHz
  modplayer.zpu_interrupt();
}

void loop() {
  // put your main code here, to run repeatedly: 
  if (modplayer.getPlaying() == 1)
    modplayer.audiofill();
}
