// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 19-4: Client reading values as background color

// Import the net libraries
import processing.net.*;
// Declare a client
Client client;
// The data we will read from the server
int data;
int x = 30;
PFont fontA;
int delim = 0xdd;
byte[] byteBuffer = new byte[10];
float[][] LIGHT = new float[8][2];
int count;

void setup() {
  size(600, 400);
  colorMode(RGB, 255);
  background(255);
  fontA = loadFont("Ziggurat-HTF-Black-32.vlw");
  // Set the font and its size (in units of pixels)
  textFont(fontA, 32);  
  
  // Create the Client
  client = new Client(this,"127.0.0.1", 5000);
  //LIGHT[1][0] = 1;
}

void draw() {
  
  client.write(0x2);
  background(255);
  
  // Read data
  if (client.available() > 0) {
    data = client.readBytesUntil(delim,byteBuffer);
    //String myString = new String(byteBuffer);
    //data = int(byteBuffer[2]);
    // The incoming data is used to color the background.
    //background(data); 
    text(hex(byteBuffer[2]), x, 60);
    println(hex(byteBuffer[2]));    
  }
  
//  for (int i=7; i>=0; i--) {
//    //println((byteBuffer[2] & (1<<i)));
//    if ((byteBuffer[2] & (1<<i)) >= 1) {
//      // i-th bit is set
//      LIGHT[i][0] = 1;
//    } else {
//      // i-th bit is clear
//      LIGHT[i][0] = 0;
//    }
//  }  
//int x = 7;
for (int x=7; x>=0; x--) {
  //println(byteBuffer[2] & 1);
  LIGHT[x][0] = byteBuffer[2] & 1;
  byteBuffer[2] = byte(byteBuffer[2] >> 1);
  //x--;
}   
  
  for (int i = 0 ; i < 8 ; i++) {
    for (int j = 0 ; j < 2 ; j++) {
      if (LIGHT[i][j] % 4 == 1) {
        fill(255, 0, 0);
      } else if (LIGHT[i][j] % 4 == 2) {
        fill(0, 255, 0);
      } else if (LIGHT[i][j] % 4 == 3) {
        fill(0, 0, 255);
      } else if (LIGHT[i][j] % 4 == 0) {
        fill(255);
      }

      ellipse((i * 20) + 10, (j * 20) + 10, 20, 20);
    }
  }  

  
  delay(3000);
}
