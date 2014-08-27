

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
byte[] byteBuffer = new byte[1000];
float[][] LIGHT = new float[8][2];
int count;
PImage bOn;
PImage bOff;
PImage bOnSmall;
PImage bOffSmall;
PImage sOn;
PImage sOff;

PImage[] nixie = new PImage[12];

//PImage nixie0;
//PImage nixie1;
//PImage nixie2;
//PImage nixie3;
//PImage nixie4;
//PImage nixie5;
//PImage nixie6;
//PImage nixie7;
//PImage nixie8;
//PImage nixie9;
//PImage nixie10;
//PImage nixie11;

void setup() {
  size(900, 1000);
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
  
  //Load Buttons
  bOff = loadImage("LED_Off1.png");
  bOn = loadImage("LED_On_Green1.png");
  bOffSmall = loadImage("LED_Off_small2.png");
  bOnSmall = loadImage("LED_On_Green_small2.png"); 
  sOff = loadImage("Switch_Off.png");
  sOn = loadImage("Switch_On.png");  
  
  //Nixie images
  nixie[0] = loadImage("nixie0.png");
  nixie[1] = loadImage("nixie1.png");
  nixie[2] = loadImage("nixie2.png");
  nixie[3] = loadImage("nixie3.png");
  nixie[4] = loadImage("nixie4.png");
  nixie[5] = loadImage("nixie5.png");
  nixie[6] = loadImage("nixie6.png");
  nixie[7] = loadImage("nixie7.png");
  nixie[8] = loadImage("nixie8.png");
  nixie[9] = loadImage("nixie9.png");
  nixie[10] = loadImage("nixie10.png");
  nixie[11] = loadImage("nixie11.png");  
}

void draw() {
  
  client.write(0x2);
  
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
  
  print("Return Bytes: ");
  println(ret);
  
  if (ret == 4){
    background(255);
    for (int x=7; x>=0; x--) {
      //println(byteBuffer[2] & 1);
      LIGHT[x][0] = byteBuffer[2] & 1;
      byteBuffer[2] = byte(byteBuffer[2] >> 1);
      if (LIGHT[x][0] == 1){
        image(bOnSmall, (x*100)+42, 160);
        image(bOn, x*100, 200);
        image(sOn, (x*100)+25, 350);
      }
      else{
        image(bOffSmall, (x*100)+42, 160);
        image(bOff, x*100, 200);
        image(sOff, (x*100)+25, 350);
      }
    }   
      
    //  for (int i = 0 ; i < 8 ; i++) {
    //    for (int j = 0 ; j < 2 ; j++) {
    //      if (LIGHT[i][j] % 4 == 1) {
    //        fill(255, 0, 0);
    //      } else if (LIGHT[i][j] % 4 == 2) {
    //        fill(0, 255, 0);
    //      } else if (LIGHT[i][j] % 4 == 3) {
    //        fill(0, 0, 255);
    //      } else if (LIGHT[i][j] % 4 == 0) {
    //        fill(255);
    //      }
    //
    //      ellipse((i * 20) + 10, (j * 20) + 10, 20, 20);
    //    }
    //  }  
      
        fill(202, 35, 55);
        text(hex(data,2),475, 800);
        text(nf(data,3),650, 800);
        
        String number = String.valueOf(nf(data,3));
        for(int i = 0; i < number.length(); i++) {
            int j = Character.digit(number.charAt(i), 10);
            image(nixie[j], (i*150), 550);
            //println("digit: " + j);
        }    
  }
  delay(50);
}
