module lfsr (
    input clk,
    input reset,
    input A, // Additional input signal to trigger re-generation of the random number
    output reg [9:0] random_number // 10-bit number to accommodate the range 10 to 590
);
    reg [7:0] lfsr_reg; // 8-bit LFSR register
    reg prev_A; // Register to hold the previous state of A for edge detection
    wire feedback;
    wire trigger; // Trigger when A goes from high to low

    // Feedback calculation for the LFSR
    assign feedback = lfsr_reg[7] ^ lfsr_reg[5] ^ lfsr_reg[4] ^ lfsr_reg[3];

    // Edge detection for signal A (detecting high-to-low transition)
    assign trigger = prev_A & ~A;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            lfsr_reg <= 8'h1; // Seed value
            prev_A <= 1'b1; // Assume A is high at reset to avoid immediate trigger
            random_number <= 10; // Initialize to minimum value
        end else begin
            lfsr_reg <= {lfsr_reg[6:0], feedback};
            prev_A <= A; // Update the previous state of A
            if (trigger) begin
                // Only update the random_number when A transitions from high to low
                random_number <= (lfsr_reg * 580 / 255) + 10; // Scale to 580 (590-10) and offset by 10
            end
        end
    end
endmodule