module four_rom (
	input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 29 && (row * 25 + col) <= 31) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 43 && (row * 25 + col) <= 45) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 54 && (row * 25 + col) <= 56) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 68 && (row * 25 + col) <= 70) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 79 && (row * 25 + col) <= 81) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 93 && (row * 25 + col) <= 95) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 104 && (row * 25 + col) <= 106) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 118 && (row * 25 + col) <= 120) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 129 && (row * 25 + col) <= 131) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 143 && (row * 25 + col) <= 145) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 154 && (row * 25 + col) <= 156) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 168 && (row * 25 + col) <= 170) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 179 && (row * 25 + col) <= 181) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 193 && (row * 25 + col) <= 195) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 204 && (row * 25 + col) <= 206) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 218 && (row * 25 + col) <= 220) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 229 && (row * 25 + col) <= 231) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 243 && (row * 25 + col) <= 245) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 254 && (row * 25 + col) <= 256) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 268 && (row * 25 + col) <= 270) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 279 && (row * 25 + col) <= 281) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 293 && (row * 25 + col) <= 295) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 304 && (row * 25 + col) <= 320) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 329 && (row * 25 + col) <= 345) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 354 && (row * 25 + col) <= 370) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 393 && (row * 25 + col) <= 395) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 418 && (row * 25 + col) <= 420) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 443 && (row * 25 + col) <= 445) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 468 && (row * 25 + col) <= 470) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 493 && (row * 25 + col) <= 495) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 518 && (row * 25 + col) <= 520) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 543 && (row * 25 + col) <= 545) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 568 && (row * 25 + col) <= 570) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 593 && (row * 25 + col) <= 595) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 618 && (row * 25 + col) <= 620) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 643 && (row * 25 + col) <= 645) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 668 && (row * 25 + col) <= 670) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 693 && (row * 25 + col) <= 695) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 718 && (row * 25 + col) <= 720) color_data <= 12'b000000000000; else
        color_data <= 12'b111111111111;
    end
endmodule