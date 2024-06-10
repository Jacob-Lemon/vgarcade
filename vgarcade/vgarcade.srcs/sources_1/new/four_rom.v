`timescale 1ns / 1ps
module four_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 0 && (row * 25 + col) <= 28) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 29 && (row * 25 + col) <= 31) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 32 && (row * 25 + col) <= 42) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 43 && (row * 25 + col) <= 45) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 46 && (row * 25 + col) <= 53) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 54 && (row * 25 + col) <= 56) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 57 && (row * 25 + col) <= 67) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 68 && (row * 25 + col) <= 70) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 71 && (row * 25 + col) <= 78) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 79 && (row * 25 + col) <= 81) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 82 && (row * 25 + col) <= 92) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 93 && (row * 25 + col) <= 95) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 96 && (row * 25 + col) <= 103) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 104 && (row * 25 + col) <= 106) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 107 && (row * 25 + col) <= 117) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 118 && (row * 25 + col) <= 120) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 121 && (row * 25 + col) <= 128) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 129 && (row * 25 + col) <= 131) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 132 && (row * 25 + col) <= 142) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 143 && (row * 25 + col) <= 145) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 146 && (row * 25 + col) <= 153) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 154 && (row * 25 + col) <= 156) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 157 && (row * 25 + col) <= 167) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 168 && (row * 25 + col) <= 170) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 171 && (row * 25 + col) <= 178) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 179 && (row * 25 + col) <= 181) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 182 && (row * 25 + col) <= 192) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 193 && (row * 25 + col) <= 195) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 196 && (row * 25 + col) <= 203) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 204 && (row * 25 + col) <= 206) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 207 && (row * 25 + col) <= 217) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 218 && (row * 25 + col) <= 220) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 221 && (row * 25 + col) <= 228) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 229 && (row * 25 + col) <= 231) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 232 && (row * 25 + col) <= 242) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 243 && (row * 25 + col) <= 245) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 246 && (row * 25 + col) <= 253) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 254 && (row * 25 + col) <= 256) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 257 && (row * 25 + col) <= 267) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 268 && (row * 25 + col) <= 270) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 271 && (row * 25 + col) <= 278) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 279 && (row * 25 + col) <= 281) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 282 && (row * 25 + col) <= 292) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 293 && (row * 25 + col) <= 295) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 296 && (row * 25 + col) <= 303) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 304 && (row * 25 + col) <= 320) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 321 && (row * 25 + col) <= 328) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 329 && (row * 25 + col) <= 345) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 346 && (row * 25 + col) <= 353) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 354 && (row * 25 + col) <= 370) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 371 && (row * 25 + col) <= 392) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 393 && (row * 25 + col) <= 395) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 396 && (row * 25 + col) <= 417) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 418 && (row * 25 + col) <= 420) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 421 && (row * 25 + col) <= 442) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 443 && (row * 25 + col) <= 445) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 446 && (row * 25 + col) <= 467) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 468 && (row * 25 + col) <= 470) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 471 && (row * 25 + col) <= 492) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 493 && (row * 25 + col) <= 495) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 496 && (row * 25 + col) <= 517) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 518 && (row * 25 + col) <= 520) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 521 && (row * 25 + col) <= 542) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 543 && (row * 25 + col) <= 545) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 546 && (row * 25 + col) <= 567) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 568 && (row * 25 + col) <= 570) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 571 && (row * 25 + col) <= 592) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 593 && (row * 25 + col) <= 595) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 596 && (row * 25 + col) <= 617) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 618 && (row * 25 + col) <= 620) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 621 && (row * 25 + col) <= 642) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 643 && (row * 25 + col) <= 645) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 646 && (row * 25 + col) <= 667) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 668 && (row * 25 + col) <= 670) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 671 && (row * 25 + col) <= 692) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 693 && (row * 25 + col) <= 695) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 696 && (row * 25 + col) <= 717) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 718 && (row * 25 + col) <= 720) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 721 && (row * 25 + col) < 750) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule
