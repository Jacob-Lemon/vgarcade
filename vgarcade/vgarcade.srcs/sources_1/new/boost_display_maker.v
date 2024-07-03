`timescale 1ns / 1ps

module boost_display_maker (
    input clk,
    input [9:0] x, y,
    input [9:0] x_position, y_position,
    input [9:0] height,
    input [9:0] width,
    input speed_boost_available,
    output boost_display_on,
    output [11:0] rgb_data
);

wire [9:0] row, col;

// boundaries
wire [9:0] left_bound;
wire [9:0] right_bound;
wire [9:0] up_bound;
wire [9:0] down_bound;

assign left_bound  = x_position;
assign right_bound = x_position + width;
assign up_bound    = y_position;
assign down_bound  = y_position + height;

assign col = x - left_bound;
assign row = y - up_bound;     

assign boost_display_on = (x >/*=*/ left_bound) && (x < right_bound) &&
                   (y >/*=*/ up_bound)   && (y < down_bound) &&
                   (rgb_data != 12'hFFF);




/**************************************************************************************************
* instantiate boost display roms and mux to get the right one
* get the rest of rom data
**************************************************************************************************/
//------------------------active-------------------------------------------------------------------
wire [11:0] rom_boost_display_active_data;
boost_display_active_rom active (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_boost_display_active_data)
);
//------------------------inactive-----------------------------------------------------------------
wire [11:0] rom_boost_display_inactive_data;
boost_display_inactive_rom inactive (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_boost_display_inactive_data)
);


wire [11:0] intermediate_rgb;
assign intermediate_rgb = speed_boost_available ? (rom_boost_display_active_data) : (rom_boost_display_inactive_data);

// this is to get rgb bits in the right order
// they may originally be in little endian form or something
assign rgb_data[11:8] = intermediate_rgb[3:0];
assign rgb_data[7:4]  = intermediate_rgb[7:4];
assign rgb_data[3:0]  = intermediate_rgb[11:8];

endmodule