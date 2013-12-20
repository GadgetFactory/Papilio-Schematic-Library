HardwareSerial mySerial1(5);

int counter = 0;

void setup() {
  // put your setup code here, to run once:
//  delay(3000);  
  Serial.begin(115200);
  mySerial1.begin(115200); 
  pinMode(WAL0, OUTPUT);
  pinMode(WAL1, OUTPUT);
  pinMode(WAL2, OUTPUT);
  pinMode(WAL3, OUTPUT);
  pinMode(WAL4, OUTPUT);
  pinMode(WAL5, OUTPUT);
  pinMode(WAL6, OUTPUT);
  pinMode(WAL7, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly: 
  if (mySerial1.available()) {
   Serial.write(mySerial1.read()); 
  }
  if (Serial.available()) {
   mySerial1.write(Serial.read()); 
  }  
  GPIODATA(0) = counter;
  counter++;
  if (counter >= 255)
    counter == 0;
}
