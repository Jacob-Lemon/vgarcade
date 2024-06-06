module lfsr (
    input wire clk,
    input wire reset,
    input wire condition,
    input wire [31:0] low_bound,
    input wire [31:0] up_bound,
    output reg [31:0] random_number
);

// Parameters for the LFSR - change width as needed
parameter LFSR_WIDTH = 8;
parameter SEED = 8'b1010_0101;  // Non-zero seed
reg [LFSR_WIDTH-1:0] lfsr_reg;
wire feedback;

// Register to detect rising edge of condition
reg condition_prev;

// Polynomial: x^8 + x^6 + x^5 + x^4 + 1 (example)
assign feedback = (lfsr_reg[7] ^ lfsr_reg[5] ^ lfsr_reg[4] ^ lfsr_reg[3]);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        lfsr_reg <= SEED;
        random_number <= 0;
        condition_prev <= 1'b0;  // Initialize previous condition state
    end else begin
        condition_prev <= condition;  // Update previous condition state
        // Check for rising edge of condition
        if (condition && !condition_prev) begin
            lfsr_reg <= {lfsr_reg[LFSR_WIDTH-2:0], feedback};
            // Scale the LFSR output to the desired range
            random_number <= low_bound + (lfsr_reg * (up_bound - low_bound + 1) >> LFSR_WIDTH);
        end
    end
end

endmodule
