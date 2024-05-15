`timescale 1ns / 1ps

module pixel_generation(
    input clk,                      // 100MHz from Basys 3
    input reset,                    // btnC
    input video_on,                 // from VGA controller
    input [9:0] x, y,               // from VGA controller
    output reg [11:0] rgb,          // to DAC, to VGA controller
    // gamecube input things
    input a,
    input b,
    input start_pause,
    input [3:0] joy_dir
);

parameter X_MAX = 639;              // right border of display area
parameter Y_MAX = 479;              // bottom border of display area
parameter SQ_RGB = 12'h0FF;         // red & green = yellow for square
parameter SQUARE_SIZE = 32;         // width of square sides in pixels
parameter SQUARE_VELOCITY_POS = 1;  // set position change value for positive direction
parameter SQUARE_VELOCITY_NEG = -1; // set position change value for negative direction  

// create a 60Hz refresh tick at the start of vsync 
wire refresh_tick;
assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0;

/******************************************************************************
* this is the bouncing sqare signals 
* and motion control
******************************************************************************/
// square boundaries and position
wire [9:0] sq_x_l, sq_x_r;              // square left and right boundary
wire [9:0] sq_y_t, sq_y_b;              // square top and bottom boundary

reg [9:0] sq_x_reg, sq_y_reg;           // regs to track left, top position
wire [9:0] sq_x_next, sq_y_next;        // buffer wires

reg [9:0] x_delta_reg, y_delta_reg;     // track square speed
reg [9:0] x_delta_next, y_delta_next;   // buffer regs    

// register control
always @(posedge clk or posedge reset)
    if(reset) begin
        sq_x_reg <= 0;
        sq_y_reg <= 0;
        x_delta_reg <= 10'h002;
        y_delta_reg <= 10'h002;
    end
    else begin
        sq_x_reg <= sq_x_next;
        sq_y_reg <= sq_y_next;
        x_delta_reg <= x_delta_next;
        y_delta_reg <= y_delta_next;
    end

// square boundaries
assign sq_x_l = sq_x_reg;                   // left boundary
assign sq_y_t = sq_y_reg;                   // top boundary
assign sq_x_r = sq_x_l + SQUARE_SIZE - 1;   // right boundary
assign sq_y_b = sq_y_t + SQUARE_SIZE - 1;   // bottom boundary

// square status signal
wire sq_on;
assign sq_on = (sq_x_l <= x) && (x <= sq_x_r) &&
               (sq_y_t <= y) && (y <= sq_y_b);


// new square position
assign sq_x_next = (refresh_tick) ? sq_x_reg + x_delta_reg : sq_x_reg;
assign sq_y_next = (refresh_tick) ? sq_y_reg + y_delta_reg : sq_y_reg;

// new square velocity 
always @* begin
    x_delta_next = x_delta_reg;
    y_delta_next = y_delta_reg;
    if(sq_y_t < 1)                              // collide with top display edge
        y_delta_next = SQUARE_VELOCITY_POS;     // change y direction(move down)
    else if(sq_y_b > Y_MAX)                     // collide with bottom display edge
        y_delta_next = SQUARE_VELOCITY_NEG;     // change y direction(move up)
    else if(sq_x_l < 1)                         // collide with left display edge
        x_delta_next = SQUARE_VELOCITY_POS;     // change x direction(move right)
    else if(sq_x_r > X_MAX)                     // collide with right display edge
        x_delta_next = SQUARE_VELOCITY_NEG;     // change x direction(move left)
end

/******************************************************************************
* this is where I am making a player character
* with motion!!! :)
******************************************************************************/
wire player1_on;
// position things
wire [11:0] player1_rgb_data;
wire [9:0] player1_x_wire;  //
wire [9:0] player1_y_wire;  // ok
reg  [9:0] player1_x_reg;   //
initial player1_x_reg = 380;
// reg  [9:0] player1_y_reg;   //

// assign player1_x_wire = 25;
assign player1_x_wire = player1_x_reg;
assign player1_y_wire = 300;


//// do motion
always @(posedge refresh_tick) begin
    // if left, move left
    if (a && player1_x_reg > 10) begin
    // if (joy_dir == 5 && player1_x_reg > 10) begin
    // if (player1_x_reg > 10) begin
        player1_x_reg <= player1_x_reg - 1;
    end
    else
    // if right, move right
    // if (joy_dir == 1 && player1_x_reg < 630) begin
    if (b && player1_x_reg < 630) begin
        player1_x_reg <= player1_x_reg + 1;
    end
end

player_maker player1 (
    .clk(clk),
    .x(x),
    .y(y),
    .x_position(player1_x_wire),
    .y_position(player1_y_wire),
    .size(9'd100), // from bitmap image, 100x100 pixels
    .player_on(player1_on),
    .rgb_data(player1_rgb_data)
);

/**************************************************************************
* this is where I am making a bunch of rectangles
**************************************************************************/

// my happy little block
wire block_on;
rectangle_boundary block_generator (
    .x(x),
    .y(y),
    .left(9'd10),
    .right(9'd20),
    .up(9'd10),
    .down(9'd20),
    .block_on(block_on)
);

/*************************************************************************
* trying to draw a heart
* 
*************************************************************************/
parameter HEART_SIZE = 25;
wire [9:0] heart1_x_location, heart1_y_location;
assign heart1_x_location = 100;
assign heart1_y_location = 200;
wire heart1_on;
wire [11:0] heart1_rgb_data;

heart_maker heart1(
    .clk(clk),
    .x(x),
    .y(y),
    .start_x(heart1_x_location),
    .start_y(heart1_y_location),
    .size(HEART_SIZE), // from bitmap image!!! know its size!!!!!
    .heart_on(heart1_on),
    .rgb_data(heart1_rgb_data)
);
/*
wire [9:0] heart2_x_location, heart2_y_location;
assign heart2_x_location = 200;
assign heart2_y_location = 300;
wire heart2_on;
wire [11:0] heart2_rgb_data;

heart_maker heart2(
    .clk(clk),
    .x(x),
    .y(y),
    .start_x(heart2_x_location),
    .start_y(heart2_y_location),
    .size(HEART_SIZE), // from bitmap image!!! know its size!!!!!
    .heart_on(heart2_on),
    .rgb_data(heart2_rgb_data)
);
*/

/******************************************************************************
* here is the background stuff
******************************************************************************/

wire [11:0] background_rgb;
wire [11:0] background_rom_data_endian;
background_rom background_getter (
    .clk(clk),
    .row(y),
    .col(x),
    .color_data(background_rom_data_endian)
);

assign background_rgb[11:8] = background_rom_data_endian[3:0];
assign background_rgb[7:4] = background_rom_data_endian[7:4];
assign background_rgb[3:0] = background_rom_data_endian[11:8];

/*
wire [12:0] background_rgb;
assign background_rgb = 12'hF00; // blue
*/
/******************************************************************************
* RGB control
* order of if-else cascade determines layering of visuals
******************************************************************************/
always @*
    if(~video_on)
        rgb = 12'h000;          // black(no value) outside display area
    else
        if (player1_on)
//            rgb = player1_rgb_data;
            if (&player1_rgb_data)
                rgb = 12'h0F0;
            else
                rgb = player1_rgb_data;
        else if(sq_on)
            rgb = SQ_RGB;       // yellow square
        else if(block_on)
            rgb = 12'hFFF;      // white block
        else if (heart1_on)
            if (&heart1_rgb_data) // if image is white &(1111_1111_1111)=1
                // rgb = 12'h000; // will be background color, is black for now
                rgb = background_rgb;
            else
                rgb = heart1_rgb_data;
                // rgb = 12'h00F;
//        else if (heart2_on)
//            if (&heart2_rgb_data)
//                rgb = background_rgb;
//            else
//                rgb = heart2_rgb_data;
        else
            rgb = background_rgb;

endmodule