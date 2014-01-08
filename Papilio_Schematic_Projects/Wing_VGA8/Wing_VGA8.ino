/*
 Gadget Factory
 VGA Bricks Example
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
   http://papilio.cc/index.php?n=Papilio.VGAWingIntroduction
  
 Related library documentation:

 Hardware:
   This example circuit is wired for an VGA Wing connected to CH, to use with any of the other hardware click the link to modify the schematic to adjust for your hardware.
 
 Board Type:
   ZPUino Hyperion "The Lord of Light" with HQVGA adapter for your hardware type

 created 2014
 by Alvaro Lopes
 http://www.gadgetfactory.net
 
 This example code is in the public domain.
 */

#define VGABASE IO_SLOT(9)
#define CHARRAMBASE IO_SLOT(10)

#define VGAPTR REGISTER(VGABASE,0);
#define CHARRAMPTR REGISTER(CHARRAMBASE,0);

#define HSIZE (800/5)     /* 160 */
#define VSIZE (600/5)

unsigned char blocks[8][4]; /* 20 h, 4 v */

typedef volatile unsigned char *vgaptr_t;

#define HSync WING_A_1
#define VSync WING_A_0
#define Red0 WING_A_7
#define Red1 WING_A_5
#define Green0 WING_A_6
#define Green1 WING_A_4
#define Blue0 WING_A_2
#define Blue1 WING_A_3

void setup_pin_select() {
  pinMode(HSync,OUTPUT);
  digitalWrite(HSync,HIGH);
  outputPinForFunction(HSync, 15);
  pinModePPS(HSync, HIGH);

  pinMode(VSync,OUTPUT);
  digitalWrite(VSync,HIGH);
  outputPinForFunction(VSync, 14);
  pinModePPS(VSync, HIGH);   
  
  pinMode(Red0,OUTPUT);
  digitalWrite(Red0,HIGH);
  outputPinForFunction(Red0, 9);
  pinModePPS(Red0, HIGH);   

  pinMode(Red1,OUTPUT);
  digitalWrite(Red1,HIGH);
  outputPinForFunction(Red1, 8);
  pinModePPS(Red1, HIGH); 
  
  pinMode(Green0,OUTPUT);
  digitalWrite(Green0,HIGH);
  outputPinForFunction(Green0, 11);
  pinModePPS(Green0, HIGH); 

  pinMode(Green1,OUTPUT);
  digitalWrite(Green1,HIGH);
  outputPinForFunction(Green1, 10);
  pinModePPS(Green1, HIGH); 

  pinMode(Blue0,OUTPUT);
  digitalWrite(Blue0,HIGH);
  outputPinForFunction(Blue0, 13);
  pinModePPS(Blue0, HIGH); 

  pinMode(Blue1,OUTPUT);
  digitalWrite(Blue1,HIGH);
  outputPinForFunction(Blue1, 12);
  pinModePPS(Blue1, HIGH);     
}

void setup() {
  
  //Uncomment this if you are using the pinselect variant
  setup_pin_select();
  
	/* For simulation, test only */
	clear();
	test();

	printtext(20,100,"This is a demo",0xf0,0x00);

	init_blocks();
	draw_blocks();
}  

void test()
{
	volatile unsigned int *vmem = &VGAPTR;
	unsigned a;
	*vmem++ = 0xfe;
	*vmem = 0xd0;
	vmem--;
	a = *vmem;
	if (a!=0xfe) {
		printtext(10,10,"Err1",0xff,0x00);
		while(1) {}
	}

	*vmem++ = a;
	a = *vmem;
	if (a!=0xd0) {
		printtext(10,10,"Err2",0xff,0x00);
		while(1) {}
	}

}


void init_blocks()
{
	int i,j;
	const char colors[4]={0xFF,0xE0,0x1C,0x3};
	for (j=0;j<4;j++)
		for (i=0;i<8;i++) {
			blocks[i][j] = colors[j];
		}
}

void draw_blocks()
{
	int i,j,z,t;

	volatile unsigned int *vmem = &VGAPTR;

	for (j=0;j<4;j++) {
		for (t=3;t!=0;t--) {
			for (i=0;i<8;i++) {
				*vmem++ = 0x0; // Clear
				for (z=18;z!=0;z--)
					*vmem++=blocks[i][j];
				*vmem++ = 0x0; // Clear
			}
		}
		/* Clear line */
		for(z=HSIZE;z!=0;z--)
			*vmem++=0x0;
	}
}

void printchar(unsigned int x, unsigned int y, unsigned int c, int fgcolor, int bgcolor)
{
	volatile unsigned int *vmem = &VGAPTR;
	volatile unsigned int *vchar = &CHARRAMPTR;
	int i,j;
	unsigned int v;

	vchar += c << 3;

	//vmem += x + (y*HSIZE);
	for (i=0; i<8;i++) {
		v = *vchar;
		for (j=0; j<8;j++) {

			int rx,ry;
			rx = x + j;
			ry = (y + i);

			/* Check bounds */
			if (rx>=0 && rx<HSIZE && ry>=0 &&  ry<VSIZE) {
				rx = rx + ry * HSIZE;


				if (v&0x80) {
					vmem[rx] = fgcolor;
				} else {
					//if (!(bgcolor<0)) {
					vmem[rx] = bgcolor;
					// }
				}
				//vmem++;
				v<<=1;
			}
		}
		vchar++;
	}
}

void printchar_trans(unsigned int x, unsigned int y, unsigned char c, int fgcolor)
{
	volatile unsigned int *vmem = &VGAPTR;
	volatile unsigned int *vchar = &CHARRAMPTR;
	int i,j,v;

	vchar += c*8;

	vmem += x + (y*HSIZE);
	for (i=8; i!=0;i--) {
		v = *vchar++;
		for (j=8; j!=0;j--) {
			if (v&0x80) {
				*vmem = fgcolor;
			} 
			vmem++;
			v<<=1;
		}
		vmem+=HSIZE - 8;
	}
}

unsigned char save[8*8] = {0};


void save8x8(unsigned x, unsigned y)
{
	volatile unsigned int *vmem = &VGAPTR;
	unsigned char *sptr=&save[0];
	unsigned w,h;
	vmem += x + (y*HSIZE);

	for (h=0;h<8;h++) {
		for (w=0;w<8;w++) {
			*sptr = *vmem & 0xff;
			//*vmem = 0;//*sptr;
			vmem++;
			sptr++;
		}
		vmem+=HSIZE-8;
	}
}

void restore8x8(unsigned x, unsigned y)
{
	volatile unsigned int *vmem = &VGAPTR;
	unsigned char *sptr=&save[0];
	unsigned w,h;
	vmem += x + (y*HSIZE);

	for (h=0;h<8;h++) {
		for (w=0;w<8;w++) {
			*vmem++ = *sptr++;
		}
		vmem+=HSIZE-8;
	}
}


void clear_at(unsigned x, unsigned y, unsigned width, unsigned height, unsigned color)
{
	volatile unsigned int *vmem = &VGAPTR;
	unsigned w,h;
	vmem += x + (y*HSIZE);

	for (h=0;h<height;h++) {
		for (w=0;w<width;w++) {
			*vmem++=color;
		}
		vmem+=HSIZE-width;
	}
}


void draw_ball(unsigned x, unsigned y)
{
	printchar_trans(x,y,'*',0xff);
}


void clear()
{
	volatile unsigned int *vmem = &VGAPTR;
	unsigned i;
	for(i=HSIZE*VSIZE;i!=0;i--) {
		*vmem++=0;
	}
}


void printtext(unsigned x, unsigned y, const char *text, unsigned fg,unsigned bg)
{
	while (*text) {
		printchar(x,y,*text,fg,bg);
		text++;
		x+=8;
	}
}

int bx=0,by=VSIZE-8-8;
int deltax=1,deltay=-1;


void check_collision()
{
	if (bx >= HSIZE-8) {
		deltax=-1;
	}
	if (bx==0) {
		deltax=1;
	}
	if (by >= VSIZE-8) {
		deltay=-1;
	}
	if (by==0) {
		deltay=1;
	}

	if (by> 4*4 ) {
		return;
	}

	/* Ok, check collision here */
	int byl, bxl;
	byl = by + deltay;
	bxl = bx + deltax;

	/* Y collision */
	unsigned ybrick = byl>>2; /* Divide 4 */
	unsigned xbrick = bxl/20; /* Divide 20 */

	unsigned char bval = blocks[xbrick][ybrick];

	if (bval!=0) {
		deltay = -1 * deltay;
		//blocks[xbrick][ybrick] = 0;
		/* Clear block */
		//clear_at(xbrick*20,ybrick<<2,20,4,0x00);
		return;
	}
}

const char *scrtext = "                    Welcome to this demo. This is "
"a ZPUino based system, with a VGA color output. "
" My hovercraft is full of eels.";
int xoffset = 0;


void draw_shifting_text()
{
	const char *text = &scrtext[xoffset>>3];

	if (!*text) {
		xoffset=0;
		text = &scrtext[0];
	}

	int i,x,y=30;

    x = 0 - (xoffset & 0x7);
	for (i=0; i<=HSIZE/8; i++) {
		printchar(x,y,*text,0xff,0x3);
		if (*text)
			text++;
		x+=8;
	}

	xoffset++;
}


void loop()
{

	int z=0;
	int bxq=bx,byq=by;
	do {
		if ((z&0xf) == 0xf)
			draw_shifting_text();
		z++;
		z&=0xffff;
		restore8x8(bxq,byq);
		save8x8(bx,by);

		draw_ball(bx,by);

		delay(5);
		bxq=bx,byq=by;

		//clear_at(bx,by,8,8,0x00);

		check_collision();
		bx+=deltax;
		by+=deltay;
	} while (1);
}

