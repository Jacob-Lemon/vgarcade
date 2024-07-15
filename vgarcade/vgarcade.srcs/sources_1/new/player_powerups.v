/**************************************************************************************************
* This module contains the logic regarding player powerups. The output signals determine
* speed_caught and shield_caught are arrays to account for catching any one fruit.
**************************************************************************************************/

module player_powerups(
    // system inputs
    input clk,                          // 100Mhz system clock
    input reset,                        // sytem reset
    input refresh_tick,                 // 60Hz refresh tick
    input [3:0] game_state,             // game state for reset purposes
    // gamecube inputs, these are the buttons that use powerups
    input A, B, X, Y, start_pause, L, R, Z,
    // powerup inputs from pixel gen
    input [3:0] speed_caught,           // signal for whether we have caught a speed boost
    input [3:0] shield_caught,          // signal for catching a sheild
    input posedge_car_collision,        // the positive edge of car_player_collision
    // outputs
    output speed_boost_on,              // whether the speed boost is on
    output reg speed_boost_available,   // whether the speed boost is available, for the boost display
    output reg shield_boost_on          // whether the shield boost is actually on
);

// playing, this is for reset purposes
wire playing;
assign playing = (game_state == 3);    // GAMEPLAY

//----------------------speed bost logic-----------------------------------------------------------
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
    else
        // simple state machine
        if (speed_boost_available == 0) begin
            // if we don't have the speed boost, it goes high upon catching a speed
            speed_boost_available <= (|speed_caught); // whether or not we have caught any speed
            start_boosting <= 0; // we aren't starting the boost here, so it needs to be low
        end
        else if (speed_boost_available == 1) begin
            // if we have the speed boost, it only goes low upon using the powerup (by pressing B)
            if (B) begin
                speed_boost_available <= 0; // use boost powerup
                start_boosting <= 1;    // start the boost timer
            end
            else begin
                // if we aren't using the boost, we aren't starting the timer
                start_boosting <= 0;
            end
        end
    // end
end

down_counter speed_boost_timer (
    .clk(clk),                      // system clock
    .refresh_tick(refresh_tick),    // 60Hz frame refresh tick
    .reset(reset),                  // game reset
    .timer_start(start_boosting),   // signal to control the start of the down counter
    .frames_to_count_for(960),      // 960 frames = 4 seconds = 60Hz * 4 seconds * 4 counts per frame
    // outputs
    .counter(),                     // unused port in this case, may be invalid syntax
    .timer_active(speed_boost_on)   // boost is active for as long as the timer is active
);

//----------------------shield logic---------------------------------------------------------------
always @(posedge clk or posedge reset) begin
    if (reset) begin
        shield_boost_on <= 0;
    end
    else if (~playing) begin
        shield_boost_on <= 0;
    end
    else begin
        // this is a super simple state machine
        if (shield_boost_on == 0) begin
            // if we haven't caught a shield, it goes high when we have caught one
            shield_boost_on <= (|shield_caught);    // bitwise or here because we can catch any one fruit
        end
        else if (shield_boost_on == 1) begin
            // if we have a shield, it goes low upon car collision
            if (posedge_car_collision) begin
                shield_boost_on <= 0;
            end
        end
    end
end

endmodule