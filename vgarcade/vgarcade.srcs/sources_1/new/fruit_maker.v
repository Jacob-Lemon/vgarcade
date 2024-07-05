module fruit_maker (
    input clk,
    input [9:0] x, y,
    input [9:0] x_position, y_position,
    input [9:0] size,
    input [7:0] which_fruit,
    output fruit_on,
    output [11:0] rgb_data
);
// fruit size should be 40


wire [9:0] row, col;

wire [11:0] rom_fruit_data;
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

assign fruit_on = (x > left_bound) && (x <= right_bound) &&
                  (y >= up_bound)   && (y < down_bound)  &&
                  (rgb_data != 12'hFFF);



/******************************************************************************
* instantiating fruit roms
* selecting which fruit to display based on which fruit it is
******************************************************************************/
//-----------------apple-----------------
wire [11:0] rom_apple_data;

apple_rom apple (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_apple_data)
);
//-----------------orange-----------------
wire [11:0] rom_orange_data;
orange_rom orange(
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_orange_data)
);
//-----------------pineapple----------------
wire [11:0] rom_pineapple_data;
pineapple_rom pineapple (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_pineapple_data)
);
//-----------------strawberry---------------
wire [11:0] rom_strawberry_data;
strawberry_rom strawberry (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_strawberry_data)
);
//-----------------speed-----------------
wire [11:0] rom_speed_data;
speed_rom speed (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_speed_data)
);
//-----------------shield-----------------
wire [11:0] rom_shield_data;
shield_rom shield (
    .clk(clk),
    .row(row),
    .col(col),
    .color_data(rom_shield_data)
);

//-----------------selecting the rom data-----------------
reg [11:0] intermediate_rom_fruit_data;

always @(posedge clk) begin
    if (which_fruit >= 0 && which_fruit < 40)           // apple
        intermediate_rom_fruit_data <= rom_apple_data;

    else if (which_fruit >= 40 && which_fruit < 70)     // orange
        intermediate_rom_fruit_data <= rom_orange_data;
    
    else if (which_fruit >= 70 && which_fruit < 90)     // pineapple
        intermediate_rom_fruit_data <= rom_pineapple_data;

    else if (which_fruit >= 90 && which_fruit < 97)     // strawberry
        intermediate_rom_fruit_data <= rom_strawberry_data;
    
    else if (which_fruit >= 97 && which_fruit < 99)     // speed
        intermediate_rom_fruit_data <= rom_speed_data;
    
    else if (which_fruit >= 99 && which_fruit <= 100)     // shield
        intermediate_rom_fruit_data <= rom_shield_data;
        
end

assign rom_fruit_data = intermediate_rom_fruit_data;

// this is to get rgb bits in the right order
// they may originally be in little endian form or something
// it may be backwards like bgr in stead of rgb
assign rgb_data[11:8] = rom_fruit_data[3:0];
assign rgb_data[7:4]  = rom_fruit_data[7:4];
assign rgb_data[3:0]  = rom_fruit_data[11:8];

endmodule