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
    input [15:0] sw                // switches from the basys3 board
);
// create a 60Hz refresh tick at the start of vsync
// this is the framerate
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

reg [3:0] game_state;
initial game_state = START_SCREEN;

wire player_dead;
wire not_playing;
wire almost_game_over; //assigned on line five hundred something
assign not_playing = ~(game_state == GAMEPLAY);

reg center_joystick;

// state control
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // reset behavior of game_state state machine
        game_state <= START_SCREEN;
    end
    else begin
        center_joystick <= 0; //used to keep this only high for 1 clock cycle
        case (game_state)
            START_SCREEN: begin
                if (start_pause)
                    game_state <= GAMEPLAY;
                else if (Z)
                    game_state <= INSTRUCTIONS;
                else if (Y) begin
                    center_joystick <= 1; //used to center the joysticks in input display
                    game_state <= INPUT_DISPLAY;
                end else
                    game_state <= START_SCREEN;
            end
            INPUT_DISPLAY: begin
                if (L & R & D_UP)
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
                if (player_dead && car_state == CAR_WAITING)
                    game_state <= KILL_SCREEN;
            end
            KILL_SCREEN: begin
                if (L & R)
                    game_state <= START_SCREEN;
                else if (start_pause)
                    game_state <= GAMEPLAY;
                else
                    game_state <= KILL_SCREEN;
            end
            default: begin
                game_state <= START_SCREEN;
            end
        endcase
    end
end

/**************************************************************************************************
* this is where I am making a player character
* with motion!!! :)
**************************************************************************************************/
//------------------------------position things------------------------------
wire [9:0] player1_x_wire;
reg  [9:0] player1_x_reg;
reg  [9:0] player1_x_next; // pipeline register for x position

wire [9:0] player1_y_wire;
reg  [9:0] player1_y_reg;
reg  [9:0] player1_y_next; // pipeline register for y position


// dead player position
wire [9:0] dead_player_x_wire;
reg  [9:0] dead_player_x_reg;

wire [9:0] dead_player_y_wire;
reg  [9:0] dead_player_y_reg;

//------------------------------powerup things------------------------------
// speed boost signals
reg [3:0] speed_caught;
reg [3:0] shield_caught;
wire speed_boost_on;
wire shield_boost_on;

// shield signals
wire posedge_shield_car_player_collision;

player_powerups get_powers (
    // system inputs
    .clk(clk),
    .reset(reset),
    // game signals
    .refresh_tick(refresh_tick),
    .game_state(game_state),
    // gamecube inputs
    .A(A), .B(B), .X(X), .Y(Y), .start_pause(start_pause), .L(L), .R(R), .Z(Z),
    // powerup signals
    .speed_caught(speed_caught),
    .shield_caught(shield_caught),
    .posedge_car_collision(posedge_shield_car_player_collision),
    //outputs
    .speed_boost_on(speed_boost_on),
    .speed_boost_available(speed_boost_available),
    .shield_boost_on(shield_boost_on)
);

//---------------------motion things-------------------------------------------

initial begin
    player1_x_reg = 380;
    player1_x_next = 380;
    player1_y_reg = 300;
    player1_y_next = 300;

    dead_player_x_reg = player1_x_reg - 15;
    dead_player_y_reg = player1_y_reg + 15;
end

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
    else begin
        // speed is determined by if the speed boost is active or not
        if (speed_boost_on) player_x_speed <= 4;    // speed represents pixels moves per frame
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
    else begin
        if (refresh_tick) begin
            //--------------------vertical motion--------------------
            // if jumping and touching the ground, cause jumping
            if (A && player1_y_next >= 299 && !player_jumping) begin // 299 was 300
                player_jumping <= 1;
            end else
            if (player_jumping) begin
                // if we are low enough, we can keep jumping
                if (player1_y_next >= 100) begin
                    player1_y_next <= player1_y_next - 2; // go up
                end
                // if we stop holding A, or reach max jump height
                if (~A || player1_y_next <= 100) begin
                    player_jumping <= 0;
                end
            end else begin
                if (player1_y_next <= 300)
                    player1_y_next <= player1_y_next + 2; // go down
                end
            //--------------------horizontal motion--------------------
            // if left, move left
            // left is 0, middle is 128, right is higher: 256? - on the joystick
            if ((sw[15] || (JOY_X <= 128-DEADZONE)) && player1_x_next > 10) begin
                // move left
                player1_x_next <= player1_x_next - player_x_speed;
            end
            else if ((sw[14] || (JOY_X >= 128+DEADZONE)) && player1_x_next < (640 - 10 - (PLAYER_WIDTH))) begin
                // move right
                player1_x_next <= player1_x_next + player_x_speed;
            end

            if (!almost_game_over) begin
                if (player1_x_next > 25)
                    dead_player_x_reg <= player1_x_next - 15; // so that dead player "falls" to the left when hit
                else
                    dead_player_x_reg <= player1_x_next; // so that dead player doesn't disappear on left side when "falling"

                dead_player_y_reg <= player1_y_next + 15; // so that dead player "falls down" when hit
            end else begin
                if (dead_player_y_reg <= 300) begin
                    dead_player_y_reg <= dead_player_y_reg + 2; // dead player will continue falling from where it got hit
                end
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
        player1_x_reg <= player1_x_next;  // Update x position from pipeline register
        player1_y_reg <= player1_y_next;
    end
end

// Assign the output wire to the updated register
assign player1_x_wire = player1_x_reg;
assign player1_y_wire = player1_y_reg;

assign dead_player_x_wire = dead_player_x_reg;
assign dead_player_y_wire = dead_player_y_reg;

//----------------------player rgb signals---------------------------------------------------------
wire player1_on;
wire [11:0] player1_rgb_data;

// player dimensions in pixels
localparam PLAYER_HEIGHT = 92;
localparam PLAYER_WIDTH  = 77;

player_maker player1 (
    .clk(clk),
    .x(x),
    .y(y),
    .x_position(player1_x_wire),
    .y_position(player1_y_wire),
    .height(PLAYER_HEIGHT),
    .width(PLAYER_WIDTH),
    .shield_on(shield_boost_on),
    .player_on(player1_on),
    .rgb_data(player1_rgb_data)
);


//----------------------dead player rgb signals---------------------------------------------------------
wire dead_player_on;
wire [11:0] dead_player_rgb_data;

// player dimensions in pixels
localparam DEAD_PLAYER_HEIGHT = 77;
localparam DEAD_PLAYER_WIDTH  = 92;

dead_player_maker dead_player (
    .clk(clk),
    .x(x),
    .y(y),
    .x_position(dead_player_x_wire),
    .y_position(dead_player_y_wire),
    .height(DEAD_PLAYER_HEIGHT),
    .width(DEAD_PLAYER_WIDTH),
    .dead_player_on(dead_player_on),
    .rgb_data(dead_player_rgb_data)
);




/**************************************************************************************************
* Here lies the creation of multiple fruits
* There shall be many fruits
**************************************************************************************************/
localparam FRUIT_SIZE = 40; // height and width
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

// each fruit keeps track of how many times it has been caught
// and how much score that specific fruit contributes to the total
// the array is summed up later
reg [15:0] score_array[NUM_FRUITS:0];

// Initializations
integer j;
initial begin
    for (j = 0; j < NUM_FRUITS; j = j + 1) begin
        fruit_respawn[j] = 0;
        fruit_y_next_reg[j] = 0;
    end
end


// to have the lfsr seed determined by when the game is started
reg [9:0] lfsr_seed = 0;
always @(posedge clk) begin
    lfsr_seed <= lfsr_seed + 1;
end


// LFSR and handling logic for each fruit
genvar idx;
generate
for (idx = 0; idx < NUM_FRUITS; idx = idx + 1) begin : fruit_generation
    lfsr lfsr_to_get_fruit_x (
        .clk(clk),                          // system clock, 100 MHz
        .reset(reset),                      // system reset
        .condition(fruit_respawn[idx]),     // the condition that triggers activation of the lfsr
        .game_state(game_state),            // game state of the game, for reset and re-seeding purposes
        .low_bound(10),                     // lower bounds that determine the numbers the lfsr can generate
        .up_bound(590),                     // upper bound
        .seed(283*idx+lfsr_seed),                 // seed
        // .seed(lfsr_seed >> idx),                 // seed
        .random_number(fruit_x[idx])        // output. this is the x spawn location of the next fruit
    );

    lfsr lfsr_to_get_which_fruit (
        .clk(clk),                          // system clock, 100 MHz
        .reset(reset),                      // system reset
        .condition(fruit_respawn[idx]),     // the condition that triggers activation of the lfsr
        .low_bound(1),                      // lower bound of values the lfsr can generate
        .up_bound(100),                     // upper bound
        .seed(lfsr_seed+256*idx),                 // seed
        .random_number(which_fruit[idx])    // output. this determines which fruit. apple, orange, powerup, etc.
    );

    wire [NUM_FRUITS:0] player_catching;
    
    // if the player and fruit images overlap, that is collision
    assign player_catching[idx] = (player1_on & fruit_on[idx]) && (!almost_game_over);


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
        else begin
            // if hits the ground or is caught
            speed_caught[idx]  <= 0;
            shield_caught[idx] <= 0;
            // the fruit respanws when it hits the ground or the player catches it
            if (fruit_y_next_reg[idx] >= 440 || player_catching[idx]) begin
                // if the player caught it, add points or obtain powerups
                if (player_catching[idx]) begin
                    if (which_fruit[idx] >= 0 && which_fruit[idx] < 40) begin
                        // apple is worth one point
                        score_array[idx] <= score_array[idx] + 1;
                    end

                    else if (which_fruit[idx] >= 40 && which_fruit[idx] < 70) begin
                        // orange is worth two points
                        score_array[idx] <= score_array[idx] + 2;
                    end
            
                    else if (which_fruit[idx] >= 70 && which_fruit[idx] < 90) begin
                        // pineapple is worth three points
                        score_array[idx] <= score_array[idx] + 3;
                    end

                    else if (which_fruit[idx] >= 90 && which_fruit[idx] < 97) begin
                        // strawberry is worth 4 points
                        score_array[idx] <= score_array[idx] + 4;
                    end

                    else if (which_fruit[idx] >= 97 && which_fruit[idx] < 99) begin
                        // speed is caught. this will give the player a speedboost
                        // this signal is given to and used by the player_powerups module
                        speed_caught[idx] <= 1;
                    end
                    else if (which_fruit[idx] >= 99 && which_fruit[idx] <= 100) begin
                        // shield is caught. this will give the player a shield
                        // this signal is given to and used by the player_powerups module
                        shield_caught[idx] <= 1;
                    end
                end
                // respawn by setting y to zero and pushing the respawn signal high
                fruit_y_next_reg[idx] <= 0;
                fruit_respawn[idx] <= 1;
            end else begin  // else if the fruit has not been caught or hit the ground
                if (refresh_tick) begin
                    // just keep moving the fruit down
                    fruit_y_next_reg[idx] <= fruit_y_next_reg[idx] + 1;
                end
                // the fruit does not respawn unless it is caught or hit the ground
                fruit_respawn[idx] <= 0;
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
// this sums up the array of scores from each individual fruit
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
// HEART_SIZE is the height and width of the image in pixels
parameter HEART_SIZE = 25;

wire [9:0] health_bar_x_location, health_bar_y_location;
// location is fixed to a specific place
assign health_bar_x_location = 20;
assign health_bar_y_location = 20;

wire [3:0] health_on;
wire [11:0] health_rgb_data [11:0];

// actual player lives is initialized to be full health
reg [3:0] player1_lives = MAX_LIVES;
// player is dead when they run out of lives
assign player_dead = (player1_lives == 0 && car_state == CAR_WAITING);

genvar i;
generate
    for (i=0; i < MAX_LIVES; i = i + 1) begin : health_bar
        // display each heart
        heart_maker display_lives (
            .clk(clk),
            .x(x),
            .y(y),
            .start_x(health_bar_x_location + i*HEART_SIZE), // this displays each heart further to the right to create a health bar
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
localparam DECIMAL_PLACES = 5;  // this is the number if digits in the score display
localparam NUMBER_WIDTH = 25;   // dimensions of each digit in pixels
localparam NUMBER_HEIGHT = 30;

wire [9:0] score_bar_x_location, score_bar_y_location;
// location of the score display is constant
assign score_bar_x_location = 640 - 10 - (DECIMAL_PLACES * NUMBER_WIDTH);  // 10 pixels from right edge
assign score_bar_y_location = 20;

wire [DECIMAL_PLACES:0] number_on;
wire [11:0] number_rgb_data [11:0];

//----------get number data from score--------------

wire [DECIMAL_PLACES:0] score_in_decimal [4:0];


reg [15:0] displayed_score;
always @(posedge clk) begin
    if (game_state == GAMEPLAY)
        displayed_score <= score;
end

assign score_in_decimal[0] = (displayed_score % 10);                // get the ones place for the score display
assign score_in_decimal[1] = (displayed_score / 10)      % 10;    // tens place, etc.
assign score_in_decimal[2] = (displayed_score / 100)     % 10;
assign score_in_decimal[3] = (displayed_score / 1_000)   % 10;
assign score_in_decimal[4] = (displayed_score / 10_000)  % 10;
// assign score_in_decimal[5] = (score / 100_000) % 10;


genvar iterator1;
generate
    for (iterator1=0; iterator1 < DECIMAL_PLACES; iterator1 = iterator1 + 1) begin : score_bar
        number_maker display_score (
            .clk(clk),
            .x(x),
            .y(y),
            .x_position(score_bar_x_location + iterator1*NUMBER_WIDTH),
            .y_position(score_bar_y_location),
            .size_x(NUMBER_WIDTH),
            .size_y(NUMBER_HEIGHT),
            // this makes sure that the score reads from left to right, MSB to LSB
            .which_number(score_in_decimal[(DECIMAL_PLACES - 1) - iterator1]),
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
// y location is constant
wire [9:0] car_y_wire;
assign car_y_wire = 325;

wire [9:0] car_x_wire;
reg [9:0] car_x_reg  = 700;
reg [9:0] car_x_next = 700;

// car speed starts at 1
reg [2:0] car_x_speed;
initial car_x_speed = 1;


// signals and always block to increase car speed based on points
reg current_8th_bit, previous_8th_bit;
initial current_8th_bit = 0;
initial previous_8th_bit = 0;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        car_x_speed <= 1;
        current_8th_bit <= 0;
        previous_8th_bit <= 0;
    end
    else if (not_playing) begin
        car_x_speed <= 1;
        current_8th_bit <= 0;
        previous_8th_bit <= 0;
    end
    else begin
        // detects a change in the 256 bit place
        current_8th_bit <= score[8];
        previous_8th_bit <= current_8th_bit;

        // increases the car speed every 256 points
        if (current_8th_bit != previous_8th_bit)
            car_x_speed <= car_x_speed + 1;
    end
end

// signals for the moving of the car.
wire car_in_x_range; //checks whether the car is on screen or not
assign car_in_x_range = (car_x_next >= 0 && car_x_next <= 650);

//----------------------collision variables--------------------------------------------------------
// player-car collision detection

reg car_player_collision, prev_car_player_collision;
wire posedge_car_player_collision;
assign posedge_car_player_collision = car_player_collision && ~prev_car_player_collision;
assign posedge_shield_car_player_collision = posedge_car_player_collision; // for powerup earlier in the file

//----------------------car state machine----------------------------------------------------------
// these time paramaters are counted in 60Hz frames.
// CAR_TIME_DURATION represents the total length of the car time cyle, waiting stage time plus warning time
// each refresh tick is four clock cycles, so they need to be 4 times as many frames as they are

// 10 seconds for the total waiting time, car waits for 8 seconds, then 2 more with the warning active
// 8 seconds = (60 frames/sec) * (8 seconds) * (4 because of refresh tick rate) = 1920 frames
// total number of frames is 1920 + 480 = 2400 for a total of 10 seconds
localparam CAR_TIME_DURATION    = 2_400;
// 2 seconds = (60 frames/sec) * (2 seconds) * (4 because of refresh tick rate) = 480 frames
localparam CAR_WARNING_DURATION = 480;

reg car_timer_start = 1;

localparam CAR_WAITING         = 0;     // car is waiting, warning is not active
localparam CAR_WARNING         = 1;     // car is still waiting, but the warning is active
localparam CAR_DRIVING_NOT_HIT = 2;     // describes the state where the car has not hit the player
localparam CAR_DRIVING_HIT     = 3;     // car is still driving, but has hit the player; it will not hit the player twice on one drive by

// initially the car is waiting
reg [1:0] car_state = CAR_WAITING;

// car timer signals
wire car_timer_active;
wire [15:0] car_timer_counter;
reg car_warning_active = 0;

assign almost_game_over = (player1_lives == 0 && car_state != 0);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        car_state <= CAR_WAITING;
        car_timer_start <= 1;
        
        car_x_next <= 700;
        car_player_collision <= 0;
        player1_lives <= MAX_LIVES;
    end
    else if (not_playing) begin
        car_state <= CAR_WAITING;
        car_timer_start <= 1;
        
        car_x_next <= 700;
        car_player_collision <= 0;
        player1_lives <= MAX_LIVES;
    end
    else begin
        case (car_state) 
            CAR_WAITING: begin
                prev_car_player_collision <= car_player_collision;  // to detect positive edge of collision
                car_player_collision <= (player1_on & car_on);      // collision is based on overlap of car and player images
                car_x_next <= 700;
                car_warning_active <= 0;
                // timer should initialize to be active, so we don't need to start starting the timer
                if (car_timer_start) begin
                    car_timer_start <= 0;
                end
                // upon timer expiring, move to next state
                else if (car_timer_counter == CAR_WARNING_DURATION) begin
                    car_state <= CAR_WARNING;
                end
            end

            CAR_WARNING: begin
                car_warning_active <= 1;    // display the car warning
                // upon the timer expiring, we move to the next state
                if (~car_timer_active) begin
                    car_state <= CAR_DRIVING_NOT_HIT;
                    car_x_next <= 645;  // this moves the car in range
                end
            end

            CAR_DRIVING_NOT_HIT: begin
                if (refresh_tick) begin
                    if (~car_timer_active) begin
                        // if the car timer isn't active, move the car
                        car_x_next <= car_x_next - car_x_speed;
                    end
                end
                // if the car is driving, we don't need to keep displaying the warning
                car_warning_active <= 0;
                // detect positive edge of collision
                prev_car_player_collision <= car_player_collision;
                car_player_collision <= (player1_on & car_on);

                if (car_x_wire < 5) begin
                    car_state <= CAR_WAITING;
                    car_timer_start <= 1; // start the timer
                end
                // upon positive edge of collision, decrement lives if player has remaining lives and no shield powerup
                // else if ((posedge_car_player_collision) && (player1_lives > 0)) begin
                else if ((posedge_car_player_collision) && (player1_lives > 0)) begin
                    if (~shield_boost_on) begin
                        player1_lives <= player1_lives - 1;
                    end
                    // upon collision move to next state
                    car_state <= CAR_DRIVING_HIT;
                end

            end

            CAR_DRIVING_HIT: begin
                // if (car_timer_start) begin
                //     car_timer_start <= 0;
                //     car_state <= CAR_WAITING;
                // end
                // don't care about collision in this state
                if (refresh_tick) begin
                    if (~car_timer_active)
                        car_x_next <= car_x_next - car_x_speed;
                end
                prev_car_player_collision <= car_player_collision;
                car_player_collision <= (player1_on & car_on);
                if (car_x_wire < 5) begin
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
    .frames_to_count_for(CAR_TIME_DURATION),    // how long, in 60Hz frames I want to count for
    .counter(car_timer_counter),                // the counter timer value
    .timer_active(car_timer_active)             // whether the timer is active, or inactive
);
//---------------------------------car warning display---------------------------------------------

wire [11:0] warning_rgb_data;
wire warning_on;

warning_maker car_warning (
    .clk(clk),
    .x(x),
    .y(y),
    .x_position(580),   // 640 - 50 - 10 = 580 pixels from right edge
    .y_position(250),   // guess as to where it might look nice
    .height(50),        // image is 50 pixels tall
    .width(50),         // image is 50 pixels wide
    .warning_on(warning_on),
    .rgb_data(warning_rgb_data)
);


//--------------------------------------car maker--------------------------------------------------
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
* here lies the boost display
* this displays a slot that will show a lightning bolt if the speed boost is available for 
* the player to use
**************************************************************************************************/
// dimensions for boost display in pixels
localparam BOOST_DISPLAY_HEIGHT = 59;
localparam BOOST_DISPLAY_WIDTH  = 51;

// location of boost display
localparam BOOST_DISPLAY_X_POSITION = 295;
localparam BOOST_DISPLAY_Y_POSITION = 20;

wire [11:0] boost_display_rgb_data;
wire boost_display_on;

boost_display_maker speed_boost_display (
    .clk(clk),
    .x(x),
    .y(y),
    .x_position(BOOST_DISPLAY_X_POSITION),
    .y_position(BOOST_DISPLAY_Y_POSITION),
    .height(BOOST_DISPLAY_HEIGHT),
    .width(BOOST_DISPLAY_WIDTH),
    .speed_boost_available(speed_boost_available),
    .boost_display_on(boost_display_on),
    .rgb_data(boost_display_rgb_data)
);


/**************************************************************************************************
* here lies the background stuff
* as well as the game_state backgrounds
**************************************************************************************************/
//---------------------------gameplay background---------------------------------------------------
wire [11:0] background_rgb, background_rom_data_endian;
background_rom background_getter (
    .clk(clk),
    .row(y),
    .col(x),
    .color_data(background_rom_data_endian)
);

assign background_rgb[11:8] = background_rom_data_endian[3:0];
assign background_rgb[7:4]  = background_rom_data_endian[7:4];
assign background_rgb[3:0]  = background_rom_data_endian[11:8];

// wire [11:0] background_rgb;
// assign background_rgb = 12'hF00; // blue


//---------------------------start screen background-----------------------------------------------
//  wire [11:0] start_screen_rgb, start_screen_rgb_reversed;
//  start_screen_rom start_screen (
//      .clk(clk),
//      .row(y),
//      .col(x),
//      .color_data(start_screen_rgb_reversed)
//  );
//  assign start_screen_rgb[11:8] = start_screen_rgb_reversed[3:0];
//  assign start_screen_rgb[7:4]  = start_screen_rgb_reversed[7:4];
//  assign start_screen_rgb[3:0]  = start_screen_rgb_reversed[11:8];

wire [11:0] start_screen_rgb;
assign start_screen_rgb = 12'h00F;


//---------------------------instructions background-----------------------------------------------
// wire [11:0] instructions_rgb, instructions_rgb_reversed;
// instructions_rom instructions (
//      .clk(clk),
//      .row(y),
//      .col(x),
//      .color_data(instructions_rgb_reversed)
//  );
//  assign instructions_rgb[11:8] = instructions_rgb_reversed[3:0];
//  assign instructions_rgb[7:4]  = instructions_rgb_reversed[7:4];
//  assign instructions_rgb[3:0]  = instructions_rgb_reversed[11:8];

wire [11:0] instructions_rgb;
assign instructions_rgb = 12'h0FF;




//---------------------------LRback rom-----------------------------------------------
wire [11:0] LRback_rgb, LRback_rgb_reversed;
wire LRback_on;
LRback_rom LRback (
     .clk(clk),
     .row(y), //drawn in top left corner
     .col(x),
     .color_data(LRback_rgb_reversed)
 );
assign LRback_rgb[11:8] = LRback_rgb_reversed[3:0];
assign LRback_rgb[7:4]  = LRback_rgb_reversed[7:4];
assign LRback_rgb[3:0]  = LRback_rgb_reversed[11:8];
assign LRback_on = (x < 384) && (y < 46) && (LRback_rgb != 12'hFFF);


//---------------------------LRUPback rom-----------------------------------------------
wire [11:0] LRUPback_rgb, LRUPback_rgb_reversed;
wire LRUPback_on;
LRUPback_rom LRUPback (
     .clk(clk),
     .row(y), //drawn in top left corner
     .col(x),
     .color_data(LRUPback_rgb_reversed)
 );
assign LRUPback_rgb[11:8] = LRUPback_rgb_reversed[3:0];
assign LRUPback_rgb[7:4]  = LRUPback_rgb_reversed[7:4];
assign LRUPback_rgb[3:0]  = LRUPback_rgb_reversed[11:8];
assign LRUPback_on = (x < 481) && (y < 47) && (LRUPback_rgb != 12'h000);


//---------------------------Game Over rom-----------------------------------------------
wire [11:0] game_over_rgb, game_over_rgb_reversed;
wire game_over_on;
wire [9:0] game_over_row, game_over_col;
game_over_rom game_over (
     .clk(clk),
     .row(game_over_row),
     .col(game_over_col),
     .color_data(game_over_rgb_reversed)
 );
assign game_over_rgb[11:8] = game_over_rgb_reversed[3:0];
assign game_over_rgb[7:4]  = game_over_rgb_reversed[7:4];
assign game_over_rgb[3:0]  = game_over_rgb_reversed[11:8];
assign game_over_col = x - 150;
assign game_over_row = y - 122;
assign game_over_on = (x > 150) && (x < 496) &&
                      (y > 122)   && (y < 307)  &&
                      (game_over_rgb != 12'hFFF);
                      


/******************************************************************************
Drawing background of input viewer
******************************************************************************/
wire input_background_on;
wire [11:0] input_background_rgb_data;

//input maker instantiation for displaying background
input_maker display_background (
    .clk(clk),
    .x(x),
    .y(y),
    .input_background_on(input_background_on),
    .rgb_data(input_background_rgb_data),
    .A(A),
    .B(B),
    .X(X),
    .Y(Y),
    .start_pause(start_pause),
    .L(L),
    .R(R),
    .Z(Z),
    .D_UP(D_UP),
    .D_DOWN(D_DOWN),
    .D_RIGHT(D_RIGHT),
    .D_LEFT(D_LEFT),
    .JOY_X(JOY_X),
    .JOY_Y(JOY_Y),
    .C_STICK_X(C_STICK_X),
    .C_STICK_Y(C_STICK_Y),
    .L_TRIGGER(L_TRIGGER),
    .R_TRIGGER(R_TRIGGER),
    .center_joystick(center_joystick)
);

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
                    intermediate_rgb <= start_screen_rgb; // static image, was blue
            end

            INPUT_DISPLAY: begin
                if (~video_active)
                    intermediate_rgb <= 12'h000;
                //--------------------input_background------------------------------------------------
                else if (input_background_on)
                    intermediate_rgb <= input_background_rgb_data;
                else if (LRUPback_on)
                    intermediate_rgb <= LRUPback_rgb;
                else
                    intermediate_rgb <= 12'h000; // black behind input viewer
            end

            INSTRUCTIONS: begin
                if (~video_active)
                    intermediate_rgb <= 12'h000;
                else if (LRback_on)
                    intermediate_rgb <= LRback_rgb;
                else
                    intermediate_rgb <= instructions_rgb; // static image
            end

            GAMEPLAY: begin
                if (~video_active)
                    intermediate_rgb <= 12'h000;
                //--------------------fruit------------------------------------------------
                else if (fruit_on[0] && !almost_game_over)
                    intermediate_rgb <= fruit_rgb_data[0];
                else if (fruit_on[1] && !almost_game_over)
                    intermediate_rgb <= fruit_rgb_data[1];
                // else if (fruit_on[2])
                //     intermediate_rgb <= fruit_rgb_data[2]; // additional fruits follow in this manner
                //--------------------car--------------------------------------------------
                else if (car_on)
                    intermediate_rgb <= car_rgb_data;
                //--------------------player-----------------------------------------------
                else if (player1_on && !almost_game_over)
                    intermediate_rgb <= player1_rgb_data;
                //--------------------dead player-----------------------------------------------
                else if (dead_player_on && almost_game_over)
                    intermediate_rgb <= dead_player_rgb_data;
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
                //--------------------boost display-----------------------
                else if (boost_display_on && !almost_game_over)
                    intermediate_rgb <= boost_display_rgb_data;
                //--------------------warning display---------------------
                else if (warning_on & car_warning_active)   // only display warning when the car is about to come
                    intermediate_rgb <= warning_rgb_data;
                //--------------------background--------------------------
                else
                    intermediate_rgb <= background_rgb; // background is like the default case
            end // end case of GAMEPLAY

            KILL_SCREEN: begin
                if (~video_active)
                    intermediate_rgb <= 12'h000;
                //--------------------L + R display-----------------------
                else if (LRback_on)
                    intermediate_rgb <= LRback_rgb;
                //--------------------game over screen display-----------------------
                else if (game_over_on)
                    intermediate_rgb <= game_over_rgb;
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
                //--------------------background display------------------
                else
                    intermediate_rgb <= background_rgb; // static image
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