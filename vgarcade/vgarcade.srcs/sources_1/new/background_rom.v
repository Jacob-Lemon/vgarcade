`timescale 1ns/1ps

module background_rom
	(
		input wire clk,
		input wire [8:0] row,
		input wire [9:0] col,
		output reg [11:0] color_data
	);

	// (* rom_style = "block" *)

	//signal declaration
	reg [8:0] row_reg;
	reg [9:0] col_reg;

	always @(posedge clk)
		begin
		row_reg <= row;
		col_reg <= col;
		end

    // 640 x 480
    always @* begin
        // if ({row,col} >= 19'b000000000_0000000000 && {row,col} <= )
        if (row >= 0 && row <= 120)
            color_data = 12'b1111_0000_0000;
        else if (row >= 120 && row <= 240)
            color_data = 12'b0000_1111_0000;
        else if (row >= 240 && row <= 360)
            color_data = 12'b0000_0000_1111;
        else if (row >= 360 && row <= 480)
            color_data = 12'b0000_1111_1111;
        else
            color_data = 12'b000000000000;
    
    end // end if else block

endmodule