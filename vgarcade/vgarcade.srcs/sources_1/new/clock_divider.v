`timescale 1ns/1ps

module clock_divider(
    input clk_100MHz,     // Input clock at 100 MHz
    input reset,          // Asynchronous reset
    output reg clk_25MHz  // Output clock at 25 MHz
);

reg [1:0] counter;  // 2-bit counter to divide the clock by 4

always @(posedge clk_100MHz or posedge reset) begin
    if (reset) begin
        counter <= 0;        // Reset counter to 0
        clk_25MHz <= 0;      // Reset output clock to 0
    end else begin
        if (counter == 3) begin
            counter <= 0;    // Reset counter when it hits 4
            clk_25MHz <= ~clk_25MHz; // Toggle the output clock
        end else begin
            counter <= counter + 1;  // Increment counter
        end
    end
end

endmodule
