`timescale 1ns / 1ps

module pixel_generation(
    input clk,                      // 100MHz from Basys 3
    input reset,                    // btnC
    input video_on,                 // from VGA controller
    input [9:0] x, y,               // from VGA controller
    output reg [11:0] rgb,          // to DAC, to VGA controller
    // gamecube input things
    input A,
    input B,
    input start_pause,
    input [7:0] JOY_X,
    // switches for test purposes
    input [15:0] sw,
    output reg [15:0] score
);
initial score = 0;
// create a 60Hz refresh tick at the start of vsync 
// I think this is 4 clock cycles?
wire refresh_tick;
assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0;



/******************************************************************************
* this is where I am making a player character
* with motion!!! :)
* pipelined to be better for timing things
******************************************************************************/

wire player1_on;
// position things
wire [11:0] player1_rgb_data;
wire [9:0] player1_x_wire;
wire [9:0] player1_y_wire;
reg  [9:0] player1_x_reg;
reg  [9:0] player1_x_next; // pipeline register for x position
initial player1_x_reg = 380;
initial player1_x_next = 380;

// position y is constant in this example
assign player1_y_wire = 300;

// Pipeline stage for calculating next position
reg [2:0] player_speed;
initial player_speed = 1;

always @(posedge clk) begin
    if (B) player_speed <= 2;
    else player_speed <= 1;
end

localparam DEADZONE = 32;
always @(posedge clk) begin
    if (refresh_tick) begin
        // if left, move left
        // left is 0, middle is 128, right is higher: 256?
        if ((sw[15] || (JOY_X <= 128-DEADZONE)) && player1_x_next > 10) begin
            player1_x_next <= player1_x_next - player_speed;
        end
        else if ((sw[14] || (JOY_X >= 128+DEADZONE)) && player1_x_next < 530) begin
            player1_x_next <= player1_x_next + player_speed;
        end
    end
end

// Pipeline stage for updating the position
always @(posedge clk) begin
    player1_x_reg <= player1_x_next;  // Update x position from pipeline register
end

// Assign the output wire to the updated register
assign player1_x_wire = player1_x_reg;

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
wire [9:0] fruit_x, fruit_y;

reg [9:0] fruit_x_next_reg, fruit_y_next_reg;
reg fruit_respawn;
initial fruit_respawn = 0;

//-----------------------lfsr for location---------------------------
lfsr lfsr_to_get_fruit_x (
    .clk(clk),
    .reset(reset),
    .condition(fruit_respawn),
    .low_bound(10),
    .up_bound(590),
    .random_number(fruit_x)
);



//-----------------------lfsr for which fruit------------------------

wire [3:0] which_fruit;
//assign which_fruit_1 = sw[6:3];

lfsr lfsr_to_get_which_fruit (
    .clk(clk),
    .reset(reset),
    .condition(fruit_respawn),
    .low_bound(0),
    .up_bound(3),
    .random_number(which_fruit)
);

//-----------------------motion from gravity------------------------

wire player_catching;
wire [10:0] diff_x;
wire [10:0] diff_y;

// get centers
wire [9:0] player1_x_center, player1_y_center;
wire [9:0] fruit_x_center, fruit_y_center;
// player centers
assign player1_x_center = player1_x_wire + 50;
assign player1_y_center = player1_y_wire + 50;
// fruit centers
assign fruit_x_center = fruit_x + 20;
assign fruit_y_center = fruit_y + 20;
// calculate the absolute value of the difference between centers
assign diff_x = player1_x_center >= fruit_x_center ? player1_x_center - fruit_x_center : fruit_x_center - player1_x_center;
assign diff_y = player1_y_center >= fruit_y_center ? player1_y_center - fruit_y_center : fruit_y_center - player1_y_center;

// Compare differences to the threshold of 5
assign player_catching = (diff_x <= 70) && (diff_y <= 70);

always @(posedge clk) begin
    if (refresh_tick) begin
        // if hits ground, or is caught, respawn
        if (fruit_y_next_reg >= 430 || (player_catching)) begin
            // check score and powerups here
            if (player_catching) begin
                // have case for whichfruit to check for powerups here
                score <= score + 1; 
            end
            // respawn
            fruit_y_next_reg <= 0;
            fruit_respawn <= 1;
        end
        else begin
            // move down like normal
            fruit_y_next_reg <= fruit_y_next_reg + 1; // adding moves down, jacob
            fruit_respawn <= 0;
        end
    
    end


end



assign fruit_x = fruit_x_next_reg;
assign fruit_y = fruit_y_next_reg;

//---------------------------------make the fruit------------------------------
wire [3:0] fruit_on;
wire [11:0] fruit_rgb_data;

fruit_maker (
    .clk(clk),
    .x(x),
    .y(y),
    .x_position(fruit_x),
    .y_position(fruit_y),
    .size(FRUIT_SIZE),
    .which_fruit(which_fruit),
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
assign background_rgb[7:4]  = background_rom_data_endian[7:4];
assign background_rgb[3:0]  = background_rom_data_endian[11:8];


//wire [12:0] background_rgb;
//assign background_rgb = 12'hF00; // blue

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
    //--------------------fruit------------------------------------------------
    else if (fruit_on)
        intermediate_rgb <= fruit_rgb_data;
    //--------------------player-----------------------------------------------
    else if (player1_on)
        intermediate_rgb <= player1_rgb_data;
    //--------------------health-----------------------------------------------
    else if (health_on[0] && sw[2:0] >= 1)
        intermediate_rgb <= health_rgb_data[0];
    else if (health_on[1] && sw[2:0] >= 2)
        intermediate_rgb <= health_rgb_data[1];
    else if (health_on[2] && sw[2:0] >= 3)
        intermediate_rgb <= health_rgb_data[2];
    //--------------------background-------------------------------------------
//    else if ((y >= 0) && (y <= 320))   intermediate_rgb <= 12'b1110_1010_0000; // blue sky
//    else if ((y >= 320) && (y <= 360)) intermediate_rgb <= 12'b0100_1011_0010; // green grass
//    else if ((y >= 360) && (y <= 440)) intermediate_rgb <= 12'b0000_0000_0000; // black road
//    else if ((y >= 440) && (y <= 480)) intermediate_rgb <= 12'b0100_1011_0010; // green grass
//        intermediate_rgb <= background_rgb;
    else
        intermediate_rgb <= background_rgb; // white default case, shouldn't happen
end


// Stage 3: Final assignment to RGB output
always @(posedge clk or posedge reset) begin
    if (reset)
        rgb <= 12'h000;
    else
        rgb <= intermediate_rgb;
end

endmodule
