`timescale 1ns/1ps

module rectangle_boundary(
    input [9:0] x, // Assuming a 32-bit input for the x-coordinate
    input [9:0] y, // Assuming a 32-bit input for the y-coordinate
    input [9:0] left, right, up, down,
    output block_on
);
    /*
    wire [9:0] block_left_bound = 10;
    wire [9:0] block_right_bound = 20;
    wire [9:0] block_down_bound = 20;
    wire [9:0] block_up_bound = 10;
    */
    
    assign block_on = (x > left) && (x < right) &&
                      (y > up) && (y < down);

endmodule
