module lfsr (
    input wire clk,
    input wire reset,
    input wire condition,
    input wire [9:0] low_bound,
    input wire [9:0] up_bound,
    input wire [9:0] seed,
    output reg [9:0] random_number
);

// Parameters for the LFSR - change width as needed
parameter LFSR_WIDTH = 10;
//parameter SEED = 8'b1010_0101;  // Non-zero seed
reg [LFSR_WIDTH-1:0] lfsr_reg;
wire feedback;

// Register to detect rising edge of condition
reg condition_prev;

// assign feedback = (lfsr_reg[9] ^ lfsr_reg[6]);
assign feedback = (lfsr_reg[3] ^ lfsr_reg[0]);

// reg keep_generating;

wire keep_generating;
// we keep generating when event happens or we are not in range
assign keep_generating = ( (condition && !condition_prev) || ~(lfsr_reg >= low_bound && lfsr_reg <= up_bound) );

always @(posedge clk or posedge reset) begin
    if (reset) begin
        lfsr_reg <= seed;
        random_number <= 0;
        condition_prev <= 1'b0;  // Initialize previous condition state
    end else begin
        condition_prev <= condition;  // Update previous condition state
        // Check for rising edge of condition
        // if in range, stop generating
        // else keep generating
        
        if (keep_generating) begin
            lfsr_reg <= {lfsr_reg[LFSR_WIDTH-2:0], feedback};
        end
        else begin
            random_number <= lfsr_reg;
        end
        

    end
end


endmodule
