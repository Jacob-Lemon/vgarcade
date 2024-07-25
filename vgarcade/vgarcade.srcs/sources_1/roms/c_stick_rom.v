module c_stick_rom
	(
		input wire clk,
		input wire [5:0] row,
		input wire [5:0] col,
		output reg [11:0] color_data
	);

	(* rom_style = "distributed" *)

	//signal declaration
	reg [5:0] row_reg;
	reg [5:0] col_reg;

	always @(posedge clk)
		begin
		row_reg <= row;
		col_reg <= col;
		end

	always @*
	case ({row_reg, col_reg})
		12'b000000000000: color_data = 12'b000000000000;
		12'b000000000001: color_data = 12'b000000000000;
		12'b000000000010: color_data = 12'b000000000000;
		12'b000000000011: color_data = 12'b000000000000;
		12'b000000000100: color_data = 12'b000000000000;
		12'b000000000101: color_data = 12'b000000000000;
		12'b000000000110: color_data = 12'b000000000000;
		12'b000000000111: color_data = 12'b000000000000;
		12'b000000001000: color_data = 12'b000000000000;
		12'b000000001001: color_data = 12'b000000000000;
		12'b000000001010: color_data = 12'b000000000000;
		12'b000000001011: color_data = 12'b000000000000;
		12'b000000001100: color_data = 12'b000000000000;
		12'b000000001101: color_data = 12'b000000000000;
		12'b000000001110: color_data = 12'b000000000000;
		12'b000000001111: color_data = 12'b000000000000;
		12'b000000010000: color_data = 12'b000000000000;
		12'b000000010001: color_data = 12'b000000000000;
		12'b000000010010: color_data = 12'b000000000000;
		12'b000000010011: color_data = 12'b000000000000;
		12'b000000010100: color_data = 12'b000000000000;
		12'b000000010101: color_data = 12'b000000000000;
		12'b000000010110: color_data = 12'b000000000000;
		12'b000000010111: color_data = 12'b000000000000;
		12'b000000011000: color_data = 12'b000000000000;
		12'b000000011001: color_data = 12'b000000000000;
		12'b000000011010: color_data = 12'b000000000000;
		12'b000000011011: color_data = 12'b000000000000;
		12'b000000011100: color_data = 12'b000000000000;
		12'b000000011101: color_data = 12'b000000000000;
		12'b000000011110: color_data = 12'b000000000000;
		12'b000000011111: color_data = 12'b000000000000;
		12'b000000100000: color_data = 12'b000000000000;
		12'b000000100001: color_data = 12'b000000000000;
		12'b000000100010: color_data = 12'b000000000000;
		12'b000000100011: color_data = 12'b000000000000;
		12'b000000100100: color_data = 12'b000000000000;
		12'b000000100101: color_data = 12'b000000000000;
		12'b000000100110: color_data = 12'b000000000000;
		12'b000000100111: color_data = 12'b000000000000;
		12'b000000101000: color_data = 12'b000000000000;
		12'b000000101001: color_data = 12'b000000000000;
		12'b000000101010: color_data = 12'b000000000000;
		12'b000000101011: color_data = 12'b000000000000;
		12'b000000101100: color_data = 12'b000000000000;
		12'b000000101101: color_data = 12'b000000000000;
		12'b000000101110: color_data = 12'b000000000000;
		12'b000000101111: color_data = 12'b000000000000;
		12'b000000110000: color_data = 12'b000000000000;
		12'b000000110001: color_data = 12'b000000000000;
		12'b000000110010: color_data = 12'b000000000000;
		12'b000000110011: color_data = 12'b000000000000;
		12'b000001000000: color_data = 12'b000000000000;
		12'b000001000001: color_data = 12'b000000000000;
		12'b000001000010: color_data = 12'b000000000000;
		12'b000001000011: color_data = 12'b000000000000;
		12'b000001000100: color_data = 12'b000000000000;
		12'b000001000101: color_data = 12'b000000000000;
		12'b000001000110: color_data = 12'b000000000000;
		12'b000001000111: color_data = 12'b000000000000;
		12'b000001001000: color_data = 12'b000000000000;
		12'b000001001001: color_data = 12'b000000000000;
		12'b000001001010: color_data = 12'b000000000000;
		12'b000001001011: color_data = 12'b000000000000;
		12'b000001001100: color_data = 12'b000000000000;
		12'b000001001101: color_data = 12'b000000000000;
		12'b000001001110: color_data = 12'b000000000000;
		12'b000001001111: color_data = 12'b000000000000;
		12'b000001010000: color_data = 12'b000000000000;
		12'b000001010001: color_data = 12'b000000000000;
		12'b000001010010: color_data = 12'b000000000000;
		12'b000001100001: color_data = 12'b000000000000;
		12'b000001100010: color_data = 12'b000000000000;
		12'b000001100011: color_data = 12'b000000000000;
		12'b000001100100: color_data = 12'b000000000000;
		12'b000001100101: color_data = 12'b000000000000;
		12'b000001100110: color_data = 12'b000000000000;
		12'b000001100111: color_data = 12'b000000000000;
		12'b000001101000: color_data = 12'b000000000000;
		12'b000001101001: color_data = 12'b000000000000;
		12'b000001101010: color_data = 12'b000000000000;
		12'b000001101011: color_data = 12'b000000000000;
		12'b000001101100: color_data = 12'b000000000000;
		12'b000001101101: color_data = 12'b000000000000;
		12'b000001101110: color_data = 12'b000000000000;
		12'b000001101111: color_data = 12'b000000000000;
		12'b000001110000: color_data = 12'b000000000000;
		12'b000001110001: color_data = 12'b000000000000;
		12'b000001110010: color_data = 12'b000000000000;
		12'b000001110011: color_data = 12'b000000000000;
		12'b000010000000: color_data = 12'b000000000000;
		12'b000010000001: color_data = 12'b000000000000;
		12'b000010000010: color_data = 12'b000000000000;
		12'b000010000011: color_data = 12'b000000000000;
		12'b000010000100: color_data = 12'b000000000000;
		12'b000010000101: color_data = 12'b000000000000;
		12'b000010000110: color_data = 12'b000000000000;
		12'b000010000111: color_data = 12'b000000000000;
		12'b000010001000: color_data = 12'b000000000000;
		12'b000010001001: color_data = 12'b000000000000;
		12'b000010001010: color_data = 12'b000000000000;
		12'b000010001011: color_data = 12'b000000000000;
		12'b000010001100: color_data = 12'b000000000000;
		12'b000010001101: color_data = 12'b000000000000;
		12'b000010001110: color_data = 12'b000000000000;
		12'b000010001111: color_data = 12'b000000000000;
		12'b000010100100: color_data = 12'b000000000000;
		12'b000010100101: color_data = 12'b000000000000;
		12'b000010100110: color_data = 12'b000000000000;
		12'b000010100111: color_data = 12'b000000000000;
		12'b000010101000: color_data = 12'b000000000000;
		12'b000010101001: color_data = 12'b000000000000;
		12'b000010101010: color_data = 12'b000000000000;
		12'b000010101011: color_data = 12'b000000000000;
		12'b000010101100: color_data = 12'b000000000000;
		12'b000010101101: color_data = 12'b000000000000;
		12'b000010101110: color_data = 12'b000000000000;
		12'b000010101111: color_data = 12'b000000000000;
		12'b000010110000: color_data = 12'b000000000000;
		12'b000010110001: color_data = 12'b000000000000;
		12'b000010110010: color_data = 12'b000000000000;
		12'b000010110011: color_data = 12'b000000000000;
		12'b000011000000: color_data = 12'b000000000000;
		12'b000011000001: color_data = 12'b000000000000;
		12'b000011000010: color_data = 12'b000000000000;
		12'b000011000011: color_data = 12'b000000000000;
		12'b000011000100: color_data = 12'b000000000000;
		12'b000011000101: color_data = 12'b000000000000;
		12'b000011000110: color_data = 12'b000000000000;
		12'b000011000111: color_data = 12'b000000000000;
		12'b000011001000: color_data = 12'b000000000000;
		12'b000011001001: color_data = 12'b000000000000;
		12'b000011001010: color_data = 12'b000000000000;
		12'b000011001011: color_data = 12'b000000000000;
		12'b000011001100: color_data = 12'b000000000000;
		12'b000011001101: color_data = 12'b000000000000;
		12'b000011100110: color_data = 12'b000000000000;
		12'b000011100111: color_data = 12'b000000000000;
		12'b000011101000: color_data = 12'b000000000000;
		12'b000011101001: color_data = 12'b000000000000;
		12'b000011101010: color_data = 12'b000000000000;
		12'b000011101011: color_data = 12'b000000000000;
		12'b000011101100: color_data = 12'b000000000000;
		12'b000011101101: color_data = 12'b000000000000;
		12'b000011101110: color_data = 12'b000000000000;
		12'b000011101111: color_data = 12'b000000000000;
		12'b000011110000: color_data = 12'b000000000000;
		12'b000011110001: color_data = 12'b000000000000;
		12'b000011110010: color_data = 12'b000000000000;
		12'b000011110011: color_data = 12'b000000000000;
		12'b000100000000: color_data = 12'b000000000000;
		12'b000100000001: color_data = 12'b000000000000;
		12'b000100000010: color_data = 12'b000000000000;
		12'b000100000011: color_data = 12'b000000000000;
		12'b000100000100: color_data = 12'b000000000000;
		12'b000100000101: color_data = 12'b000000000000;
		12'b000100000110: color_data = 12'b000000000000;
		12'b000100000111: color_data = 12'b000000000000;
		12'b000100001000: color_data = 12'b000000000000;
		12'b000100001001: color_data = 12'b000000000000;
		12'b000100001010: color_data = 12'b000000000000;
		12'b000100001011: color_data = 12'b000000000000;
		12'b000100101000: color_data = 12'b000000000000;
		12'b000100101001: color_data = 12'b000000000000;
		12'b000100101010: color_data = 12'b000000000000;
		12'b000100101011: color_data = 12'b000000000000;
		12'b000100101100: color_data = 12'b000000000000;
		12'b000100101101: color_data = 12'b000000000000;
		12'b000100101110: color_data = 12'b000000000000;
		12'b000100101111: color_data = 12'b000000000000;
		12'b000100110000: color_data = 12'b000000000000;
		12'b000100110001: color_data = 12'b000000000000;
		12'b000100110010: color_data = 12'b000000000000;
		12'b000100110011: color_data = 12'b000000000000;
		12'b000101000000: color_data = 12'b000000000000;
		12'b000101000001: color_data = 12'b000000000000;
		12'b000101000010: color_data = 12'b000000000000;
		12'b000101000011: color_data = 12'b000000000000;
		12'b000101000100: color_data = 12'b000000000000;
		12'b000101000101: color_data = 12'b000000000000;
		12'b000101000110: color_data = 12'b000000000000;
		12'b000101000111: color_data = 12'b000000000000;
		12'b000101001000: color_data = 12'b000000000000;
		12'b000101001001: color_data = 12'b000000000000;
		12'b000101001010: color_data = 12'b000000000000;
		12'b000101101001: color_data = 12'b000000000000;
		12'b000101101010: color_data = 12'b000000000000;
		12'b000101101011: color_data = 12'b000000000000;
		12'b000101101100: color_data = 12'b000000000000;
		12'b000101101101: color_data = 12'b000000000000;
		12'b000101101110: color_data = 12'b000000000000;
		12'b000101101111: color_data = 12'b000000000000;
		12'b000101110000: color_data = 12'b000000000000;
		12'b000101110001: color_data = 12'b000000000000;
		12'b000101110010: color_data = 12'b000000000000;
		12'b000101110011: color_data = 12'b000000000000;
		12'b000110000000: color_data = 12'b000000000000;
		12'b000110000001: color_data = 12'b000000000000;
		12'b000110000010: color_data = 12'b000000000000;
		12'b000110000011: color_data = 12'b000000000000;
		12'b000110000100: color_data = 12'b000000000000;
		12'b000110000101: color_data = 12'b000000000000;
		12'b000110000110: color_data = 12'b000000000000;
		12'b000110000111: color_data = 12'b000000000000;
		12'b000110001000: color_data = 12'b000000000000;
		12'b000110001001: color_data = 12'b000000000000;
		12'b000110101010: color_data = 12'b000000000000;
		12'b000110101011: color_data = 12'b000000000000;
		12'b000110101100: color_data = 12'b000000000000;
		12'b000110101101: color_data = 12'b000000000000;
		12'b000110101110: color_data = 12'b000000000000;
		12'b000110101111: color_data = 12'b000000000000;
		12'b000110110000: color_data = 12'b000000000000;
		12'b000110110001: color_data = 12'b000000000000;
		12'b000110110010: color_data = 12'b000000000000;
		12'b000110110011: color_data = 12'b000000000000;
		12'b000111000000: color_data = 12'b000000000000;
		12'b000111000001: color_data = 12'b000000000000;
		12'b000111000010: color_data = 12'b000000000000;
		12'b000111000011: color_data = 12'b000000000000;
		12'b000111000100: color_data = 12'b000000000000;
		12'b000111000101: color_data = 12'b000000000000;
		12'b000111000110: color_data = 12'b000000000000;
		12'b000111000111: color_data = 12'b000000000000;
		12'b000111001000: color_data = 12'b000000000000;
		12'b000111101011: color_data = 12'b000000000000;
		12'b000111101100: color_data = 12'b000000000000;
		12'b000111101101: color_data = 12'b000000000000;
		12'b000111101110: color_data = 12'b000000000000;
		12'b000111101111: color_data = 12'b000000000000;
		12'b000111110000: color_data = 12'b000000000000;
		12'b000111110001: color_data = 12'b000000000000;
		12'b000111110010: color_data = 12'b000000000000;
		12'b000111110011: color_data = 12'b000000000000;
		12'b001000000000: color_data = 12'b000000000000;
		12'b001000000001: color_data = 12'b000000000000;
		12'b001000000010: color_data = 12'b000000000000;
		12'b001000000011: color_data = 12'b000000000000;
		12'b001000000100: color_data = 12'b000000000000;
		12'b001000000101: color_data = 12'b000000000000;
		12'b001000000110: color_data = 12'b000000000000;
		12'b001000000111: color_data = 12'b000000000000;
		12'b001000101100: color_data = 12'b000000000000;
		12'b001000101101: color_data = 12'b000000000000;
		12'b001000101110: color_data = 12'b000000000000;
		12'b001000101111: color_data = 12'b000000000000;
		12'b001000110000: color_data = 12'b000000000000;
		12'b001000110001: color_data = 12'b000000000000;
		12'b001000110010: color_data = 12'b000000000000;
		12'b001000110011: color_data = 12'b000000000000;
		12'b001001000000: color_data = 12'b000000000000;
		12'b001001000001: color_data = 12'b000000000000;
		12'b001001000010: color_data = 12'b000000000000;
		12'b001001000011: color_data = 12'b000000000000;
		12'b001001000100: color_data = 12'b000000000000;
		12'b001001000101: color_data = 12'b000000000000;
		12'b001001000110: color_data = 12'b000000000000;
		12'b001001101101: color_data = 12'b000000000000;
		12'b001001101110: color_data = 12'b000000000000;
		12'b001001101111: color_data = 12'b000000000000;
		12'b001001110000: color_data = 12'b000000000000;
		12'b001001110001: color_data = 12'b000000000000;
		12'b001001110010: color_data = 12'b000000000000;
		12'b001001110011: color_data = 12'b000000000000;
		12'b001010000000: color_data = 12'b000000000000;
		12'b001010000001: color_data = 12'b000000000000;
		12'b001010000010: color_data = 12'b000000000000;
		12'b001010000011: color_data = 12'b000000000000;
		12'b001010000100: color_data = 12'b000000000000;
		12'b001010000101: color_data = 12'b000000000000;
		12'b001010101110: color_data = 12'b000000000000;
		12'b001010101111: color_data = 12'b000000000000;
		12'b001010110000: color_data = 12'b000000000000;
		12'b001010110001: color_data = 12'b000000000000;
		12'b001010110010: color_data = 12'b000000000000;
		12'b001010110011: color_data = 12'b000000000000;
		12'b001011000000: color_data = 12'b000000000000;
		12'b001011000001: color_data = 12'b000000000000;
		12'b001011000010: color_data = 12'b000000000000;
		12'b001011000011: color_data = 12'b000000000000;
		12'b001011000100: color_data = 12'b000000000000;
		12'b001011101111: color_data = 12'b000000000000;
		12'b001011110000: color_data = 12'b000000000000;
		12'b001011110001: color_data = 12'b000000000000;
		12'b001011110010: color_data = 12'b000000000000;
		12'b001011110011: color_data = 12'b000000000000;
		12'b001100000000: color_data = 12'b000000000000;
		12'b001100000001: color_data = 12'b000000000000;
		12'b001100000010: color_data = 12'b000000000000;
		12'b001100000011: color_data = 12'b000000000000;
		12'b001100110000: color_data = 12'b000000000000;
		12'b001100110001: color_data = 12'b000000000000;
		12'b001100110010: color_data = 12'b000000000000;
		12'b001100110011: color_data = 12'b000000000000;
		12'b001101000000: color_data = 12'b000000000000;
		12'b001101000001: color_data = 12'b000000000000;
		12'b001101000010: color_data = 12'b000000000000;
		12'b001101000011: color_data = 12'b000000000000;
		12'b001101110000: color_data = 12'b000000000000;
		12'b001101110001: color_data = 12'b000000000000;
		12'b001101110010: color_data = 12'b000000000000;
		12'b001101110011: color_data = 12'b000000000000;
		12'b001110000000: color_data = 12'b000000000000;
		12'b001110000001: color_data = 12'b000000000000;
		12'b001110000010: color_data = 12'b000000000000;
		12'b001110110001: color_data = 12'b000000000000;
		12'b001110110010: color_data = 12'b000000000000;
		12'b001110110011: color_data = 12'b000000000000;
		12'b001111000000: color_data = 12'b000000000000;
		12'b001111000001: color_data = 12'b000000000000;
		12'b001111000010: color_data = 12'b000000000000;
		12'b001111110001: color_data = 12'b000000000000;
		12'b001111110010: color_data = 12'b000000000000;
		12'b001111110011: color_data = 12'b000000000000;
		12'b010000000000: color_data = 12'b000000000000;
		12'b010000000001: color_data = 12'b000000000000;
		12'b010000110010: color_data = 12'b000000000000;
		12'b010000110011: color_data = 12'b000000000000;
		12'b010001000000: color_data = 12'b000000000000;
		12'b010001000001: color_data = 12'b000000000000;
		12'b010001110010: color_data = 12'b000000000000;
		12'b010001110011: color_data = 12'b000000000000;
		12'b010010000000: color_data = 12'b000000000000;
		12'b010010000001: color_data = 12'b000000000000;
		12'b010010110010: color_data = 12'b000000000000;
		12'b010010110011: color_data = 12'b000000000000;
		12'b010011000000: color_data = 12'b000000000000;
		12'b010011110011: color_data = 12'b000000000000;
		12'b010100000000: color_data = 12'b000000000000;
		12'b010100110011: color_data = 12'b000000000000;
		12'b010101000000: color_data = 12'b000000000000;
		12'b010101110011: color_data = 12'b000000000000;
		12'b010110000000: color_data = 12'b000000000000;
		12'b010110110011: color_data = 12'b000000000000;
		12'b010111000000: color_data = 12'b000000000000;
		12'b010111110011: color_data = 12'b000000000000;
		12'b011000000000: color_data = 12'b000000000000;
		12'b011000110011: color_data = 12'b000000000000;
		12'b011001000000: color_data = 12'b000000000000;
		12'b011001110011: color_data = 12'b000000000000;
		12'b011010000000: color_data = 12'b000000000000;
		12'b011010110011: color_data = 12'b000000000000;
		12'b011011000000: color_data = 12'b000000000000;
		12'b011011110011: color_data = 12'b000000000000;
		12'b011100000000: color_data = 12'b000000000000;
		12'b011100110011: color_data = 12'b000000000000;
		12'b011101000000: color_data = 12'b000000000000;
		12'b011101110011: color_data = 12'b000000000000;
		12'b011110000000: color_data = 12'b000000000000;
		12'b011110110011: color_data = 12'b000000000000;
		12'b011111000000: color_data = 12'b000000000000;
		12'b011111110011: color_data = 12'b000000000000;
		12'b100000000000: color_data = 12'b000000000000;
		12'b100000110011: color_data = 12'b000000000000;
		12'b100001000000: color_data = 12'b000000000000;
		12'b100001000001: color_data = 12'b000000000000;
		12'b100001110010: color_data = 12'b000000000000;
		12'b100001110011: color_data = 12'b000000000000;
		12'b100010000000: color_data = 12'b000000000000;
		12'b100010000001: color_data = 12'b000000000000;
		12'b100010110010: color_data = 12'b000000000000;
		12'b100010110011: color_data = 12'b000000000000;
		12'b100011000000: color_data = 12'b000000000000;
		12'b100011000001: color_data = 12'b000000000000;
		12'b100011110010: color_data = 12'b000000000000;
		12'b100011110011: color_data = 12'b000000000000;
		12'b100100000000: color_data = 12'b000000000000;
		12'b100100000001: color_data = 12'b000000000000;
		12'b100100000010: color_data = 12'b000000000000;
		12'b100100110001: color_data = 12'b000000000000;
		12'b100100110010: color_data = 12'b000000000000;
		12'b100100110011: color_data = 12'b000000000000;
		12'b100101000000: color_data = 12'b000000000000;
		12'b100101000001: color_data = 12'b000000000000;
		12'b100101000010: color_data = 12'b000000000000;
		12'b100101110001: color_data = 12'b000000000000;
		12'b100101110010: color_data = 12'b000000000000;
		12'b100101110011: color_data = 12'b000000000000;
		12'b100110000000: color_data = 12'b000000000000;
		12'b100110000001: color_data = 12'b000000000000;
		12'b100110000010: color_data = 12'b000000000000;
		12'b100110000011: color_data = 12'b000000000000;
		12'b100110110000: color_data = 12'b000000000000;
		12'b100110110001: color_data = 12'b000000000000;
		12'b100110110010: color_data = 12'b000000000000;
		12'b100110110011: color_data = 12'b000000000000;
		12'b100111000000: color_data = 12'b000000000000;
		12'b100111000001: color_data = 12'b000000000000;
		12'b100111000010: color_data = 12'b000000000000;
		12'b100111000011: color_data = 12'b000000000000;
		12'b100111110000: color_data = 12'b000000000000;
		12'b100111110001: color_data = 12'b000000000000;
		12'b100111110010: color_data = 12'b000000000000;
		12'b100111110011: color_data = 12'b000000000000;
		12'b101000000000: color_data = 12'b000000000000;
		12'b101000000001: color_data = 12'b000000000000;
		12'b101000000010: color_data = 12'b000000000000;
		12'b101000000011: color_data = 12'b000000000000;
		12'b101000000100: color_data = 12'b000000000000;
		12'b101000101111: color_data = 12'b000000000000;
		12'b101000110000: color_data = 12'b000000000000;
		12'b101000110001: color_data = 12'b000000000000;
		12'b101000110010: color_data = 12'b000000000000;
		12'b101000110011: color_data = 12'b000000000000;
		12'b101001000000: color_data = 12'b000000000000;
		12'b101001000001: color_data = 12'b000000000000;
		12'b101001000010: color_data = 12'b000000000000;
		12'b101001000011: color_data = 12'b000000000000;
		12'b101001000100: color_data = 12'b000000000000;
		12'b101001000101: color_data = 12'b000000000000;
		12'b101001101110: color_data = 12'b000000000000;
		12'b101001101111: color_data = 12'b000000000000;
		12'b101001110000: color_data = 12'b000000000000;
		12'b101001110001: color_data = 12'b000000000000;
		12'b101001110010: color_data = 12'b000000000000;
		12'b101001110011: color_data = 12'b000000000000;
		12'b101010000000: color_data = 12'b000000000000;
		12'b101010000001: color_data = 12'b000000000000;
		12'b101010000010: color_data = 12'b000000000000;
		12'b101010000011: color_data = 12'b000000000000;
		12'b101010000100: color_data = 12'b000000000000;
		12'b101010000101: color_data = 12'b000000000000;
		12'b101010000110: color_data = 12'b000000000000;
		12'b101010101101: color_data = 12'b000000000000;
		12'b101010101110: color_data = 12'b000000000000;
		12'b101010101111: color_data = 12'b000000000000;
		12'b101010110000: color_data = 12'b000000000000;
		12'b101010110001: color_data = 12'b000000000000;
		12'b101010110010: color_data = 12'b000000000000;
		12'b101010110011: color_data = 12'b000000000000;
		12'b101011000000: color_data = 12'b000000000000;
		12'b101011000001: color_data = 12'b000000000000;
		12'b101011000010: color_data = 12'b000000000000;
		12'b101011000011: color_data = 12'b000000000000;
		12'b101011000100: color_data = 12'b000000000000;
		12'b101011000101: color_data = 12'b000000000000;
		12'b101011000110: color_data = 12'b000000000000;
		12'b101011000111: color_data = 12'b000000000000;
		12'b101011101101: color_data = 12'b000000000000;
		12'b101011101110: color_data = 12'b000000000000;
		12'b101011101111: color_data = 12'b000000000000;
		12'b101011110000: color_data = 12'b000000000000;
		12'b101011110001: color_data = 12'b000000000000;
		12'b101011110010: color_data = 12'b000000000000;
		12'b101011110011: color_data = 12'b000000000000;
		12'b101100000000: color_data = 12'b000000000000;
		12'b101100000001: color_data = 12'b000000000000;
		12'b101100000010: color_data = 12'b000000000000;
		12'b101100000011: color_data = 12'b000000000000;
		12'b101100000100: color_data = 12'b000000000000;
		12'b101100000101: color_data = 12'b000000000000;
		12'b101100000110: color_data = 12'b000000000000;
		12'b101100000111: color_data = 12'b000000000000;
		12'b101100001000: color_data = 12'b000000000000;
		12'b101100101100: color_data = 12'b000000000000;
		12'b101100101101: color_data = 12'b000000000000;
		12'b101100101110: color_data = 12'b000000000000;
		12'b101100101111: color_data = 12'b000000000000;
		12'b101100110000: color_data = 12'b000000000000;
		12'b101100110001: color_data = 12'b000000000000;
		12'b101100110010: color_data = 12'b000000000000;
		12'b101100110011: color_data = 12'b000000000000;
		12'b101101000000: color_data = 12'b000000000000;
		12'b101101000001: color_data = 12'b000000000000;
		12'b101101000010: color_data = 12'b000000000000;
		12'b101101000011: color_data = 12'b000000000000;
		12'b101101000100: color_data = 12'b000000000000;
		12'b101101000101: color_data = 12'b000000000000;
		12'b101101000110: color_data = 12'b000000000000;
		12'b101101000111: color_data = 12'b000000000000;
		12'b101101001000: color_data = 12'b000000000000;
		12'b101101001001: color_data = 12'b000000000000;
		12'b101101101010: color_data = 12'b000000000000;
		12'b101101101011: color_data = 12'b000000000000;
		12'b101101101100: color_data = 12'b000000000000;
		12'b101101101101: color_data = 12'b000000000000;
		12'b101101101110: color_data = 12'b000000000000;
		12'b101101101111: color_data = 12'b000000000000;
		12'b101101110000: color_data = 12'b000000000000;
		12'b101101110001: color_data = 12'b000000000000;
		12'b101101110010: color_data = 12'b000000000000;
		12'b101101110011: color_data = 12'b000000000000;
		12'b101110000000: color_data = 12'b000000000000;
		12'b101110000001: color_data = 12'b000000000000;
		12'b101110000010: color_data = 12'b000000000000;
		12'b101110000011: color_data = 12'b000000000000;
		12'b101110000100: color_data = 12'b000000000000;
		12'b101110000101: color_data = 12'b000000000000;
		12'b101110000110: color_data = 12'b000000000000;
		12'b101110000111: color_data = 12'b000000000000;
		12'b101110001000: color_data = 12'b000000000000;
		12'b101110001001: color_data = 12'b000000000000;
		12'b101110001010: color_data = 12'b000000000000;
		12'b101110101001: color_data = 12'b000000000000;
		12'b101110101010: color_data = 12'b000000000000;
		12'b101110101011: color_data = 12'b000000000000;
		12'b101110101100: color_data = 12'b000000000000;
		12'b101110101101: color_data = 12'b000000000000;
		12'b101110101110: color_data = 12'b000000000000;
		12'b101110101111: color_data = 12'b000000000000;
		12'b101110110000: color_data = 12'b000000000000;
		12'b101110110001: color_data = 12'b000000000000;
		12'b101110110010: color_data = 12'b000000000000;
		12'b101110110011: color_data = 12'b000000000000;
		12'b101111000000: color_data = 12'b000000000000;
		12'b101111000001: color_data = 12'b000000000000;
		12'b101111000010: color_data = 12'b000000000000;
		12'b101111000011: color_data = 12'b000000000000;
		12'b101111000100: color_data = 12'b000000000000;
		12'b101111000101: color_data = 12'b000000000000;
		12'b101111000110: color_data = 12'b000000000000;
		12'b101111000111: color_data = 12'b000000000000;
		12'b101111001000: color_data = 12'b000000000000;
		12'b101111001001: color_data = 12'b000000000000;
		12'b101111001010: color_data = 12'b000000000000;
		12'b101111001011: color_data = 12'b000000000000;
		12'b101111101000: color_data = 12'b000000000000;
		12'b101111101001: color_data = 12'b000000000000;
		12'b101111101010: color_data = 12'b000000000000;
		12'b101111101011: color_data = 12'b000000000000;
		12'b101111101100: color_data = 12'b000000000000;
		12'b101111101101: color_data = 12'b000000000000;
		12'b101111101110: color_data = 12'b000000000000;
		12'b101111101111: color_data = 12'b000000000000;
		12'b101111110000: color_data = 12'b000000000000;
		12'b101111110001: color_data = 12'b000000000000;
		12'b101111110010: color_data = 12'b000000000000;
		12'b101111110011: color_data = 12'b000000000000;
		12'b110000000000: color_data = 12'b000000000000;
		12'b110000000001: color_data = 12'b000000000000;
		12'b110000000010: color_data = 12'b000000000000;
		12'b110000000011: color_data = 12'b000000000000;
		12'b110000000100: color_data = 12'b000000000000;
		12'b110000000101: color_data = 12'b000000000000;
		12'b110000000110: color_data = 12'b000000000000;
		12'b110000000111: color_data = 12'b000000000000;
		12'b110000001000: color_data = 12'b000000000000;
		12'b110000001001: color_data = 12'b000000000000;
		12'b110000001010: color_data = 12'b000000000000;
		12'b110000001011: color_data = 12'b000000000000;
		12'b110000001100: color_data = 12'b000000000000;
		12'b110000001101: color_data = 12'b000000000000;
		12'b110000100110: color_data = 12'b000000000000;
		12'b110000100111: color_data = 12'b000000000000;
		12'b110000101000: color_data = 12'b000000000000;
		12'b110000101001: color_data = 12'b000000000000;
		12'b110000101010: color_data = 12'b000000000000;
		12'b110000101011: color_data = 12'b000000000000;
		12'b110000101100: color_data = 12'b000000000000;
		12'b110000101101: color_data = 12'b000000000000;
		12'b110000101110: color_data = 12'b000000000000;
		12'b110000101111: color_data = 12'b000000000000;
		12'b110000110000: color_data = 12'b000000000000;
		12'b110000110001: color_data = 12'b000000000000;
		12'b110000110010: color_data = 12'b000000000000;
		12'b110000110011: color_data = 12'b000000000000;
		12'b110001000000: color_data = 12'b000000000000;
		12'b110001000001: color_data = 12'b000000000000;
		12'b110001000010: color_data = 12'b000000000000;
		12'b110001000011: color_data = 12'b000000000000;
		12'b110001000100: color_data = 12'b000000000000;
		12'b110001000101: color_data = 12'b000000000000;
		12'b110001000110: color_data = 12'b000000000000;
		12'b110001000111: color_data = 12'b000000000000;
		12'b110001001000: color_data = 12'b000000000000;
		12'b110001001001: color_data = 12'b000000000000;
		12'b110001001010: color_data = 12'b000000000000;
		12'b110001001011: color_data = 12'b000000000000;
		12'b110001001100: color_data = 12'b000000000000;
		12'b110001001101: color_data = 12'b000000000000;
		12'b110001001110: color_data = 12'b000000000000;
		12'b110001001111: color_data = 12'b000000000000;
		12'b110001100100: color_data = 12'b000000000000;
		12'b110001100101: color_data = 12'b000000000000;
		12'b110001100110: color_data = 12'b000000000000;
		12'b110001100111: color_data = 12'b000000000000;
		12'b110001101000: color_data = 12'b000000000000;
		12'b110001101001: color_data = 12'b000000000000;
		12'b110001101010: color_data = 12'b000000000000;
		12'b110001101011: color_data = 12'b000000000000;
		12'b110001101100: color_data = 12'b000000000000;
		12'b110001101101: color_data = 12'b000000000000;
		12'b110001101110: color_data = 12'b000000000000;
		12'b110001101111: color_data = 12'b000000000000;
		12'b110001110000: color_data = 12'b000000000000;
		12'b110001110001: color_data = 12'b000000000000;
		12'b110001110010: color_data = 12'b000000000000;
		12'b110001110011: color_data = 12'b000000000000;
		12'b110010000000: color_data = 12'b000000000000;
		12'b110010000001: color_data = 12'b000000000000;
		12'b110010000010: color_data = 12'b000000000000;
		12'b110010000011: color_data = 12'b000000000000;
		12'b110010000100: color_data = 12'b000000000000;
		12'b110010000101: color_data = 12'b000000000000;
		12'b110010000110: color_data = 12'b000000000000;
		12'b110010000111: color_data = 12'b000000000000;
		12'b110010001000: color_data = 12'b000000000000;
		12'b110010001001: color_data = 12'b000000000000;
		12'b110010001010: color_data = 12'b000000000000;
		12'b110010001011: color_data = 12'b000000000000;
		12'b110010001100: color_data = 12'b000000000000;
		12'b110010001101: color_data = 12'b000000000000;
		12'b110010001110: color_data = 12'b000000000000;
		12'b110010001111: color_data = 12'b000000000000;
		12'b110010010000: color_data = 12'b000000000000;
		12'b110010010001: color_data = 12'b000000000000;
		12'b110010010010: color_data = 12'b000000000000;
		12'b110010100001: color_data = 12'b000000000000;
		12'b110010100010: color_data = 12'b000000000000;
		12'b110010100011: color_data = 12'b000000000000;
		12'b110010100100: color_data = 12'b000000000000;
		12'b110010100101: color_data = 12'b000000000000;
		12'b110010100110: color_data = 12'b000000000000;
		12'b110010100111: color_data = 12'b000000000000;
		12'b110010101000: color_data = 12'b000000000000;
		12'b110010101001: color_data = 12'b000000000000;
		12'b110010101010: color_data = 12'b000000000000;
		12'b110010101011: color_data = 12'b000000000000;
		12'b110010101100: color_data = 12'b000000000000;
		12'b110010101101: color_data = 12'b000000000000;
		12'b110010101110: color_data = 12'b000000000000;
		12'b110010101111: color_data = 12'b000000000000;
		12'b110010110000: color_data = 12'b000000000000;
		12'b110010110001: color_data = 12'b000000000000;
		12'b110010110010: color_data = 12'b000000000000;
		12'b110010110011: color_data = 12'b000000000000;
		12'b110011000000: color_data = 12'b000000000000;
		12'b110011000001: color_data = 12'b000000000000;
		12'b110011000010: color_data = 12'b000000000000;
		12'b110011000011: color_data = 12'b000000000000;
		12'b110011000100: color_data = 12'b000000000000;
		12'b110011000101: color_data = 12'b000000000000;
		12'b110011000110: color_data = 12'b000000000000;
		12'b110011000111: color_data = 12'b000000000000;
		12'b110011001000: color_data = 12'b000000000000;
		12'b110011001001: color_data = 12'b000000000000;
		12'b110011001010: color_data = 12'b000000000000;
		12'b110011001011: color_data = 12'b000000000000;
		12'b110011001100: color_data = 12'b000000000000;
		12'b110011001101: color_data = 12'b000000000000;
		12'b110011001110: color_data = 12'b000000000000;
		12'b110011001111: color_data = 12'b000000000000;
		12'b110011010000: color_data = 12'b000000000000;
		12'b110011010001: color_data = 12'b000000000000;
		12'b110011010010: color_data = 12'b000000000000;
		12'b110011010011: color_data = 12'b000000000000;
		12'b110011010100: color_data = 12'b000000000000;
		12'b110011010101: color_data = 12'b000000000000;
		12'b110011010110: color_data = 12'b000000000000;
		12'b110011010111: color_data = 12'b000000000000;
		12'b110011011000: color_data = 12'b000000000000;
		12'b110011011001: color_data = 12'b000000000000;
		12'b110011011010: color_data = 12'b000000000000;
		12'b110011011011: color_data = 12'b000000000000;
		12'b110011011100: color_data = 12'b000000000000;
		12'b110011011101: color_data = 12'b000000000000;
		12'b110011011110: color_data = 12'b000000000000;
		12'b110011011111: color_data = 12'b000000000000;
		12'b110011100000: color_data = 12'b000000000000;
		12'b110011100001: color_data = 12'b000000000000;
		12'b110011100010: color_data = 12'b000000000000;
		12'b110011100011: color_data = 12'b000000000000;
		12'b110011100100: color_data = 12'b000000000000;
		12'b110011100101: color_data = 12'b000000000000;
		12'b110011100110: color_data = 12'b000000000000;
		12'b110011100111: color_data = 12'b000000000000;
		12'b110011101000: color_data = 12'b000000000000;
		12'b110011101001: color_data = 12'b000000000000;
		12'b110011101010: color_data = 12'b000000000000;
		12'b110011101011: color_data = 12'b000000000000;
		12'b110011101100: color_data = 12'b000000000000;
		12'b110011101101: color_data = 12'b000000000000;
		12'b110011101110: color_data = 12'b000000000000;
		12'b110011101111: color_data = 12'b000000000000;
		12'b110011110000: color_data = 12'b000000000000;
		12'b110011110001: color_data = 12'b000000000000;
		12'b110011110010: color_data = 12'b000000000000;
		12'b110011110011: color_data = 12'b000000000000;
        default: color_data = 12'b111111100011;
	endcase
endmodule