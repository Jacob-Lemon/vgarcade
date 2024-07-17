/**************************************************************************************************
* This is an lfsr.
* For this design we want to have the lfsr generate a random number within a specific range, that
* is given upon instantiation. To achieve this, we have the lfsr generate a number every clock
* cycle until we get a number in the range we want
**************************************************************************************************/

module lfsr (
    input wire clk,                 // system clock, 100Mhz
    input wire reset,               // system reset
    input wire condition,           // the condition that triggers the activation of the lfsr
    input wire [3:0] game_state,
    input wire [9:0] low_bound,     // lower bound that determines the range of numbers the lfsr can generate
    input wire [9:0] up_bound,      // upper bound
    input wire [9:0] seed,          // seed for the lfsr
    output reg [9:0] random_number  // output, the randomly generated number
);

// Parameters for the LFSR - change width as needed
parameter LFSR_WIDTH = 10;
reg [LFSR_WIDTH-1:0] lfsr_reg;
wire feedback;

// Register to detect rising edge of condition
reg condition_prev;

// this is the lfsr polynomial
assign feedback = (lfsr_reg[9] ^ lfsr_reg[6]);

wire keep_generating;
// we keep generating when event happens or we are not in range
assign keep_generating = ( (condition && !condition_prev) || ~(lfsr_reg >= low_bound && lfsr_reg <= up_bound) );

always @(posedge clk or posedge reset) begin
    if (reset) begin
        lfsr_reg <= seed;
        random_number <= 0;
        condition_prev <= 0;  // Initialize previous condition state
    end else if (game_state != 3) begin // if we are not in game_play mode
        lfsr_reg <= seed;   // seed the lfsr when not in gameplay
        random_number <= 0;
        condition_prev <= 0;
    end else begin
        // Update previous condition to check for rising edge of condition
        condition_prev <= condition;
        // if we need to keep generating
        if (keep_generating) begin
            // generate a new number
            lfsr_reg <= {lfsr_reg[LFSR_WIDTH-2:0], feedback};
        end
        else begin
            // else we assign the output and are done
            random_number <= lfsr_reg;
        end
    end
end

endmodule