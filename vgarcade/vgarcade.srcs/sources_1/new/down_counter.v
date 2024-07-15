/**************************************************************************************************
* This is a pretty normal down counter, except it counts down only during the 60Hz refresh tick.
* 
**************************************************************************************************/

module down_counter(
    input clk,                          // system clock, 100MHz
    input refresh_tick,                 // 60Hz refresh tick
    input reset,                        // system reset
    input timer_start,                  // starts the counter, while high it resets the count
    input [15:0] frames_to_count_for,   // how long, in 60Hz frames, I want the powerup to be active for
    output reg [15:0] counter,          // value of the counter
    output timer_active                 // a one bit output for whether or not the timer is active
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        counter <= 0; // timer is not on and not counting upon reset
    end
    else begin
        if (timer_start) begin
            // if timer start, reset the timer
            counter <= frames_to_count_for;
        end
        else if (refresh_tick) begin    // this ensures that it counts down at 60Hz, not every clock cycle
            if (counter > 0) begin
                // decrement counter
                counter <= counter - 1;
            end
        end
    end
end

// timer is on and active if and only if counter is not zero
assign timer_active = (|counter);

endmodule
