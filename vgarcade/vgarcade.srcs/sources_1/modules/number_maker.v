module number_maker(
    input clk,
    input [9:0] x, y,
    input [9:0] x_position, y_position,
    input [9:0] size_x,
    input [9:0] size_y,
    input [3:0] which_number,
    output number_on,
    output [11:0] rgb_data
);
// number size should be 35 pixels wide and 30 pixels tall or something

wire [9:0] row, col;

wire [11:0] number_color_data;
// boundaries
wire [9:0] left_bound;
wire [9:0] right_bound;
wire [9:0] up_bound;
wire [9:0] down_bound;

assign left_bound  = x_position;
assign right_bound = x_position + size_x;
assign up_bound    = y_position;
assign down_bound  = y_position + size_y;

assign col = x - left_bound;
assign row = y - up_bound;     

assign number_on = (x > left_bound) && (x <= right_bound) &&
                  (y >= up_bound)   && (y < down_bound)  &&
                  (rgb_data != 12'hFFF);

/******************************************************************************
* instantiating number roms
* selecting which number to display based on which number it is
******************************************************************************/
wire [11:0] rom_number_data [9:0];
// zero
zero_rom zero (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_number_data[0])
);
// one
one_rom one (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_number_data[1])
);
// two
two_rom two (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_number_data[2])
);
// three
three_rom three (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_number_data[3])
);
// four
four_rom four (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_number_data[4])
);
// five
five_rom five (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_number_data[5])
);
// six
six_rom six (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_number_data[6])
);
// seven
seven_rom seven (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_number_data[7])
);
// eight
eight_rom eight (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_number_data[8])
);
// nine
nine_rom nine (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_number_data[9])
);
//--------------selecting which rom to use based on number---------------------
reg [11:0] intermediate_rom_number_data;

always @(posedge clk) begin
    case (which_number)
        0 : intermediate_rom_number_data <= rom_number_data[0];
        1 : intermediate_rom_number_data <= rom_number_data[1];
        2 : intermediate_rom_number_data <= rom_number_data[2];
        3 : intermediate_rom_number_data <= rom_number_data[3];
        4 : intermediate_rom_number_data <= rom_number_data[4];
        5 : intermediate_rom_number_data <= rom_number_data[5];
        6 : intermediate_rom_number_data <= rom_number_data[6];
        7 : intermediate_rom_number_data <= rom_number_data[7];
        8 : intermediate_rom_number_data <= rom_number_data[8];
        9 : intermediate_rom_number_data <= rom_number_data[9];
        default: intermediate_rom_number_data <= rom_number_data[0];
    endcase
end

assign number_color_data = intermediate_rom_number_data;

// this is to get rgb bits in the right order
// they may originally be in little endian form or something
// it may be backwards like bgr in stead of rgb
assign rgb_data[11:8] = number_color_data[3:0];
assign rgb_data[7:4]  = number_color_data[7:4];
assign rgb_data[3:0]  = number_color_data[11:8];

endmodule