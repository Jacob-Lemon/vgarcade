`timescale 1ns / 1ps

module pixel_generation(
    input clk,                      // 100MHz from Basys 3
    input reset,                    // btnC
    input video_on,                 // from VGA controller
    input [9:0] x, y,               // from VGA controller
    output reg [11:0] rgb,          // to DAC, to VGA controller
    // gamecube input things
    input A, B, X, Y, start_pause, L, R, Z, D_UP, D_DOWN, D_RIGHT, D_LEFT,
    input [7:0] JOY_X, JOY_Y, C_STICK_X, C_STICK_Y, L_TRIGGER, R_TRIGGER,
    // switches for test purposes
    input [15:0] sw, 
    // output [15:0] score,
    output reg [3:0] game_state,
    output not_playing,
);
// create a 60Hz refresh tick at the start of vsync
// this still works as intended
wire refresh_tick;
assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0;


/**************************************************************************************************
* game_state state machine
**************************************************************************************************/
localparam START_SCREEN  = 0;
localparam INPUT_DISPLAY = 1;
localparam INSTRUCTIONS  = 2;
localparam GAMEPLAY      = 3;
localparam KILL_SCREEN   = 4;

// reg [3:0] game_state = START_SCREEN;
initial game_state = START_SCREEN;

wire player_dead;
// wire not_playing;
assign not_playing = (game_state == START_SCREEN || game_state == INPUT_DISPLAY || game_state == INSTRUCTIONS || game_state == KILL_SCREEN);


// state control
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // reset behavior of game_state state machine
        game_state <= START_SCREEN;
    end
    else
    case (game_state)
        START_SCREEN: begin
            if (start_pause)
                game_state <= GAMEPLAY;
            else if (Z)
                game_state <= INSTRUCTIONS;
            else if (Y)
                game_state <= INPUT_DISPLAY;
            else
                game_state <= START_SCREEN;
        end
        INPUT_DISPLAY: begin
            if (L & R)
                game_state <= START_SCREEN;
            else
                game_state <= INPUT_DISPLAY;
        end
        INSTRUCTIONS: begin
            if (L & R)
                game_state <= START_SCREEN;
            else
                game_state <= INSTRUCTIONS;
        end
        GAMEPLAY: begin
            if (player_dead)
                game_state <= KILL_SCREEN;
            // else
            //     game_state <= GAMEPLAY;
        end
        KILL_SCREEN: begin
            if (L & R)
                game_state <= START_SCREEN;
            else
                game_state <= KILL_SCREEN;
        end
        default: begin
            game_state <= START_SCREEN;
        end
    endcase
end



/**************************************************************************************************
* this is where I am making a player character
* with motion!!! :)
**************************************************************************************************/
// necessary signals
wire player1_on;
wire [11:0] player1_rgb_data;
//------------------------------position things------------------------------

wire [9:0] player1_x_wire;
reg  [9:0] player1_x_reg;
reg  [9:0] player1_x_next; // pipeline register for x position

wire [9:0] player1_y_wire;
reg  [9:0] player1_y_reg;
reg  [9:0] player1_y_next; // pipeline register for y position

//------------------------------powerup things------------------------------
// speed boost signals
reg [3:0] speed_caught;
reg [3:0] shield_caught;
//wire speed_boost_on;
// wire shield_boost_on;

// shield signals

wire posedge_shield_car_player_collision;

player_powerups get_powers (
    // system inputs
    .clk(clk),
    .reset(reset),
    .refresh_tick(refresh_tick),
    // gamecube inputs
    .A(A), .B(B), .X(X), .Y(Y), .start_pause(start_pause), .L(L), .R(R), .Z(Z),
    .D_UP(D_UP), .D_DOWN(D_DOWN), .D_RIGHT(D_RIGHT), .D_LEFT(D_LEFT),
    .JOY_X(JOY_X), .JOY_Y(JOY_Y), .C_STICK_X(C_STICK_X), .C_STICK_Y(C_STICK_Y),
    .L_TRIGGER(L_TRIGGER), .R_TRIGGER(R_TRIGGER),
    // powerup signals
    .speed_caught(speed_caught),
    .shield_caught(shield_caught),
    .posedge_car_collision(posedge_shield_car_player_collision),
    //outputs
    .speed_boost_on(speed_boost_on),
    .shield_boost_on(shield_boost_on)
);




//---------------------motion things-------------------------------------------

initial begin
    player1_x_reg = 380;
    player1_x_next = 380;
    player1_y_reg = 300;
    player1_y_next = 300;
end

// position y is constant in this example
//assign player1_y_wire = 300;

// Pipeline stage for calculating next position
reg [2:0] player_x_speed;
reg [2:0] player_y_speed;
initial begin
    player_x_speed = 2;
    player_y_speed = 2;
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        player_x_speed <= 2;
    end
    else if (not_playing) begin
        player_x_speed <= 2;
    end
    // else if (game_state == GAMEPLAY) begin
    else begin
        if (speed_boost_on) player_x_speed <= 4;
        else player_x_speed <= 2;
    end
end

reg player_jumping;
initial player_jumping = 0;

localparam DEADZONE = 64;
// player motion
always @(posedge clk or posedge reset) begin
    if (reset) begin
        player1_x_next = 380;
        player1_y_next = 300;
        player_jumping = 0;
    end
    else if (not_playing) begin
        player1_x_next = 380;
        player1_y_next = 300;
        player_jumping = 0;
    end
    // else if (game_state == GAMEPLAY) begin
    else begin
        if (refresh_tick) begin
        //--------------------vertical motion--------------------
            // if jumping and touching the ground, cause jumping
            if (A && player1_y_next >= 299 && !player_jumping) begin // 299 was 300
                player_jumping <= 1;
            end else
            if (player_jumping) begin
                if (player1_y_next >= 100) begin
                    player1_y_next <= player1_y_next - 2; // go up
                end
                if (~A || player1_y_next <= 100)
                    player_jumping <= 0;
            end else
                if (player1_y_next <= 300)
                    player1_y_next <= player1_y_next + 2; // go down
        //--------------------horizontal motion--------------------
            // if left, move left
            // left is 0, middle is 128, right is higher: 256? - on the joystick
            if ((sw[15] || (JOY_X <= 128-DEADZONE)) && player1_x_next > 10) begin
                player1_x_next <= player1_x_next - player_x_speed;
            end
            else if ((sw[14] || (JOY_X >= 128+DEADZONE)) && player1_x_next < 530) begin
                player1_x_next <= player1_x_next + player_x_speed;
            end
        end
    end
end

// Pipeline stage for updating the position
always @(posedge clk or posedge reset) begin
    if (reset) begin
        player1_x_reg = 380;
    end
    else if (not_playing) begin
        player1_x_reg = 380;
    end
    else begin
        // if (refresh_tick) begin
            player1_x_reg <= player1_x_next;  // Update x position from pipeline register
            player1_y_reg <= player1_y_next;
        // end
    end
end

// Assign the output wire to the updated register
assign player1_x_wire = player1_x_reg;
assign player1_y_wire = player1_y_reg;

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
wire [7:0] which_fruit[NUM_FRUITS:0];

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
for (idx = 0; idx < NUM_FRUITS; idx = idx + 1) begin : fruit_generation
    lfsr lfsr_to_get_fruit_x (
        .clk(clk),                          // system clock, 100 MHz
        .reset(reset),                      // system reset
        .condition(fruit_respawn[idx]),     // the condition that triggers activation of the lfsr
        .low_bound(10),                     // lower bounds that determine the numbers the lfsr can generate
        .up_bound(590),                     // upper bound
        .seed(283*idx+727),                 // seed
        .random_number(fruit_x[idx])        // output. this is the x spawn location of the next fruit
    );

    lfsr lfsr_to_get_which_fruit (
        .clk(clk),                          // system clock, 100 MHz
        .reset(reset),                      // system reset
        .condition(fruit_respawn[idx]),     // the condition that triggers activation of the lfsr
        .low_bound(1),                      // lower bound of values the lfsr can generate
        .up_bound(100),                     // upper bound
        .seed(563+256*idx),                 // seed
        .random_number(which_fruit[idx])    // output. this determines which fruit. apple, orange, powerup, etc.
    );

    wire player_catching;
    wire [10:0] diff_x, diff_y;
    wire [9:0] fruit_x_center, fruit_y_center;
    

    assign fruit_x_center = fruit_x[idx] + 20;
    assign fruit_y_center = fruit_y[idx] + 20;
    assign diff_x = player1_x_center >= fruit_x_center ? player1_x_center - fruit_x_center : fruit_x_center - player1_x_center;
    assign diff_y = player1_y_center >= fruit_y_center ? player1_y_center - fruit_y_center : fruit_y_center - player1_y_center;
    assign player_catching = (diff_x <= 70) && (diff_y <= 70);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // reset behavior
            fruit_x_next_reg[idx] <= 0;
            fruit_y_next_reg[idx] <= 0;
            fruit_respawn[idx] <= 0;
            score_array[idx] <= 0;
            speed_caught[idx] <= 0;
            shield_caught[idx] <= 0;
        end
        else if (not_playing) begin
            fruit_x_next_reg[idx] <= 0;
            fruit_y_next_reg[idx] <= 0;
            fruit_respawn[idx] <= 0;
            score_array[idx] <= 0;
            speed_caught[idx] <= 0;
            shield_caught[idx] <= 0;
        end
        // else if (game_state == GAMEPLAY) begin
        else begin
            if (refresh_tick) begin
                // if hits the ground or is caught
                speed_caught[idx]   <= 0;
                shield_caught[idx]  <= 0;
                if (fruit_y_next_reg[idx] >= 440 || player_catching) begin
                    if (player_catching) begin
                        if (which_fruit[idx] >= 0 && which_fruit[idx] < 40) begin
                            // apple
                            score_array[idx] <= score_array[idx] + 1;
                        end
                        else if (which_fruit[idx] >= 40 && which_fruit[idx] < 70) begin
                            // orange
                            score_array[idx] <= score_array[idx] + 2;
                        end
                        
                        else if (which_fruit[idx] >= 70 && which_fruit[idx] < 80) begin
                            // pumpkin
                            score_array[idx] <= score_array[idx] + 3;
                        end
                        else if (which_fruit[idx] >= 80 && which_fruit[idx] < 95) begin
                            // speed
                            speed_caught[idx] <= 1;
                        end
                        else if (which_fruit[idx] >= 95 && which_fruit[idx] <= 100) begin
                            // shield
                            shield_caught[idx] <= 1;
                        end
                    end
                    fruit_y_next_reg[idx] <= 0; // respawn value
                    fruit_respawn[idx] <= 1;
                end else begin
                    fruit_y_next_reg[idx] <= fruit_y_next_reg[idx] + 1;
                    fruit_respawn[idx] <= 0;
                end
            end
        end
    end

//        assign fruit_x[idx] = fruit_x_next_reg[idx];
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
wire [15:0] score;
assign score =  score_array[0] +
                score_array[1];
//                score_array[2] +
//                score_array[3] +
//                score_array[4];

/**************************************************************************************************
* trying to draw a heart
* doing lives by a generate block
**************************************************************************************************/
// data I need
parameter MAX_LIVES = 3;
parameter HEART_SIZE = 25;

wire [9:0] health_bar_x_location, health_bar_y_location;

assign health_bar_x_location = 100;
assign health_bar_y_location = 300;

wire [3:0] health_on;
wire [11:0] health_rgb_data [11:0];

// actual player lives
reg [3:0] player1_lives = MAX_LIVES;

assign player_dead = (player1_lives == 0);

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

/**************************************************************************************************
* Score board display generation
**************************************************************************************************/
// data I need
localparam DECIMAL_PLACES = 5;
localparam NUMBER_WIDTH = 25;
localparam NUMBER_HEIGHT = 30;

wire [9:0] score_bar_x_location, score_bar_y_location;

assign score_bar_x_location = 295;
assign score_bar_y_location = 50;

wire [DECIMAL_PLACES:0] number_on;
wire [11:0] number_rgb_data [11:0];

//----------get number data from score--------------

wire [DECIMAL_PLACES:0] score_in_decimal [3:0];

assign score_in_decimal[0] = score % 10;
assign score_in_decimal[1] = (score / 10)      % 10;
assign score_in_decimal[2] = (score / 100)     % 10;
assign score_in_decimal[3] = (score / 1_000)   % 10;
assign score_in_decimal[4] = (score / 10_000)  % 10;
// assign score_in_decimal[5] = (score / 100_000) % 10;


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
            .which_number(score_in_decimal[(DECIMAL_PLACES -1) - iterator1]),
            .number_on(number_on[iterator1]),
            .rgb_data(number_rgb_data[iterator1])
        );
    end
endgenerate

/**************************************************************************************************
* here is the car
**************************************************************************************************/
// vga data
wire car_on;
wire [11:0] car_rgb_data;

parameter CAR_WIDTH = 150;
parameter CAR_HEIGHT = 75;

// position and motion data
wire [9:0] car_y_wire;
assign car_y_wire = 325;

wire [9:0] car_x_wire;
reg [9:0] car_x_reg  = 700;
reg [9:0] car_x_next = 700;


// car speed is constant in this design
reg [2:0] car_x_speed;
initial car_x_speed = 1;

// signals for the moving of the car.
wire car_going;
reg car_respawn;
wire car_in_x_range; //checks whether the car is on screen or not

assign car_going = (car_respawn) || (car_in_x_range);
assign car_in_x_range = (car_x_next >= 0 && car_x_next <= 650);

localparam car_time_duration = 600; // 10 seconds, 600 frames = 10s * 60Hz


reg car_timer_start = 0;


//----------------------collision variables--------------------------------------------------------
// player-car collision detection
wire [9:0] car_center_x, car_center_y;
assign car_center_x = car_x_wire + (CAR_WIDTH / 2);
assign car_center_y = car_y_wire + (CAR_HEIGHT / 2);

wire [9:0] car_player_diff_x, car_player_diff_y;

assign car_player_diff_x = player1_x_center >= car_center_x ? player1_x_center - car_center_x : car_center_x - player1_x_center;
assign car_player_diff_y = player1_y_center >= car_center_y ? player1_y_center - car_center_y : car_center_y - player1_y_center;


reg car_player_collision, prev_car_player_collision;
wire posedge_car_player_collision;
assign posedge_car_player_collision = car_player_collision && ~prev_car_player_collision;
assign posedge_shield_car_player_collision = posedge_car_player_collision; // for powerup earlier in the file



//----------------------car state machine----------------------------------------------------------
localparam CAR_WAITING         = 0;
localparam CAR_DRIVING_NOT_HIT = 1;     // describes the state where the car has not hit the player
localparam CAR_DRIVING_HIT     = 2;
reg [1:0] car_state = CAR_WAITING;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        car_state <= CAR_WAITING;
        car_timer_start <= 0;
        
        car_x_next <= 700;
        car_player_collision <= 0;
    end
    else if (not_playing) begin
        car_state <= CAR_WAITING;
    end
    else begin
        case (car_state) 
            CAR_WAITING: begin
                if (car_timer_start) begin
                    car_timer_start <= 0;
                    car_x_next <= 649; // this puts the car in range to be moving
                end

                // upon timer expiring, move to next state
                if (car_timer_inactive) begin
                    car_state <= CAR_DRIVING_NOT_HIT;
                end
            end

            CAR_DRIVING_NOT_HIT: begin
                if (refresh_tick) begin
                    // move the car
                    car_x_next <= car_x_next - car_x_speed;
                    
                    // update prev_car_player_collision to detect the positive edge of collision
                    prev_car_player_collision <= car_player_collision;
                    // detect current collision, if two coordinates are within bounds they are hitting
                    car_player_collision <= (car_player_diff_x <= 80) && (car_player_diff_y <= 120);
                    // upon positive edge of collision, decrement lives if player has remaining lives and no shield powerup
                    if (!car_in_x_range) begin
                        car_state <= CAR_WAITING;
                        car_timer_start <= 1; // start the timer
                    end
                    else if ((posedge_car_player_collision) && (~shield_boost_on) && (player1_lives > 0)) begin
                        player1_lives <= player1_lives - 1;
                        // upon collision move to next state
                        car_state <= CAR_DRIVING_HIT;
                    end
                end

            end

            CAR_DRIVING_HIT: begin
                // don't care about collision in this state
                if (refresh_tick) begin
                    car_x_next <= car_x_next - car_x_speed;
                end

                if (!car_in_x_range) begin
                    car_state <= CAR_WAITING;
                    car_timer_start <= 1; // start the timer
                end
            end
            default: begin
                car_state <= CAR_WAITING;
            end
        endcase
    end
end

//----------------------down_counter for the  car--------------------------------------------------
down_counter car_timer (
    .clk(clk),                                  // system clock, 100MHz
    .refresh_tick(refresh_tick),                // 60Hz refresh tick, framerate
    .reset(reset),                              // game reset
    .timer_start(car_timer_start),              // starts the counter
    .frames_to_count_for(car_time_duration),    // how long, in 60Hz frames I want to count for
    .timer_active(),                            // whether the timer is active, or inactive
    .timer_inactive(car_timer_inactive)         // 
);






// Pipeline stage for updating the position
always @(posedge clk) begin
    car_x_reg <= car_x_next;  // Update x position from pipeline register
end

// Assign the output wire to the updated register
assign car_x_wire = car_x_reg;

car_maker car (
    .clk(clk),
    .x(x),
    .y(y),
    .x_position(car_x_wire),
    .y_position(car_y_wire),
    .size_x(CAR_WIDTH),
    .size_y(CAR_HEIGHT),
    .car_on(car_on),
    .rgb_data(car_rgb_data)
);


/**************************************************************************************************
* here is the background stuff
**************************************************************************************************/

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


//wire [11:0] background_rgb;
//assign background_rgb = 12'hF00; // blue

/**************************************************************************************************
* RGB control
* order of if-else cascade determines layering of visuals
**************************************************************************************************/


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
    else begin
        case (game_state) 
            START_SCREEN: begin
                if (~video_active)
                    intermediate_rgb <= 12'h000;
                else
                    intermediate_rgb <= 12'hF00; // static image
            end

            INPUT_DISPLAY: begin
                if (~video_active)
                    intermediate_rgb <= 12'h000;
                else
                    intermediate_rgb <= 12'h0F0; // static image
            end

            INSTRUCTIONS: begin
                if (~video_active)
                    intermediate_rgb <= 12'h000;
                else
                    intermediate_rgb <= 12'h00F; // static image
            end

            GAMEPLAY: begin
                if (~video_active)
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
                //--------------------car--------------------------------------------------
                else if (car_on)
                    intermediate_rgb <= car_rgb_data;
                //--------------------player-----------------------------------------------
                else if (player1_on)
                    intermediate_rgb <= player1_rgb_data;
                //--------------------health-----------------------------------------------
                else if (health_on[0] && player1_lives >= 1)
                    intermediate_rgb <= health_rgb_data[0];
                else if (health_on[1] && player1_lives >= 2)
                    intermediate_rgb <= health_rgb_data[1];
                else if (health_on[2] && player1_lives >= 3)
                    intermediate_rgb <= health_rgb_data[2];
                //--------------------score display------------------
                else if (number_on[0])
                    intermediate_rgb <= number_rgb_data[0];
                else if (number_on[1])
                    intermediate_rgb <= number_rgb_data[1];
                else if (number_on[2])
                    intermediate_rgb <= number_rgb_data[2];
                else if (number_on[3])
                    intermediate_rgb <= number_rgb_data[3];
                else if (number_on[4])
                    intermediate_rgb <= number_rgb_data[4];
                //--------------------background-------------------------------------------
                else
                    intermediate_rgb <= background_rgb; // white default case, shouldn't happen
            end // end case of GAMEPLAY

            KILL_SCREEN: begin
                if (~video_active)
                    intermediate_rgb <= 12'h000;
                else
                    intermediate_rgb <= 12'hFF0; // static image
            end // end case of KILL_SCREEN

            default: begin
                if (~video_active)
                    intermediate_rgb <= 12'h000;
                else
                    intermediate_rgb <= 12'hAAA; // some shade of gray, this should never happen
            end
        endcase
    end
end

// Stage 3: Final assignment to RGB output
always @(posedge clk or posedge reset) begin
    if (reset)
        rgb <= 12'h000;
    else
        rgb <= intermediate_rgb;
end

endmodule

// Easton's guess for # of lines is 700
// Jacob's guess is 800