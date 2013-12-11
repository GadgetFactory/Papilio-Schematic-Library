/*
  Gadget Factory
  Wishbone Example
  
 Hardware:
 Will work on Papilio Pro and Papilo One 500K and 250K
 
 ZPUino Variant:
 Use the Papilio Schematic Library to create a ZPUino that contains the wishbone example device

 created 2013
 by Jack Gassett
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

//This is what wishbone slot you are using
#define MYBASE IO_SLOT(5)
#define MYREG(x) REGISTER(MYBASE,x) 

void setup() {
  // put your setup code here, to run once:
  
  setFreq(1.5);  //Sets in Mhz

}

void setFreq(float freq)  //sets in Mhz
{
  unsigned long long phase = freq * 44507433.119;
  MYREG(0) = phase;
}

void loop() {
  // put your main code here, to run repeatedly: 
  
}
