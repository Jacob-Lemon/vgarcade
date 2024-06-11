// generates numbers from 0-100

module lfsr_which_fruit (
    input wire clk,
    input wire reset,
    input wire condition,
    input wire [6:0] seed, // 10-bit seed
    output reg [6:0] random_number
);

// Parameters for the LFSR - using a 7-bit width
parameter LFSR_WIDTH = 7;

reg [LFSR_WIDTH-1:0] lfsr_reg;
wire feedback;

// Register to detect rising edge of condition
reg condition_prev;

// Polynomial for a 10-bit LFSR: x^10 + x^7 + 1 (primitive polynomial)
assign feedback = (lfsr_reg[6] ^ lfsr_reg[5]);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        lfsr_reg <= seed;  // Initialize LFSR with the seed
        random_number <= 0;
        condition_prev <= 1'b0;  // Initialize previous condition state
    end else begin
        condition_prev <= condition;  // Update previous condition state
        // Check for rising edge of condition
        if (condition && !condition_prev) begin
            lfsr_reg <= {lfsr_reg[LFSR_WIDTH-2:0], feedback};  // Shift LFSR and inject feedback
            // Scale the LFSR output to generate numbers from 10 to 590
            random_number <= 10 + ((lfsr_reg * 581) >> LFSR_WIDTH);
        end
    end
end

endmodule
