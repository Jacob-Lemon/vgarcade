`timescale 1ns/1ps

module uart_rx
 (
  input 	   clk,
  input 	   reset,
  input 	   rx,
  input 	   ack,
  output reg 	   d_ready,
  output reg [7:0] d_in
  );

   parameter N=5000;
   
   reg 	       rx_d;
   reg 	       start;
   reg 	       uart_clk;
   reg [8:0]   d_rx;
   
   integer     clk_count;

   integer state;
   integer bit_index;
   
   localparam WAIT=0;
   localparam RECV=1;
   localparam STOP=2;

   initial begin
      d_rx = 0;      
   end

   
   always @(posedge clk) begin
      if (reset) begin
	 rx_d <= 0;
	 clk_count <= 0;
	 start <= 0;
      end
      else begin
	 rx_d <= rx;
	 if ((state == WAIT) && !rx && rx_d) begin
	    start     <= 1;
	    clk_count <= N+N/2+N/8;	 
	 end
	 else if (state == RECV) begin
	    start <= 0;	    
	    if (clk_count == 0) begin
	       uart_clk <= 1;
	       clk_count <= clk_count + 1;	    
	    end
	    else if (clk_count == (N*2)) begin
	       clk_count <= 0;
	       uart_clk  <= 0;	       
	    end
	    else begin
	       clk_count <= clk_count + 1;
	       uart_clk <= 0;	    
	    end
	 end
	 else begin
	    //if (d_ready)
	    start <= 0;
	 end
      end
   end


   
   always @(posedge clk) begin
      if (reset) begin
	 // Reset behavior:
	 state   <= WAIT;
	 d_ready <= 0;
	 d_in    <= 0;	 
      end
      else begin
	 // Normal behavior:
	 case (state)
	   WAIT: begin
	      bit_index <= 0;
	      if (start) begin
		 d_ready <= 0;		 
		 state <= RECV;
	      end	      
	   end
	   RECV: begin
	      if (uart_clk) begin
		 d_rx[bit_index] <= rx;
		 if (bit_index == 8) begin
		    state <= STOP;
		 end
		 else begin
		    bit_index       <= bit_index + 1;
		 end


	      end
	   end
	   STOP: begin
	      d_ready <= 1;
	      d_in    <= d_rx[8:1];
	      
	      //if (ack) begin
		// d_ready <= 0;
		 state   <= WAIT;
	      //end
	   end
	   default: begin
	      state   <= WAIT;
	      d_ready <= 0;	      
	   end
	 endcase // case ()
	 
      end
   end
   
endmodule
