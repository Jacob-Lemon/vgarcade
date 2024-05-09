`timescale 1ns/1ps


module uart_tx 
(
 input 	     clk,
 input 	     rst_n,
 input [7:0] d_out,
 input 	     start,
 output reg  done,
 output reg  tx
 );

   parameter N=5000*2;
   
   integer state;
   integer bit_index;
   

   localparam WAIT = 0;
   localparam SEND = 1;
   localparam STOP = 2;
   


   
   initial begin
      tx   = 1;
      done = 0;
      state = WAIT;      
   end

   // Clock divider process:
   reg start_d;
   reg uart_clk;
   integer clk_count;
   
   always @(posedge clk) begin
      start_d <= start;

      if ((state==WAIT) && start && !start_d) begin
	 clk_count <= 0;
	 uart_clk  <= 0;	 
      end
      else if ((state == SEND)||((state==STOP)&&!uart_clk)) begin
	 if (clk_count == N) begin
	    uart_clk  <= 1;
	    clk_count <= 0;	    
	 end
	 else begin
	    uart_clk  <= 0;
	    clk_count <= clk_count + 1;	
	 end
      end
      else
	uart_clk <= 0;      
   end
   
   
   always @(posedge clk) begin
      if (!rst_n) begin
	 // Reset behavior:
	 state <= WAIT;
	 tx    <= 1;
	 done  <= 0;	 
      end
      else begin
	 // Normal behavior:
	 case (state)
	   WAIT: begin
	      bit_index <= 0;
	      done      <= 0;
	      
	      if (start) begin
		 tx    <= 0;
		 state <= SEND;		 		 
	      end
	   end
	   SEND: begin
	      if (uart_clk) begin
		 tx        <= d_out[bit_index];
		 bit_index <= bit_index + 1;
	      
		 if (bit_index == 8)
		   state <= STOP;		 
	      end  
	   end
	   STOP: begin
	      tx <= 1;
	      
	      if (uart_clk) begin
		 done <= 1;
		 if (!start)
		   state <= WAIT;		 
	      end	      
	   end
	   default: begin
	      state <= WAIT;
	      done  <= 0;
	      tx    <= 1;	      
	   end
	 endcase // case ()
	 
      end
   
   end
   
endmodule
