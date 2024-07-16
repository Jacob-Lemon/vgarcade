module heart_maker(
    input clk,
    input [9:0] x, y,
    input [9:0] start_x, start_y,
    input [9:0] size,
    output heart_on,
    output [11:0] rgb_data
);

wire [4:0] row, col;
    
wire [11:0] rom_heart_data;
// boundaries
wire [9:0] left_heart;
wire [9:0] right_heart;
wire [9:0] up_heart;
wire [9:0] down_heart;

assign left_heart = start_x;
assign right_heart = start_x + size;
assign up_heart = start_y;
assign down_heart = start_y + size;

// get column of the image by comparing boundaries to the x,y coordinates
assign col = x - left_heart;
assign row = y - up_heart;     

// determine whether we need to be writing heart data
// based on whether we are in its rectangle and it is not white color
assign heart_on = (x >= left_heart) && (x < right_heart) &&
                  (y >= up_heart)   && (y < down_heart) &&
                  (rgb_data != 12'hFFF);

// instantiate heart rom
heart_rom heart1(
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_heart_data)
);

// this is to get rgb bits in the right order
// they may originally be in little endian form 
assign rgb_data[11:8] = rom_heart_data[3:0];
assign rgb_data[7:4] = rom_heart_data[7:4];
assign rgb_data[3:0] = rom_heart_data[11:8];

endmodule