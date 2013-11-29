/*
  Gadget Factory
  SID Audio Player Example
  
 SID libraries
 http://www.papilio.cc/index.php?n=Papilio.SID
 http://www.papilio.cc/index.php?n=Papilio.SIDVoice
 
 Hardware:
 Due to the size of the sid libraries this will only run on the Papilio Pro.
 This will work with any hardware with an audio jack: Audio Wing, LogicStart MegaWing, Arcade MegaWing, RetroCade MegaWing.
 
 ZPUino Variant:
 Use the Papilio Schematic Library to create a ZPUino that contains the SID audio component.

 created 2013
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */
#define FREQ 17000          //Freq for all players 

#include <SD.h>
#include "SID.h"
#include "SmallFS.h"
#include "ramFS.h"
#include "cbuffer.h"
#include "sidplayer.h"

SIDPLAYER sidplayer;

int sidplayercounter = 0;

void setup() {
  //delay(3000);
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("Starting");
  
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
    
  //Set what wishbone slot the sid device is connected to.
  sidplayer.setup(5);  
  
  sidplayer.loadFile("music.sid");
  sidplayer.play(true); 
  
}

void _zpu_interrupt()
{
  //Interrupt runs at 17KHz
  sidplayercounter++;
  //We need 50Hz for SID
  if (sidplayercounter == 340) {
    sidplayer.zpu_interrupt(); 
    sidplayercounter = 1;
  }
  TMR0CTL &= ~(BIT(TCTLIF));
}

void loop() {
  Serial.println("running");
  // put your main code here, to run repeatedly: 
  if (sidplayer.getPlaying() == 1)    
    sidplayer.audiofill();  
}
