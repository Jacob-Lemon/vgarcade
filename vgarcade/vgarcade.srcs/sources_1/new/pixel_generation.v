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
    input [3:0] joy_dir,
    // switches for test purposes
    input [15:0] sw
);

// create a 60Hz refresh tick at the start of vsync 
wire refresh_tick;
assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0;


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
    if ((a || sw[15]) && player1_x_reg > 10) begin
    // if ((sw[15]) && player1_x_reg > 10) begin
        player1_x_reg <= player1_x_reg - 1;
    end
    else
    // if right, move right
    if ((b || sw[14]) && player1_x_reg < 530) begin
    // if ((sw[14]) && player1_x_reg < 530) begin
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

/******************************************************************************
* drawing and handling fruits
* 
******************************************************************************/

parameter FRUIT_SIZE = 40;
wire [9:0] fruit_x_location, fruit_y_location;

assign fruit_x_location = 400;
assign fruit_y_location = 400;

wire [3:0] fruit_on;
wire [11:0] fruit_rgb_data;

fruit_maker (
    .clk(clk),
    .x(x),
    .y(y),
    .x_position(fruit_x_location),
    .y_position(fruit_y_location),
    .size(FRUIT_SIZE),
    .fruit_on(fruit_on),
    .rgb_data(fruit_rgb_data)
);


/******************************************************************************
* trying to draw a heart
* doing lives by a generate block
******************************************************************************/
// data I need
parameter MAX_LIVES = 3;
parameter HEART_SIZE = 25;

wire [9:0] health_bar_x_location, health_bar_y_location;

assign health_bar_x_location = 100;
assign health_bar_y_location = 300;

wire [3:0] health_on;
wire [11:0] health_rgb_data [11:0];

genvar i;
generate
    for (i=0; i < MAX_LIVES; i = i + 1) begin
        heart_maker display_lives (
            .clk(clk),
            .x(x),
            .y(y),
            .start_x(health_bar_x_location + i*25),
            .start_y(health_bar_y_location),
            .size(HEART_SIZE),
            .heart_on(health_on[i]),
            .rgb_data(health_rgb_data[i])
        );
    end
endgenerate

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


// Stage 1: Check if video is on
reg video_active;
always @(posedge clk or posedge reset) begin
    if (reset)
        video_active <= 1'b0;
    else
        video_active <= video_on;
end

// Stage 2: Determine intermediate RGB value
reg [11:0] intermediate_rgb;
always @(posedge clk or posedge reset) begin
    if (reset)
        intermediate_rgb <= 12'h000;
    else if (~video_active)
        intermediate_rgb <= 12'h000;
    //--------------------fruit-----------------------
    else if (fruit_on && fruit_rgb_data != 12'hFFF)
        intermediate_rgb <= fruit_rgb_data;
    //--------------------player-----------------------
    else if (player1_on && player1_rgb_data != 12'hFFF)
        intermediate_rgb <= player1_rgb_data;
    //--------------------health-----------------------
    else if (health_on[0] && health_rgb_data[0] != 12'hFFF && sw[2:0] >= 1)
        intermediate_rgb <= health_rgb_data[0];
    else if (health_on[1] && health_rgb_data[1] != 12'hFFF && sw[2:0] >= 2)
        intermediate_rgb <= health_rgb_data[1];
    else if (health_on[2] && health_rgb_data[2] != 12'hFFF && sw[2:0] >= 3)
        intermediate_rgb <= health_rgb_data[2];
    //--------------------background-----------------------
    else
        intermediate_rgb <= background_rgb;
end

// Stage 3: Final assignment to RGB output
always @(posedge clk or posedge reset) begin
    if (reset)
        rgb <= 12'h000;
    else
        rgb <= intermediate_rgb;
end

endmodule


// this is the old, non-pipeline way
/*
always @*
    if(~video_on)
        rgb = 12'h000;          // black(no value) outside display area
    else
        //--------------------player-----------------------
        // if player1_on and rgb_data isn't white
        if (player1_on && player1_rgb_data != 12'hFFF) 
            rgb = player1_rgb_data;
        //--------------------fruit------------------------
//        else if (fruit_on && fruit_rgb_data != 12'hFFF)
//            rgb = fruit_rgb_data;
        //--------------------healthbar--------------------
        else if (health_on[0] && health_rgb_data[0] != 12'hFFF && sw[2:0] >= 1)
            rgb = health_rgb_data[0];
        else if (health_on[1] && health_rgb_data[1] != 12'hFFF && sw[2:0] >= 2)
            rgb = health_rgb_data[1];
        else if (health_on[2] && health_rgb_data[2] != 12'hFFF && sw[2:0] >= 3)
            rgb = health_rgb_data[2];
        //--------------------background-------------------
        else
            rgb = background_rgb;

endmodule
*/