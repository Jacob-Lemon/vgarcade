`timescale 1ns / 1ps

module player_maker(
    input clk,
    input [9:0] x, y,
    input [9:0] x_position, y_position,
    input [9:0] size,
    output player_on,
    output [11:0] rgb_data
);

wire [9:0] row, col;

wire [11:0] rom_player_data;
// boundaries
wire [9:0] left_bound;
wire [9:0] right_bound;
wire [9:0] up_bound;
wire [9:0] down_bound;

assign left_bound  = x_position;
assign right_bound = x_position + size;
assign up_bound    = y_position;
assign down_bound  = y_position + size;

assign col = x - left_bound;
assign row = y - up_bound;     

assign player_on = (x >= left_bound) && (x < right_bound) &&
                   (y >= up_bound)   && (y < down_bound) &&
                   (rgb_data != 12'hFFF);


//////////
// instantiate player roms and mux to get the right one
// do it here
//////////
player_rom player1 (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_player_data)
);



// this is to get rgb bits in the right order
// they may originally be in little endian form or something
assign rgb_data[11:8] = rom_player_data[3:0];
assign rgb_data[7:4]  = rom_player_data[7:4];
assign rgb_data[3:0]  = rom_player_data[11:8];

endmodule