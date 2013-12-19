HardwareSerial mySerial1(5);

void setup() {
  // put your setup code here, to run once:
//  delay(3000);  
  Serial.begin(115200);
  mySerial1.begin(115200); 
  pinMode(WAL0, OUTPUT);
 digitalWrite(WAL0, HIGH); 
   pinMode(WAL2, OUTPUT);
 digitalWrite(WAL2, HIGH); 
   pinMode(WAL4, OUTPUT);
 digitalWrite(WAL4, HIGH); 
   pinMode(WAL6, OUTPUT);
 digitalWrite(WAL6, HIGH); 
}

void loop() {
  // put your main code here, to run repeatedly: 
  if (mySerial1.available()) {
   Serial.write(mySerial1.read()); 
  }
  if (Serial.available()) {
   mySerial1.write(Serial.read()); 
  }  
}
