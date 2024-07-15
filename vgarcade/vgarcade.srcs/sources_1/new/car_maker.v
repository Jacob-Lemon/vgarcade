module car_maker(
    input clk,
    input [9:0] x, y,
    input [9:0] x_position, y_position,
    input [9:0] size_x,
    input [9:0] size_y,
    output car_on,
    output [11:0] rgb_data
);

wire [9:0] row, col;

wire [11:0] rom_car_data;
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

assign car_on = (x > left_bound) && (x < right_bound) &&
                   (y > up_bound)   && (y < down_bound) &&
                   (rgb_data != 12'hFFF);

// instantiate car rom to get color data
car_rom car (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_car_data)
);

// this is to get rgb bits in the right order
// they may originally be in little endian form or something
assign rgb_data[11:8] = rom_car_data[3:0];
assign rgb_data[7:4]  = rom_car_data[7:4];
assign rgb_data[3:0]  = rom_car_data[11:8];

endmodule