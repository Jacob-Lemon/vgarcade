module instructions_rom (
    input wire clk,
    input wire [8:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);


    always @(posedge clk) begin
		color_data <= 12'b110110111011;
	end	    

endmodule