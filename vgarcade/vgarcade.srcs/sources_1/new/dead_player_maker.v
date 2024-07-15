module dead_player_maker (
    input clk,
    input [9:0] x, y,
    input [9:0] x_position, y_position,
    input [9:0] height,
    input [9:0] width,
    output dead_player_on,
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

assign dead_player_on = (x >/*=*/ left_bound) && (x < right_bound) &&
                   (y >/*=*/ up_bound)   && (y < down_bound) &&
                   (rgb_data != 12'hFFF);



//---------------------------dead player rom---------------------------------------------------
wire [11:0] rom_dead_player;
dead_player_rom dead_player_getter (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_dead_player)
);


wire [11:0] intermediate_rgb;
assign intermediate_rgb = rom_dead_player;

// this is to get rgb bits in the right order
// they may originally be in little endian form or something
assign rgb_data[11:8] = intermediate_rgb[3:0];
assign rgb_data[7:4]  = intermediate_rgb[7:4];
assign rgb_data[3:0]  = intermediate_rgb[11:8];

endmodule