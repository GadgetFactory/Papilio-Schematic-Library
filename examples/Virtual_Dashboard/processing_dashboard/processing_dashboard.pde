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
int ret;
int x = 30;
PFont fontA;
PFont smallfont;
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
  
  //7 Segment
  //size(550,220);
  smooth();
  frameRate(20);
  smallfont = loadFont("LiquidCrystal-128.vlw");
  textFont(smallfont);   
  textSize(128);
  //textAlign(CENTER);
  fill(202, 35, 55);  
}

void draw() {
  
  client.write(0x2);
  background(255);
  
  // Read data
  if (client.available() > 0) {
    ret = client.readBytesUntil(delim,byteBuffer);
    //String myString = new String(byteBuffer);
    data = int(byteBuffer[2]);
    // The incoming data is used to color the background.
    //background(data); 
    //data = byteBuffer[2];
    //text(hex(byteBuffer[2]), x, 60);
    println(hex(byteBuffer[2]));    
  }
  
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
  
    fill(202, 35, 55);
    text(hex(data,2),0, 150);
    text(nf(data,3),300, 150);
  
  delay(100);
}
