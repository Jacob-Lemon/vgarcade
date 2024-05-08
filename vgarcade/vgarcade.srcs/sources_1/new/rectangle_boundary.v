`timescale 1ns/1ps

module rectangle_boundary(
    input [9:0] x, // x coordinate of the vga pixel
    input [9:0] y, // y coordinate of the vga pixel
    input [9:0] left, right, up, down,
    output block_on
);

    assign block_on = (x > left) && (x < right) &&
                      (y > up) && (y < down);

endmodule
