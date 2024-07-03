`timescale 1ns / 1ps

module player_powerups(
    // system inputs
    input clk,
    input reset,
    input refresh_tick,
    input [3:0] game_state,
    // gamecube inputs
    input A, B, X, Y, start_pause, L, R, Z, D_UP, D_DOWN, D_RIGHT, D_LEFT,
    input [7:0] JOY_X, JOY_Y, C_STICK_X, C_STICK_Y, L_TRIGGER, R_TRIGGER,
    // powerup inputs from pixel gen
    input [3:0] speed_caught,
    input [3:0] shield_caught,
    input posedge_car_collision,        // the positive edge of car_player_collision
    // outputs
    output speed_boost_on,
    output reg speed_boost_available,
    output reg shield_boost_on
);

wire playing;
assign playing = (game_state == 3);    // GAMEPLAY


/**************************************************************************************************
* speed boost logic
**************************************************************************************************/
// speed boost signals
reg start_boosting;
// reg speed_boost_available;
initial begin
    // speed signals
    speed_boost_available = 0;
    start_boosting = 0;
    // shield signals
    shield_boost_on = 0;
end

// always block to handle speed boost powerup
always @(posedge clk or posedge reset) begin
    if (reset) begin
        speed_boost_available <= 0;
        start_boosting <= 0;
    end
    else if (~playing) begin
        speed_boost_available <= 0;
        start_boosting <= 0;
    end
    else if (refresh_tick) begin
        if (speed_boost_available == 0) begin
            speed_boost_available <= (|speed_caught); // whether or not we have caught any pumpkin
            start_boosting <= 0; // critical change here!!!
        end
        else if (speed_boost_available == 1) begin
            if (B) begin
                speed_boost_available <= 0; // use boost powerup
                start_boosting <= 1;
            end
            else 
                start_boosting <= 0; // this makes it so boost works but can't be boosting and hold
        end
    end
end

down_counter speed_boost_timer (
    .clk(clk),                      // system clock
    .refresh_tick(refresh_tick),    // 60Hz frame refresh tick
    .reset(reset),                  // game reset
    .timer_start(start_boosting),   // signal to control the start of the down counter
    .frames_to_count_for(960),      // 4 seconds = 240 frames @ 60Hz, 4 counts per frame
    // outputs
    .timer_active(speed_boost_on)   // boost is active for as long as the timer is active
);


/**************************************************************************************************
* shield logic
**************************************************************************************************/


always @(posedge clk or posedge reset) begin
    if (reset) begin
        shield_boost_on <= 0;
    end
    else if (~playing) begin
        shield_boost_on <= 0;
    end
    else if (refresh_tick) begin
        if (shield_boost_on == 0) begin
            shield_boost_on <= (|shield_caught);
        end
        else if (shield_boost_on == 1) begin
            if (posedge_car_collision)
                shield_boost_on <= 0;
        end
    end
end

endmodule