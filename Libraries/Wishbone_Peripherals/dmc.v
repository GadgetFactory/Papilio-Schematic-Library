//////////////////////////////////////////////////////////////////////////////////
// University of Toronto
// NES APU UNIT
// Engineer: Cedomir Segulja
// Create Date: 03/21/2008 
// Design Name: NES APU UNIT
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Implementation of the Delta Pulse Width Modulation Channel
//////////////////////////////////////////////////////////////////////////////////
module dmc(
           iClk, 
			  iReset,
			  iEnable, 
			  iRegister1,
			  iRegister2,
			  iRegister3,
			  iRegister4,
			  iW1, 
			  iW2, 
			  iW3, 
			  iW4,
			  iDMA_ack,
			  iDMA_data,
			  oDMA_req,
			  oDMA_addr,
			  oData,
			  oIRQ
			  );

  //-------------------------------------------------------------------------------------------------------
  //  PORTS
  //-------------------------------------------------------------------------------------------------------

  input iClk;
  input iReset;
  input iEnable;
  input [7:0] iRegister1;
  input [7:0] iRegister2;
  input [7:0] iRegister3;
  input [7:0] iRegister4;
  input iW1;
  input iW2;
  input iW3;
  input iW4;
  input iDMA_ack;
  input [7:0] iDMA_data;
  output oDMA_req;
  output [15:0] oDMA_addr;
  output reg [6:0] oData;
  output oIRQ;
    	 
  //-------------------------------------------------------------------------------------------------------
  //  DMC Clock 
  //-------------------------------------------------------------------------------------------------------
  
  wire dmc_clk;
  wire dmc_clk_reset;
  
  assign dmc_clk_reset = iReset | iW1;
  
  wire [11:0] timer_periods [15:0];
 
  assign timer_periods[0] = 12'hd60;
  assign timer_periods[1] = 12'hbe0;
  assign timer_periods[2] = 12'haa0;
  assign timer_periods[3] = 12'ha00;
  assign timer_periods[4] = 12'h8f0;
  assign timer_periods[5] = 12'h7f0;
  assign timer_periods[6] = 12'h710;
  assign timer_periods[7] = 12'h6b0;
  assign timer_periods[8] = 12'h5f0;
  assign timer_periods[9] = 12'h500;
  assign timer_periods[10] = 12'h470;
  assign timer_periods[11] = 12'h400;
  assign timer_periods[12] = 12'h350;
  assign timer_periods[13] = 12'h2a0;
  assign timer_periods[14] = 12'h240;
  assign timer_periods[15] = 12'h1b0;
    
  wire [11:0] period;
  assign period = timer_periods[iRegister1[3:0]] - 12'b1;
	 
  clock_divider #(
  	 .DIVIDER_WIDTH(9)
  ) dmc_clk_divider(
    .iClk(iClk), 
	 .iReset(dmc_clk_reset),
	 .iEnable(1'b1),
	 .iDivider(period[11:3]),
    .oClk(dmc_clk)
  );
  
  //-------------------------------------------------------------------------------------------------------
  //  Output cycle is generated every 8 cycles of the dmc clock
  //-------------------------------------------------------------------------------------------------------
  
  wire clk_8;
 
  clock_divider #(
  	 .DIVIDER_WIDTH(12)
  ) clk_8_divider(
    .iClk(iClk), 
	 .iReset(dmc_clk_reset),
	 .iEnable(1'b1),
	 .iDivider(period[11:0]),
    .oClk(clk_8)
  );
  
  //-------------------------------------------------------------------------------------------------------
  //  DMA Buffer, load data on iDMA_ack
  //-------------------------------------------------------------------------------------------------------

  reg [7:0] dma_buffer;		 
		 
  always @(posedge iClk)
  begin
    if (iDMA_ack)
      dma_buffer <= iDMA_data;
  end 
    
  //-------------------------------------------------------------------------------------------------------
  //  DMA Buffer State, cleared on output cycle
  //-------------------------------------------------------------------------------------------------------
  
  wire dmc_state_reset; 
  assign dmc_state_reset = iReset;
  
  reg dma_buffer_state;
  
  parameter BUFFER_EMPTY = 0;
  parameter BUFFER_FULL = 1;
  		 
  always @(posedge iClk or posedge dmc_state_reset)
  begin
    if (dmc_state_reset) 
	   dma_buffer_state <= BUFFER_EMPTY;
	 else begin
	   if (iDMA_ack)
	     dma_buffer_state <= BUFFER_FULL;  
	   else if (clk_8)
        dma_buffer_state <= BUFFER_EMPTY;
    end
  end 

  //-------------------------------------------------------------------------------------------------------
  //  DMC Shift Register, filled on output cycle if DMA Buffer is full, shifted on dmc_clk
  //-------------------------------------------------------------------------------------------------------
  
  reg [7:0] shift_register;
	
  always @(posedge iClk)
  begin
    if (clk_8 && (dma_buffer_state == BUFFER_FULL))
	   shift_register <= dma_buffer;
	 else
	   if (dmc_clk) shift_register <= shift_register >> 1;  
  end
  
  //-------------------------------------------------------------------------------------------------------
  //  DMC Silence flag, set if DMA Buffer is empty on output cycle otherwise cleared
  //-------------------------------------------------------------------------------------------------------
  
  reg silence_flag;
	
  always @(posedge iClk)
  begin
    if (clk_8)
	 begin
	   if (dma_buffer_state == BUFFER_FULL)
	     silence_flag <= 0;
	   else
        silence_flag <= 1;
	end
  end
  
  //-------------------------------------------------------------------------------------------------------
  //  DMC Sample Count Registers
  //-------------------------------------------------------------------------------------------------------
	 
  reg [11:0] sample_counter;
  
  wire counter_reset; 
  assign counter_reset = iW4;
  	 
  always @(posedge iClk or posedge counter_reset)
  begin
	 if (counter_reset == 1)
	 begin
      sample_counter <= {iRegister4, 4'b1}; // register4 shl 4 + 1
	 end else
	 begin
		if (iDMA_ack)
		begin
		  if (sample_counter == 0)
		  begin
			 if (iRegister1[6] == 1) 
		      sample_counter <= {iRegister4, 4'b1}; // register4 shl 4 + 1
		  end else 
		    sample_counter <= sample_counter - 1;  
	   end
    end
  end
  
  assign oDMA_req = ( iEnable && (dma_buffer_state <= BUFFER_EMPTY) && (sample_counter > 0)) ? 1:0;

  //-------------------------------------------------------------------------------------------------------
  //  DMC Sample Address Registers
  //-------------------------------------------------------------------------------------------------------
		
  reg [15:0] sample_address;
  
  wire address_reset; 
  assign address_reset = iW3;
	 	 
  always @(posedge iClk or posedge address_reset)
  begin
	 if (address_reset == 1)
	 begin
      sample_address <= {2'b11, iRegister3, 6'b0}; //register3 shl 6 or C000 ;
	 end else
	 begin
		if (iDMA_ack)
		begin
		  if (sample_counter == 0)
		  begin
			 if (iRegister1[6] == 1)
		      sample_address <= {2'b11, iRegister3, 6'b0};
		  end else
		  begin
		    if (sample_address == 16'hFFFF)
		      sample_address <= 16'h8000;
		    else
   	      sample_address <= sample_address + 1;
		  end
	   end
    end
  end
       
  assign oDMA_addr = sample_address;
    
  //-------------------------------------------------------------------------------------------------------
  //  DMC Delta Counter 
  //-------------------------------------------------------------------------------------------------------
  
  reg [5:0] delta_counter;

  wire delta_reset;
  assign delta_reset = iReset | iW2;

  always @(posedge iClk or posedge delta_reset)
  begin
    if (delta_reset)
	   delta_counter <= iRegister2[6:1]; 
	 else
	 begin
      if (dmc_clk && iEnable && !silence_flag)
		begin
		  if (shift_register[0] == 1)
        begin
          if (delta_counter < 6'b111111)
            delta_counter <= delta_counter + 1;
        end 
        else begin
          if (delta_counter > 6'b000000)
            delta_counter <= delta_counter - 1;
        end
      end
	 end
  end

  //-------------------------------------------------------------------------------------------------------
  //  DMC Interrupt 
  //-------------------------------------------------------------------------------------------------------

  assign oIRQ = ( (iRegister1[7] == 1) && (iRegister1[6] == 0) && (sample_counter == 0) && (iEnable == 1));    
  
  //-------------------------------------------------------------------------------------------------------
  //  DMC Output
  //-------------------------------------------------------------------------------------------------------
 
  always @(posedge iClk)
  begin
    if (dmc_clk)
	 begin
      if (iEnable && !silence_flag)
        oData <= {delta_counter, iRegister2[0]};
	   else oData <= 0;
	 end
  end
		
endmodule
