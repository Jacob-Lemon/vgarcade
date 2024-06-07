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
    output [15:0] score
);
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

localparam DEADZONE = 64;
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
// more player data that is needed elsewhere
wire [9:0] player1_x_center, player1_y_center;

assign player1_x_center = player1_x_wire + 50;
assign player1_y_center = player1_y_wire + 50;


/**************************************************************************************************
* Here lies the creation of multiple fruits
* There shall be many fruits
**************************************************************************************************/
localparam FRUIT_SIZE = 40;
localparam NUM_FRUITS = 2;  // Number of fruits

// Array definitions for multiple fruits
wire [9:0] fruit_x[NUM_FRUITS:0];
wire [9:0] fruit_y[NUM_FRUITS:0];

reg [9:0] fruit_x_next_reg[NUM_FRUITS:0];
reg [9:0] fruit_y_next_reg[NUM_FRUITS:0];
reg [NUM_FRUITS-1:0] fruit_respawn;

wire [NUM_FRUITS:0] fruit_on;
wire [11:0] fruit_rgb_data [NUM_FRUITS:0];
wire [3:0] which_fruit[NUM_FRUITS:0];

reg [15:0] score_array[NUM_FRUITS:0];

// Initializations
integer j;
initial begin
    for (j = 0; j < NUM_FRUITS; j = j + 1) begin
        fruit_respawn[j] = 0;
        fruit_y_next_reg[j] = 0;
    end
end

// LFSR and handling logic for each fruit
genvar idx;
generate
//    genvar idx;
    for (idx = 0; idx < NUM_FRUITS; idx = idx + 1) begin : fruit_generation
        lfsr_x_generation lfsr_to_get_fruit_x (
            .clk(clk),
            .reset(reset),
            .condition(fruit_respawn[idx]),
            .seed(10*idx+7),
            .random_number(fruit_x[idx])
        );

        lfsr lfsr_to_get_which_fruit (
            .clk(clk),
            .reset(reset),
            .condition(fruit_respawn[idx]),
            .low_bound(0),
            .up_bound(3),
            .seed(idx+1),
            .random_number(which_fruit[idx])
        );

        wire player_catching;
        wire [10:0] diff_x, diff_y;
        wire [9:0] fruit_x_center, fruit_y_center;

        assign fruit_x_center = fruit_x[idx] + 20;
        assign fruit_y_center = fruit_y[idx] + 20;
        assign diff_x = player1_x_center >= fruit_x_center ? player1_x_center - fruit_x_center : fruit_x_center - player1_x_center;
        assign diff_y = player1_y_center >= fruit_y_center ? player1_y_center - fruit_y_center : fruit_y_center - player1_y_center;
        assign player_catching = (diff_x <= 70) && (diff_y <= 70);

        always @(posedge clk) begin
            if (refresh_tick) begin
                if (fruit_y_next_reg[idx] >= 430 || player_catching) begin
                    if (player_catching) begin
                        score_array[idx] <= score_array[idx] + 1;
                    end
                    fruit_y_next_reg[idx] <= 0; // respawn value
                    fruit_respawn[idx] <= 1;
                end else begin
                    fruit_y_next_reg[idx] <= fruit_y_next_reg[idx] + 1;
                    fruit_respawn[idx] <= 0;
                end
            end
        end

        assign fruit_x[idx] = fruit_x_next_reg[idx];
        assign fruit_y[idx] = fruit_y_next_reg[idx];

        fruit_maker fruit_maker_inst (
            .clk(clk),
            .x(x),
            .y(y),
            .x_position(fruit_x[idx]),
            .y_position(fruit_y[idx]),
            .size(FRUIT_SIZE),
            .which_fruit(which_fruit[idx]),
            .fruit_on(fruit_on[idx]),
            .rgb_data(fruit_rgb_data[idx])
        );
    end
endgenerate

// score thing
assign score =  score_array[0] +
                score_array[1];
//                score_array[2] +
//                score_array[3] +
//                score_array[4];

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
            .start_x(health_bar_x_location + i*HEART_SIZE),
            .start_y(health_bar_y_location),
            .size(HEART_SIZE),
            .heart_on(health_on[i]),
            .rgb_data(health_rgb_data[i])
        );
    end
endgenerate

/******************************************************************************
* Score generation
******************************************************************************/
// data I need
localparam DECIMAL_PLACES = 3;
localparam NUMBER_WIDTH = 25;
localparam NUMBER_HEIGHT = 30;

wire [9:0] score_bar_x_location, score_bar_y_location;

assign score_bar_x_location = 300;
assign score_bar_y_location = 100;

wire [3:0] number_on;
wire [11:0] number_rgb_data [11:0];

//----------get number data from score--------------

wire [3:0] score_in_decimal [3:0];

assign score_in_decimal[0] = score % 10;
assign score_in_decimal[1] = (score / 10) % 10;
assign score_in_decimal[2] = (score / 100) % 10;
assign score_in_decimal[3] = (score / 1000) % 10;

genvar iterator1;
generate
    for (iterator1=0; iterator1 < DECIMAL_PLACES; iterator1 = iterator1 + 1) begin
        number_maker display_score (
            .clk(clk),
            .x(x),
            .y(y),
            .x_position(score_bar_x_location + iterator1*NUMBER_WIDTH),
            .y_position(score_bar_y_location),
            .size_x(NUMBER_WIDTH),
            .size_y(NUMBER_HEIGHT),
            .which_number(score_in_decimal[iterator1]),
            .number_on(number_on[iterator1]),
            .rgb_data(number_rgb_data[iterator1])
        );
    end
endgenerate

localparam test = 3**3;


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
integer k; // iterator
always @(posedge clk or posedge reset) begin
    if (reset)
        intermediate_rgb <= 12'h000;
    else if (~video_active)
        intermediate_rgb <= 12'h000;
    //--------------------fruit------------------------------------------------
    else if (fruit_on[0])
        intermediate_rgb <= fruit_rgb_data[0];
    else if (fruit_on[1])
        intermediate_rgb <= fruit_rgb_data[1];
//    else if (fruit_on[2])
//        intermediate_rgb <= fruit_rgb_data[2];
//    else if (fruit_on[3])
//        intermediate_rgb <= fruit_rgb_data[3];
//    else if (fruit_on[4])
//        intermediate_rgb <= fruit_rgb_data[4];
    
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
    //--------------------score display------------------
    else if (number_on[0])
        intermediate_rgb <= number_rgb_data[0];
    else if (number_on[1])
        intermediate_rgb <= number_rgb_data[1];
    else if (number_on[2])
        intermediate_rgb <= number_rgb_data[2];
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
