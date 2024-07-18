module pineapple_rom
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
		12'b000001010010: color_data = 12'b010001100010;
		12'b000001010011: color_data = 12'b010001100010;
		12'b000001010100: color_data = 12'b010001100010;
		12'b000001010101: color_data = 12'b010001100010;
		12'b000010010001: color_data = 12'b010001100010;
		12'b000010010010: color_data = 12'b011010110010;
		12'b000010010011: color_data = 12'b011010110010;
		12'b000010010100: color_data = 12'b011010110010;
		12'b000010010101: color_data = 12'b011010110010;
		12'b000010010110: color_data = 12'b010001100010;
		12'b000011010001: color_data = 12'b010001100010;
		12'b000011010010: color_data = 12'b011010110010;
		12'b000011010011: color_data = 12'b011010110010;
		12'b000011010100: color_data = 12'b011010110010;
		12'b000011010101: color_data = 12'b011010110010;
		12'b000011010110: color_data = 12'b010001100010;
		12'b000100001100: color_data = 12'b010001100010;
		12'b000100001101: color_data = 12'b010001100010;
		12'b000100010000: color_data = 12'b010001100010;
		12'b000100010001: color_data = 12'b010001100010;
		12'b000100010010: color_data = 12'b011010110010;
		12'b000100010011: color_data = 12'b011010110010;
		12'b000100010100: color_data = 12'b011010110010;
		12'b000100010101: color_data = 12'b011010110010;
		12'b000100010110: color_data = 12'b010001100010;
		12'b000100010111: color_data = 12'b010001100010;
		12'b000100011010: color_data = 12'b010001100010;
		12'b000100011011: color_data = 12'b010001100010;
		12'b000101001011: color_data = 12'b010001100010;
		12'b000101001100: color_data = 12'b011010110010;
		12'b000101001101: color_data = 12'b011010110010;
		12'b000101001110: color_data = 12'b010001100010;
		12'b000101010000: color_data = 12'b010001100010;
		12'b000101010001: color_data = 12'b011010110010;
		12'b000101010010: color_data = 12'b011010110010;
		12'b000101010011: color_data = 12'b011010110010;
		12'b000101010100: color_data = 12'b011010110010;
		12'b000101010101: color_data = 12'b011010110010;
		12'b000101010110: color_data = 12'b011010110010;
		12'b000101010111: color_data = 12'b010001100010;
		12'b000101011001: color_data = 12'b010001100010;
		12'b000101011010: color_data = 12'b011010110010;
		12'b000101011011: color_data = 12'b011010110010;
		12'b000101011100: color_data = 12'b010001100010;
		12'b000110001011: color_data = 12'b010001100010;
		12'b000110001100: color_data = 12'b011010110010;
		12'b000110001101: color_data = 12'b011010110010;
		12'b000110001110: color_data = 12'b011010110010;
		12'b000110001111: color_data = 12'b010001100010;
		12'b000110010000: color_data = 12'b010001100010;
		12'b000110010001: color_data = 12'b011010110010;
		12'b000110010010: color_data = 12'b011010110010;
		12'b000110010011: color_data = 12'b011010110010;
		12'b000110010100: color_data = 12'b011010110010;
		12'b000110010101: color_data = 12'b011010110010;
		12'b000110010110: color_data = 12'b011010110010;
		12'b000110010111: color_data = 12'b010001100010;
		12'b000110011000: color_data = 12'b010001100010;
		12'b000110011001: color_data = 12'b011010110010;
		12'b000110011010: color_data = 12'b011010110010;
		12'b000110011011: color_data = 12'b011010110010;
		12'b000110011100: color_data = 12'b010001100010;
		12'b000111001011: color_data = 12'b010001100010;
		12'b000111001100: color_data = 12'b011010110010;
		12'b000111001101: color_data = 12'b011010110010;
		12'b000111001110: color_data = 12'b011010110010;
		12'b000111001111: color_data = 12'b011010110010;
		12'b000111010000: color_data = 12'b010001100010;
		12'b000111010001: color_data = 12'b011010110010;
		12'b000111010010: color_data = 12'b011010110010;
		12'b000111010011: color_data = 12'b011010110010;
		12'b000111010100: color_data = 12'b011010110010;
		12'b000111010101: color_data = 12'b011010110010;
		12'b000111010110: color_data = 12'b011010110010;
		12'b000111010111: color_data = 12'b010001100010;
		12'b000111011000: color_data = 12'b011010110010;
		12'b000111011001: color_data = 12'b011010110010;
		12'b000111011010: color_data = 12'b011010110010;
		12'b000111011011: color_data = 12'b011010110010;
		12'b000111011100: color_data = 12'b010001100010;
		12'b001000001011: color_data = 12'b010001100010;
		12'b001000001100: color_data = 12'b011010110010;
		12'b001000001101: color_data = 12'b011010110010;
		12'b001000001110: color_data = 12'b011010110010;
		12'b001000001111: color_data = 12'b011010110010;
		12'b001000010000: color_data = 12'b010001100010;
		12'b001000010001: color_data = 12'b011010110010;
		12'b001000010010: color_data = 12'b011010110010;
		12'b001000010011: color_data = 12'b011010110010;
		12'b001000010100: color_data = 12'b011010110010;
		12'b001000010101: color_data = 12'b011010110010;
		12'b001000010110: color_data = 12'b011010110010;
		12'b001000010111: color_data = 12'b010001100010;
		12'b001000011000: color_data = 12'b011010110010;
		12'b001000011001: color_data = 12'b011010110010;
		12'b001000011010: color_data = 12'b011010110010;
		12'b001000011011: color_data = 12'b011010110010;
		12'b001000011100: color_data = 12'b010001100010;
		12'b001001001100: color_data = 12'b010001100010;
		12'b001001001101: color_data = 12'b011010110010;
		12'b001001001110: color_data = 12'b011010110010;
		12'b001001001111: color_data = 12'b011010110010;
		12'b001001010000: color_data = 12'b010001100010;
		12'b001001010001: color_data = 12'b011010110010;
		12'b001001010010: color_data = 12'b011010110010;
		12'b001001010011: color_data = 12'b011010110010;
		12'b001001010100: color_data = 12'b011010110010;
		12'b001001010101: color_data = 12'b011010110010;
		12'b001001010110: color_data = 12'b011010110010;
		12'b001001010111: color_data = 12'b010001100010;
		12'b001001011000: color_data = 12'b011010110010;
		12'b001001011001: color_data = 12'b011010110010;
		12'b001001011010: color_data = 12'b011010110010;
		12'b001001011011: color_data = 12'b010001100010;
		12'b001010001000: color_data = 12'b010001100010;
		12'b001010001001: color_data = 12'b010001100010;
		12'b001010001010: color_data = 12'b010001100010;
		12'b001010001100: color_data = 12'b010001100010;
		12'b001010001101: color_data = 12'b011010110010;
		12'b001010001110: color_data = 12'b011010110010;
		12'b001010001111: color_data = 12'b011010110010;
		12'b001010010000: color_data = 12'b010001100010;
		12'b001010010001: color_data = 12'b011010110010;
		12'b001010010010: color_data = 12'b011010110010;
		12'b001010010011: color_data = 12'b011010110010;
		12'b001010010100: color_data = 12'b011010110010;
		12'b001010010101: color_data = 12'b011010110010;
		12'b001010010110: color_data = 12'b011010110010;
		12'b001010010111: color_data = 12'b010001100010;
		12'b001010011000: color_data = 12'b011010110010;
		12'b001010011001: color_data = 12'b011010110010;
		12'b001010011010: color_data = 12'b011010110010;
		12'b001010011011: color_data = 12'b010001100010;
		12'b001010011101: color_data = 12'b010001100010;
		12'b001010011110: color_data = 12'b010001100010;
		12'b001010011111: color_data = 12'b010001100010;
		12'b001010100000: color_data = 12'b010001100010;
		12'b001011000111: color_data = 12'b010001100010;
		12'b001011001000: color_data = 12'b011010110010;
		12'b001011001001: color_data = 12'b011010110010;
		12'b001011001010: color_data = 12'b011010110010;
		12'b001011001011: color_data = 12'b010001100010;
		12'b001011001100: color_data = 12'b010001100010;
		12'b001011001101: color_data = 12'b011010110010;
		12'b001011001110: color_data = 12'b011010110010;
		12'b001011001111: color_data = 12'b011010110010;
		12'b001011010000: color_data = 12'b010001100010;
		12'b001011010001: color_data = 12'b010001100010;
		12'b001011010010: color_data = 12'b011010110010;
		12'b001011010011: color_data = 12'b011010110010;
		12'b001011010100: color_data = 12'b011010110010;
		12'b001011010101: color_data = 12'b011010110010;
		12'b001011010110: color_data = 12'b010001100010;
		12'b001011010111: color_data = 12'b010001100010;
		12'b001011011000: color_data = 12'b011010110010;
		12'b001011011001: color_data = 12'b011010110010;
		12'b001011011010: color_data = 12'b010001100010;
		12'b001011011011: color_data = 12'b010001100010;
		12'b001011011100: color_data = 12'b010001100010;
		12'b001011011101: color_data = 12'b011010110010;
		12'b001011011110: color_data = 12'b011010110010;
		12'b001011011111: color_data = 12'b011010110010;
		12'b001011100000: color_data = 12'b011010110010;
		12'b001011100001: color_data = 12'b010001100010;
		12'b001100000110: color_data = 12'b010001100010;
		12'b001100000111: color_data = 12'b011010110010;
		12'b001100001000: color_data = 12'b011010110010;
		12'b001100001001: color_data = 12'b011010110010;
		12'b001100001010: color_data = 12'b011010110010;
		12'b001100001011: color_data = 12'b011010110010;
		12'b001100001100: color_data = 12'b011010110010;
		12'b001100001101: color_data = 12'b010001100010;
		12'b001100001110: color_data = 12'b011010110010;
		12'b001100001111: color_data = 12'b011010110010;
		12'b001100010000: color_data = 12'b011010110010;
		12'b001100010001: color_data = 12'b010001100010;
		12'b001100010010: color_data = 12'b011010110010;
		12'b001100010011: color_data = 12'b011010110010;
		12'b001100010100: color_data = 12'b011010110010;
		12'b001100010101: color_data = 12'b011010110010;
		12'b001100010110: color_data = 12'b010001100010;
		12'b001100010111: color_data = 12'b011010110010;
		12'b001100011000: color_data = 12'b011010110010;
		12'b001100011001: color_data = 12'b010001100010;
		12'b001100011010: color_data = 12'b010001100010;
		12'b001100011011: color_data = 12'b011010110010;
		12'b001100011100: color_data = 12'b011010110010;
		12'b001100011101: color_data = 12'b011010110010;
		12'b001100011110: color_data = 12'b011010110010;
		12'b001100011111: color_data = 12'b011010110010;
		12'b001100100000: color_data = 12'b010001100010;
		12'b001101000110: color_data = 12'b010001100010;
		12'b001101000111: color_data = 12'b010001100010;
		12'b001101001000: color_data = 12'b010001100010;
		12'b001101001001: color_data = 12'b010001100010;
		12'b001101001010: color_data = 12'b010001100010;
		12'b001101001011: color_data = 12'b011010110010;
		12'b001101001100: color_data = 12'b011010110010;
		12'b001101001101: color_data = 12'b011010110010;
		12'b001101001110: color_data = 12'b010001100010;
		12'b001101001111: color_data = 12'b011010110010;
		12'b001101010000: color_data = 12'b011010110010;
		12'b001101010001: color_data = 12'b010001100010;
		12'b001101010010: color_data = 12'b010001100010;
		12'b001101010011: color_data = 12'b011010110010;
		12'b001101010100: color_data = 12'b011010110010;
		12'b001101010101: color_data = 12'b010001100010;
		12'b001101010110: color_data = 12'b011010110010;
		12'b001101010111: color_data = 12'b011010110010;
		12'b001101011000: color_data = 12'b010001100010;
		12'b001101011001: color_data = 12'b010001100010;
		12'b001101011010: color_data = 12'b011010110010;
		12'b001101011011: color_data = 12'b011010110010;
		12'b001101011100: color_data = 12'b011010110010;
		12'b001101011101: color_data = 12'b011010110010;
		12'b001101011110: color_data = 12'b010001100010;
		12'b001101011111: color_data = 12'b010001100010;
		12'b001110001010: color_data = 12'b010001100010;
		12'b001110001011: color_data = 12'b010001100010;
		12'b001110001100: color_data = 12'b010001100010;
		12'b001110001101: color_data = 12'b011010110010;
		12'b001110001110: color_data = 12'b011010110010;
		12'b001110001111: color_data = 12'b010001100010;
		12'b001110010000: color_data = 12'b011010110010;
		12'b001110010001: color_data = 12'b011010110010;
		12'b001110010010: color_data = 12'b010001100010;
		12'b001110010011: color_data = 12'b011010110010;
		12'b001110010100: color_data = 12'b011010110010;
		12'b001110010101: color_data = 12'b010001100010;
		12'b001110010110: color_data = 12'b011010110010;
		12'b001110010111: color_data = 12'b010001100010;
		12'b001110011000: color_data = 12'b100010110100;
		12'b001110011001: color_data = 12'b011010110010;
		12'b001110011010: color_data = 12'b011010110010;
		12'b001110011011: color_data = 12'b010001100010;
		12'b001110011100: color_data = 12'b010001100010;
		12'b001110011101: color_data = 12'b010001100010;
		12'b001111001100: color_data = 12'b010001100010;
		12'b001111001101: color_data = 12'b010001100010;
		12'b001111001110: color_data = 12'b011010110010;
		12'b001111001111: color_data = 12'b010001100010;
		12'b001111010000: color_data = 12'b011010110010;
		12'b001111010001: color_data = 12'b011010110010;
		12'b001111010010: color_data = 12'b010001100010;
		12'b001111010011: color_data = 12'b011010110010;
		12'b001111010100: color_data = 12'b011010110010;
		12'b001111010101: color_data = 12'b010001100010;
		12'b001111010110: color_data = 12'b010001100010;
		12'b001111010111: color_data = 12'b011010110010;
		12'b001111011000: color_data = 12'b011010110010;
		12'b001111011001: color_data = 12'b011010110010;
		12'b001111011010: color_data = 12'b010001100010;
		12'b001111011011: color_data = 12'b010001100010;
		12'b010000001110: color_data = 12'b100101100000;
		12'b010000001111: color_data = 12'b100101100000;
		12'b010000010000: color_data = 12'b100101100000;
		12'b010000010001: color_data = 12'b100101100000;
		12'b010000010010: color_data = 12'b100101100000;
		12'b010000010011: color_data = 12'b100101100000;
		12'b010000010100: color_data = 12'b100101100000;
		12'b010000010101: color_data = 12'b100101100000;
		12'b010000010110: color_data = 12'b100101100000;
		12'b010000010111: color_data = 12'b100101100000;
		12'b010000011000: color_data = 12'b100101100000;
		12'b010000011001: color_data = 12'b100101100000;
		12'b010001001101: color_data = 12'b100101100000;
		12'b010001001110: color_data = 12'b111111110011;
		12'b010001001111: color_data = 12'b111111110011;
		12'b010001010000: color_data = 12'b111111110011;
		12'b010001010001: color_data = 12'b111011000000;
		12'b010001010010: color_data = 12'b111011000000;
		12'b010001010011: color_data = 12'b100101100000;
		12'b010001010100: color_data = 12'b100101100000;
		12'b010001010101: color_data = 12'b111011000000;
		12'b010001010110: color_data = 12'b111011000000;
		12'b010001010111: color_data = 12'b111011000000;
		12'b010001011000: color_data = 12'b111011000000;
		12'b010001011001: color_data = 12'b100101100000;
		12'b010001011010: color_data = 12'b100101100000;
		12'b010010001100: color_data = 12'b100101100000;
		12'b010010001101: color_data = 12'b100101100000;
		12'b010010001110: color_data = 12'b100101100000;
		12'b010010001111: color_data = 12'b111111111100;
		12'b010010010000: color_data = 12'b111111110011;
		12'b010010010001: color_data = 12'b111111110011;
		12'b010010010010: color_data = 12'b111011000000;
		12'b010010010011: color_data = 12'b100101100000;
		12'b010010010100: color_data = 12'b100101100000;
		12'b010010010101: color_data = 12'b111011000000;
		12'b010010010110: color_data = 12'b111011000000;
		12'b010010010111: color_data = 12'b111011000000;
		12'b010010011000: color_data = 12'b111011000000;
		12'b010010011001: color_data = 12'b100101100000;
		12'b010010011010: color_data = 12'b100101100000;
		12'b010010011011: color_data = 12'b100101100000;
		12'b010011001011: color_data = 12'b100101100000;
		12'b010011001100: color_data = 12'b100101100000;
		12'b010011001101: color_data = 12'b111111111100;
		12'b010011001110: color_data = 12'b111111111100;
		12'b010011001111: color_data = 12'b100101100000;
		12'b010011010000: color_data = 12'b111111111100;
		12'b010011010001: color_data = 12'b111111110011;
		12'b010011010010: color_data = 12'b100101100000;
		12'b010011010011: color_data = 12'b111011000000;
		12'b010011010100: color_data = 12'b111011000000;
		12'b010011010101: color_data = 12'b100101100000;
		12'b010011010110: color_data = 12'b111011000000;
		12'b010011010111: color_data = 12'b111011000000;
		12'b010011011000: color_data = 12'b100101100000;
		12'b010011011001: color_data = 12'b111011000000;
		12'b010011011010: color_data = 12'b111011000000;
		12'b010011011011: color_data = 12'b100101100000;
		12'b010011011100: color_data = 12'b100101100000;
		12'b010100001010: color_data = 12'b100101100000;
		12'b010100001011: color_data = 12'b100101100000;
		12'b010100001100: color_data = 12'b111111111100;
		12'b010100001101: color_data = 12'b111111111100;
		12'b010100001110: color_data = 12'b111111111100;
		12'b010100001111: color_data = 12'b111111111100;
		12'b010100010000: color_data = 12'b100101100000;
		12'b010100010001: color_data = 12'b100101100000;
		12'b010100010010: color_data = 12'b111111110011;
		12'b010100010011: color_data = 12'b111111110011;
		12'b010100010100: color_data = 12'b111011000000;
		12'b010100010101: color_data = 12'b111011000000;
		12'b010100010110: color_data = 12'b100101100000;
		12'b010100010111: color_data = 12'b100101100000;
		12'b010100011000: color_data = 12'b111011000000;
		12'b010100011001: color_data = 12'b111011000000;
		12'b010100011010: color_data = 12'b111011000000;
		12'b010100011011: color_data = 12'b111011000000;
		12'b010100011100: color_data = 12'b100101100000;
		12'b010100011101: color_data = 12'b100101100000;
		12'b010101001010: color_data = 12'b100101100000;
		12'b010101001011: color_data = 12'b111111111100;
		12'b010101001100: color_data = 12'b111111111100;
		12'b010101001101: color_data = 12'b111111111100;
		12'b010101001110: color_data = 12'b111111111100;
		12'b010101001111: color_data = 12'b111111111100;
		12'b010101010000: color_data = 12'b100101100000;
		12'b010101010001: color_data = 12'b100101100000;
		12'b010101010010: color_data = 12'b111111110011;
		12'b010101010011: color_data = 12'b111111110011;
		12'b010101010100: color_data = 12'b111111110011;
		12'b010101010101: color_data = 12'b111011000000;
		12'b010101010110: color_data = 12'b100101100000;
		12'b010101010111: color_data = 12'b100101100000;
		12'b010101011000: color_data = 12'b111011000000;
		12'b010101011001: color_data = 12'b111011000000;
		12'b010101011010: color_data = 12'b111011000000;
		12'b010101011011: color_data = 12'b111011000000;
		12'b010101011100: color_data = 12'b111011000000;
		12'b010101011101: color_data = 12'b100101100000;
		12'b010110001001: color_data = 12'b100101100000;
		12'b010110001010: color_data = 12'b100101100000;
		12'b010110001011: color_data = 12'b111111111100;
		12'b010110001100: color_data = 12'b111111111100;
		12'b010110001101: color_data = 12'b111111111100;
		12'b010110001110: color_data = 12'b111111111100;
		12'b010110001111: color_data = 12'b100101100000;
		12'b010110010000: color_data = 12'b111111111100;
		12'b010110010001: color_data = 12'b111111110011;
		12'b010110010010: color_data = 12'b100101100000;
		12'b010110010011: color_data = 12'b111111110011;
		12'b010110010100: color_data = 12'b111111110011;
		12'b010110010101: color_data = 12'b100101100000;
		12'b010110010110: color_data = 12'b111011000000;
		12'b010110010111: color_data = 12'b111011000000;
		12'b010110011000: color_data = 12'b100101100000;
		12'b010110011001: color_data = 12'b111011000000;
		12'b010110011010: color_data = 12'b111011000000;
		12'b010110011011: color_data = 12'b111011000000;
		12'b010110011100: color_data = 12'b111011000000;
		12'b010110011101: color_data = 12'b100101100000;
		12'b010110011110: color_data = 12'b100101100000;
		12'b010111001001: color_data = 12'b100101100000;
		12'b010111001010: color_data = 12'b111111111100;
		12'b010111001011: color_data = 12'b100101100000;
		12'b010111001100: color_data = 12'b111111111100;
		12'b010111001101: color_data = 12'b111111111100;
		12'b010111001110: color_data = 12'b100101100000;
		12'b010111001111: color_data = 12'b111111111100;
		12'b010111010000: color_data = 12'b111111110011;
		12'b010111010001: color_data = 12'b111111110011;
		12'b010111010010: color_data = 12'b111111110011;
		12'b010111010011: color_data = 12'b100101100000;
		12'b010111010100: color_data = 12'b100101100000;
		12'b010111010101: color_data = 12'b111111110011;
		12'b010111010110: color_data = 12'b111011000000;
		12'b010111010111: color_data = 12'b111011000000;
		12'b010111011000: color_data = 12'b111011000000;
		12'b010111011001: color_data = 12'b100101100000;
		12'b010111011010: color_data = 12'b111011000000;
		12'b010111011011: color_data = 12'b111011000000;
		12'b010111011100: color_data = 12'b100101100000;
		12'b010111011101: color_data = 12'b111011000000;
		12'b010111011110: color_data = 12'b100101100000;
		12'b011000001001: color_data = 12'b100101100000;
		12'b011000001010: color_data = 12'b111111110011;
		12'b011000001011: color_data = 12'b111111111100;
		12'b011000001100: color_data = 12'b100101100000;
		12'b011000001101: color_data = 12'b100101100000;
		12'b011000001110: color_data = 12'b111111110011;
		12'b011000001111: color_data = 12'b111111110011;
		12'b011000010000: color_data = 12'b111111110011;
		12'b011000010001: color_data = 12'b111111110011;
		12'b011000010010: color_data = 12'b111111110011;
		12'b011000010011: color_data = 12'b100101100000;
		12'b011000010100: color_data = 12'b100101100000;
		12'b011000010101: color_data = 12'b111111110011;
		12'b011000010110: color_data = 12'b111111110011;
		12'b011000010111: color_data = 12'b111011000000;
		12'b011000011000: color_data = 12'b111011000000;
		12'b011000011001: color_data = 12'b111011000000;
		12'b011000011010: color_data = 12'b100101100000;
		12'b011000011011: color_data = 12'b100101100000;
		12'b011000011100: color_data = 12'b111011000000;
		12'b011000011101: color_data = 12'b111011000000;
		12'b011000011110: color_data = 12'b100101100000;
		12'b011001001001: color_data = 12'b100101100000;
		12'b011001001010: color_data = 12'b111111110011;
		12'b011001001011: color_data = 12'b111111110011;
		12'b011001001100: color_data = 12'b100101100000;
		12'b011001001101: color_data = 12'b100101100000;
		12'b011001001110: color_data = 12'b111111110011;
		12'b011001001111: color_data = 12'b111111110011;
		12'b011001010000: color_data = 12'b111111110011;
		12'b011001010001: color_data = 12'b100101100000;
		12'b011001010010: color_data = 12'b100101100000;
		12'b011001010011: color_data = 12'b111111110011;
		12'b011001010100: color_data = 12'b111111110011;
		12'b011001010101: color_data = 12'b100101100000;
		12'b011001010110: color_data = 12'b100101100000;
		12'b011001010111: color_data = 12'b111011000000;
		12'b011001011000: color_data = 12'b111011000000;
		12'b011001011001: color_data = 12'b111011000000;
		12'b011001011010: color_data = 12'b100101100000;
		12'b011001011011: color_data = 12'b100101100000;
		12'b011001011100: color_data = 12'b111011000000;
		12'b011001011101: color_data = 12'b111011000000;
		12'b011001011110: color_data = 12'b100101100000;
		12'b011010001001: color_data = 12'b100101100000;
		12'b011010001010: color_data = 12'b111111110011;
		12'b011010001011: color_data = 12'b100101100000;
		12'b011010001100: color_data = 12'b111111110011;
		12'b011010001101: color_data = 12'b111111110011;
		12'b011010001110: color_data = 12'b100101100000;
		12'b011010001111: color_data = 12'b111111110011;
		12'b011010010000: color_data = 12'b100101100000;
		12'b011010010001: color_data = 12'b111111110011;
		12'b011010010010: color_data = 12'b111111110011;
		12'b011010010011: color_data = 12'b111111110011;
		12'b011010010100: color_data = 12'b111111110011;
		12'b011010010101: color_data = 12'b111111110011;
		12'b011010010110: color_data = 12'b111111110011;
		12'b011010010111: color_data = 12'b100101100000;
		12'b011010011000: color_data = 12'b111011000000;
		12'b011010011001: color_data = 12'b100101100000;
		12'b011010011010: color_data = 12'b111011000000;
		12'b011010011011: color_data = 12'b111011000000;
		12'b011010011100: color_data = 12'b100101100000;
		12'b011010011101: color_data = 12'b111011000000;
		12'b011010011110: color_data = 12'b100101100000;
		12'b011011001001: color_data = 12'b100101100000;
		12'b011011001010: color_data = 12'b100101100000;
		12'b011011001011: color_data = 12'b111111110011;
		12'b011011001100: color_data = 12'b111111110011;
		12'b011011001101: color_data = 12'b111111110011;
		12'b011011001110: color_data = 12'b111111110011;
		12'b011011001111: color_data = 12'b100101100000;
		12'b011011010000: color_data = 12'b111111110011;
		12'b011011010001: color_data = 12'b111111110011;
		12'b011011010010: color_data = 12'b111111110011;
		12'b011011010011: color_data = 12'b111111110011;
		12'b011011010100: color_data = 12'b111111110011;
		12'b011011010101: color_data = 12'b111111110011;
		12'b011011010110: color_data = 12'b111011000000;
		12'b011011010111: color_data = 12'b111011000000;
		12'b011011011000: color_data = 12'b100101100000;
		12'b011011011001: color_data = 12'b111011000000;
		12'b011011011010: color_data = 12'b111011000000;
		12'b011011011011: color_data = 12'b111011000000;
		12'b011011011100: color_data = 12'b111011000000;
		12'b011011011101: color_data = 12'b100101100000;
		12'b011011011110: color_data = 12'b100101100000;
		12'b011100001001: color_data = 12'b100101100000;
		12'b011100001010: color_data = 12'b111111110011;
		12'b011100001011: color_data = 12'b111111110011;
		12'b011100001100: color_data = 12'b111111110011;
		12'b011100001101: color_data = 12'b111111110011;
		12'b011100001110: color_data = 12'b111111110011;
		12'b011100001111: color_data = 12'b100101100000;
		12'b011100010000: color_data = 12'b111111110011;
		12'b011100010001: color_data = 12'b111111110011;
		12'b011100010010: color_data = 12'b111111110011;
		12'b011100010011: color_data = 12'b111111110011;
		12'b011100010100: color_data = 12'b111111110011;
		12'b011100010101: color_data = 12'b111111110011;
		12'b011100010110: color_data = 12'b111011000000;
		12'b011100010111: color_data = 12'b111011000000;
		12'b011100011000: color_data = 12'b100101100000;
		12'b011100011001: color_data = 12'b111011000000;
		12'b011100011010: color_data = 12'b111011000000;
		12'b011100011011: color_data = 12'b111011000000;
		12'b011100011100: color_data = 12'b111011000000;
		12'b011100011101: color_data = 12'b111011000000;
		12'b011100011110: color_data = 12'b100101100000;
		12'b011101001001: color_data = 12'b100101100000;
		12'b011101001010: color_data = 12'b111111110011;
		12'b011101001011: color_data = 12'b111111110011;
		12'b011101001100: color_data = 12'b111111110011;
		12'b011101001101: color_data = 12'b111111110011;
		12'b011101001110: color_data = 12'b100101100000;
		12'b011101001111: color_data = 12'b111111110011;
		12'b011101010000: color_data = 12'b100101100000;
		12'b011101010001: color_data = 12'b111111110011;
		12'b011101010010: color_data = 12'b111111110011;
		12'b011101010011: color_data = 12'b111111110011;
		12'b011101010100: color_data = 12'b111111110011;
		12'b011101010101: color_data = 12'b111011000000;
		12'b011101010110: color_data = 12'b111011000000;
		12'b011101010111: color_data = 12'b100101100000;
		12'b011101011000: color_data = 12'b111011000000;
		12'b011101011001: color_data = 12'b100101100000;
		12'b011101011010: color_data = 12'b111011000000;
		12'b011101011011: color_data = 12'b111011000000;
		12'b011101011100: color_data = 12'b111011000000;
		12'b011101011101: color_data = 12'b111011000000;
		12'b011101011110: color_data = 12'b100101100000;
		12'b011110001001: color_data = 12'b100101100000;
		12'b011110001010: color_data = 12'b100101100000;
		12'b011110001011: color_data = 12'b111111110011;
		12'b011110001100: color_data = 12'b111111110011;
		12'b011110001101: color_data = 12'b100101100000;
		12'b011110001110: color_data = 12'b111111110011;
		12'b011110001111: color_data = 12'b111111110011;
		12'b011110010000: color_data = 12'b111111110011;
		12'b011110010001: color_data = 12'b100101100000;
		12'b011110010010: color_data = 12'b100101100000;
		12'b011110010011: color_data = 12'b111111110011;
		12'b011110010100: color_data = 12'b111011000000;
		12'b011110010101: color_data = 12'b100101100000;
		12'b011110010110: color_data = 12'b100101100000;
		12'b011110010111: color_data = 12'b111011000000;
		12'b011110011000: color_data = 12'b111011000000;
		12'b011110011001: color_data = 12'b111011000000;
		12'b011110011010: color_data = 12'b100101100000;
		12'b011110011011: color_data = 12'b111011000000;
		12'b011110011100: color_data = 12'b111011000000;
		12'b011110011101: color_data = 12'b100101100000;
		12'b011110011110: color_data = 12'b100101100000;
		12'b011111001001: color_data = 12'b100101100000;
		12'b011111001010: color_data = 12'b111111110011;
		12'b011111001011: color_data = 12'b100101100000;
		12'b011111001100: color_data = 12'b100101100000;
		12'b011111001101: color_data = 12'b111111110011;
		12'b011111001110: color_data = 12'b111111110011;
		12'b011111001111: color_data = 12'b111111110011;
		12'b011111010000: color_data = 12'b111111110011;
		12'b011111010001: color_data = 12'b111111110011;
		12'b011111010010: color_data = 12'b111111110011;
		12'b011111010011: color_data = 12'b100101100000;
		12'b011111010100: color_data = 12'b100101100000;
		12'b011111010101: color_data = 12'b111011000000;
		12'b011111010110: color_data = 12'b111011000000;
		12'b011111010111: color_data = 12'b111011000000;
		12'b011111011000: color_data = 12'b111011000000;
		12'b011111011001: color_data = 12'b111011000000;
		12'b011111011010: color_data = 12'b111011000000;
		12'b011111011011: color_data = 12'b100101100000;
		12'b011111011100: color_data = 12'b100101100000;
		12'b011111011101: color_data = 12'b111011000000;
		12'b011111011110: color_data = 12'b100101100000;
		12'b100000001001: color_data = 12'b100101100000;
		12'b100000001010: color_data = 12'b111111110011;
		12'b100000001011: color_data = 12'b100101100000;
		12'b100000001100: color_data = 12'b100101100000;
		12'b100000001101: color_data = 12'b111111110011;
		12'b100000001110: color_data = 12'b111111110011;
		12'b100000001111: color_data = 12'b111111110011;
		12'b100000010000: color_data = 12'b111111110011;
		12'b100000010001: color_data = 12'b111111110011;
		12'b100000010010: color_data = 12'b111111110011;
		12'b100000010011: color_data = 12'b100101100000;
		12'b100000010100: color_data = 12'b100101100000;
		12'b100000010101: color_data = 12'b111011000000;
		12'b100000010110: color_data = 12'b111011000000;
		12'b100000010111: color_data = 12'b111011000000;
		12'b100000011000: color_data = 12'b111011000000;
		12'b100000011001: color_data = 12'b111011000000;
		12'b100000011010: color_data = 12'b111011000000;
		12'b100000011011: color_data = 12'b100101100000;
		12'b100000011100: color_data = 12'b100101100000;
		12'b100000011101: color_data = 12'b111011000000;
		12'b100000011110: color_data = 12'b100101100000;
		12'b100001001001: color_data = 12'b100101100000;
		12'b100001001010: color_data = 12'b100101100000;
		12'b100001001011: color_data = 12'b111111110011;
		12'b100001001100: color_data = 12'b111111110011;
		12'b100001001101: color_data = 12'b100101100000;
		12'b100001001110: color_data = 12'b111111110011;
		12'b100001001111: color_data = 12'b111111110011;
		12'b100001010000: color_data = 12'b111111110011;
		12'b100001010001: color_data = 12'b111111110011;
		12'b100001010010: color_data = 12'b111011000000;
		12'b100001010011: color_data = 12'b100101100000;
		12'b100001010100: color_data = 12'b100101100000;
		12'b100001010101: color_data = 12'b111011000000;
		12'b100001010110: color_data = 12'b111011000000;
		12'b100001010111: color_data = 12'b111011000000;
		12'b100001011000: color_data = 12'b111011000000;
		12'b100001011001: color_data = 12'b111011000000;
		12'b100001011010: color_data = 12'b100101100000;
		12'b100001011011: color_data = 12'b111011000000;
		12'b100001011100: color_data = 12'b111011000000;
		12'b100001011101: color_data = 12'b100101100000;
		12'b100001011110: color_data = 12'b100101100000;
		12'b100010001001: color_data = 12'b100101100000;
		12'b100010001010: color_data = 12'b111011000000;
		12'b100010001011: color_data = 12'b111011000000;
		12'b100010001100: color_data = 12'b111111110011;
		12'b100010001101: color_data = 12'b111111110011;
		12'b100010001110: color_data = 12'b100101100000;
		12'b100010001111: color_data = 12'b111111110011;
		12'b100010010000: color_data = 12'b111111110011;
		12'b100010010001: color_data = 12'b100101100000;
		12'b100010010010: color_data = 12'b100101100000;
		12'b100010010011: color_data = 12'b111011000000;
		12'b100010010100: color_data = 12'b111011000000;
		12'b100010010101: color_data = 12'b100101100000;
		12'b100010010110: color_data = 12'b100101100000;
		12'b100010010111: color_data = 12'b111011000000;
		12'b100010011000: color_data = 12'b111011000000;
		12'b100010011001: color_data = 12'b100101100000;
		12'b100010011010: color_data = 12'b111011000000;
		12'b100010011011: color_data = 12'b111011000000;
		12'b100010011100: color_data = 12'b111011000000;
		12'b100010011101: color_data = 12'b111011000000;
		12'b100010011110: color_data = 12'b100101100000;
		12'b100011001001: color_data = 12'b100101100000;
		12'b100011001010: color_data = 12'b100101100000;
		12'b100011001011: color_data = 12'b111011000000;
		12'b100011001100: color_data = 12'b111011000000;
		12'b100011001101: color_data = 12'b111111110011;
		12'b100011001110: color_data = 12'b111111110011;
		12'b100011001111: color_data = 12'b100101100000;
		12'b100011010000: color_data = 12'b100101100000;
		12'b100011010001: color_data = 12'b111011000000;
		12'b100011010010: color_data = 12'b111011000000;
		12'b100011010011: color_data = 12'b111011000000;
		12'b100011010100: color_data = 12'b111011000000;
		12'b100011010101: color_data = 12'b111011000000;
		12'b100011010110: color_data = 12'b111011000000;
		12'b100011010111: color_data = 12'b100101100000;
		12'b100011011000: color_data = 12'b100101100000;
		12'b100011011001: color_data = 12'b111011000000;
		12'b100011011010: color_data = 12'b111011000000;
		12'b100011011011: color_data = 12'b111011000000;
		12'b100011011100: color_data = 12'b111011000000;
		12'b100011011101: color_data = 12'b100101100000;
		12'b100011011110: color_data = 12'b100101100000;
		12'b100100001010: color_data = 12'b100101100000;
		12'b100100001011: color_data = 12'b111011000000;
		12'b100100001100: color_data = 12'b111011000000;
		12'b100100001101: color_data = 12'b111011000000;
		12'b100100001110: color_data = 12'b111011000000;
		12'b100100001111: color_data = 12'b100101100000;
		12'b100100010000: color_data = 12'b100101100000;
		12'b100100010001: color_data = 12'b111011000000;
		12'b100100010010: color_data = 12'b111011000000;
		12'b100100010011: color_data = 12'b111011000000;
		12'b100100010100: color_data = 12'b111011000000;
		12'b100100010101: color_data = 12'b111011000000;
		12'b100100010110: color_data = 12'b111011000000;
		12'b100100010111: color_data = 12'b100101100000;
		12'b100100011000: color_data = 12'b100101100000;
		12'b100100011001: color_data = 12'b111011000000;
		12'b100100011010: color_data = 12'b111011000000;
		12'b100100011011: color_data = 12'b111011000000;
		12'b100100011100: color_data = 12'b111011000000;
		12'b100100011101: color_data = 12'b100101100000;
		12'b100101001010: color_data = 12'b100101100000;
		12'b100101001011: color_data = 12'b100101100000;
		12'b100101001100: color_data = 12'b111011000000;
		12'b100101001101: color_data = 12'b111011000000;
		12'b100101001110: color_data = 12'b100101100000;
		12'b100101001111: color_data = 12'b111011000000;
		12'b100101010000: color_data = 12'b111011000000;
		12'b100101010001: color_data = 12'b100101100000;
		12'b100101010010: color_data = 12'b111011000000;
		12'b100101010011: color_data = 12'b111011000000;
		12'b100101010100: color_data = 12'b111011000000;
		12'b100101010101: color_data = 12'b111011000000;
		12'b100101010110: color_data = 12'b100101100000;
		12'b100101010111: color_data = 12'b111011000000;
		12'b100101011000: color_data = 12'b111011000000;
		12'b100101011001: color_data = 12'b100101100000;
		12'b100101011010: color_data = 12'b111011000000;
		12'b100101011011: color_data = 12'b111011000000;
		12'b100101011100: color_data = 12'b100101100000;
		12'b100101011101: color_data = 12'b100101100000;
		12'b100110001011: color_data = 12'b100101100000;
		12'b100110001100: color_data = 12'b100101100000;
		12'b100110001101: color_data = 12'b100101100000;
		12'b100110001110: color_data = 12'b100101100000;
		12'b100110001111: color_data = 12'b100101100000;
		12'b100110010000: color_data = 12'b100101100000;
		12'b100110010001: color_data = 12'b100101100000;
		12'b100110010010: color_data = 12'b100101100000;
		12'b100110010011: color_data = 12'b100101100000;
		12'b100110010100: color_data = 12'b100101100000;
		12'b100110010101: color_data = 12'b100101100000;
		12'b100110010110: color_data = 12'b100101100000;
		12'b100110010111: color_data = 12'b100101100000;
		12'b100110011000: color_data = 12'b100101100000;
		12'b100110011001: color_data = 12'b100101100000;
		12'b100110011010: color_data = 12'b100101100000;
		12'b100110011011: color_data = 12'b100101100000;
		12'b100110011100: color_data = 12'b100101100000;
        default: color_data = 12'b111111111111;
	endcase
endmodule