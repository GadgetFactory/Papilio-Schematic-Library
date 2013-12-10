/*
  Gadget Factory
  Wishbone Example
  
 Hardware:
 Will work on Papilio Pro and Papilo One 500K
 
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
  Serial.begin(9600);

  //Set our Wishbone registers to a value
  MYREG(0) = 0xDEADBEEF;
  MYREG(1) = 0xFFFFFFFF;
  MYREG(2) = 0xEE;       //8-bit register

}

void loop() {
  // put your main code here, to run repeatedly: 
  
  //Read and printout our Wishbone registers
  Serial.print("Register0: ");
  Serial.println(MYREG(0),HEX);
  Serial.print("Register1: ");
  Serial.println(MYREG(1),HEX);
  Serial.print("Register2: ");
  Serial.println(MYREG(2),HEX);
  
  delay(3000);
}
