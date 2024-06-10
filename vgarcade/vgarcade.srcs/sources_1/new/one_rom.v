`timescale 1ns / 1ps
module one_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 0 && (row * 25 + col) <= 35) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 36 && (row * 25 + col) <= 38) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 39 && (row * 25 + col) <= 59) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 60 && (row * 25 + col) <= 63) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 64 && (row * 25 + col) <= 82) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 83 && (row * 25 + col) <= 88) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 89 && (row * 25 + col) <= 106) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 107 && (row * 25 + col) <= 113) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 114 && (row * 25 + col) <= 130) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 131 && (row * 25 + col) <= 138) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 139 && (row * 25 + col) <= 154) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 155 && (row * 25 + col) <= 158) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 159 && (row * 25 + col) <= 160) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 161 && (row * 25 + col) <= 163) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 164 && (row * 25 + col) <= 179) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 180 && (row * 25 + col) <= 182) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 183 && (row * 25 + col) <= 185) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 186 && (row * 25 + col) <= 188) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 189 && (row * 25 + col) <= 210) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 211 && (row * 25 + col) <= 213) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 214 && (row * 25 + col) <= 235) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 236 && (row * 25 + col) <= 238) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 239 && (row * 25 + col) <= 260) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 261 && (row * 25 + col) <= 263) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 264 && (row * 25 + col) <= 285) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 286 && (row * 25 + col) <= 288) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 289 && (row * 25 + col) <= 310) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 311 && (row * 25 + col) <= 313) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 314 && (row * 25 + col) <= 335) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 336 && (row * 25 + col) <= 338) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 339 && (row * 25 + col) <= 360) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 361 && (row * 25 + col) <= 363) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 364 && (row * 25 + col) <= 385) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 386 && (row * 25 + col) <= 388) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 389 && (row * 25 + col) <= 410) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 411 && (row * 25 + col) <= 413) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 414 && (row * 25 + col) <= 435) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 436 && (row * 25 + col) <= 438) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 439 && (row * 25 + col) <= 460) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 461 && (row * 25 + col) <= 463) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 464 && (row * 25 + col) <= 485) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 486 && (row * 25 + col) <= 488) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 489 && (row * 25 + col) <= 510) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 511 && (row * 25 + col) <= 513) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 514 && (row * 25 + col) <= 535) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 536 && (row * 25 + col) <= 538) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 539 && (row * 25 + col) <= 560) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 561 && (row * 25 + col) <= 563) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 564 && (row * 25 + col) <= 585) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 586 && (row * 25 + col) <= 588) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 589 && (row * 25 + col) <= 610) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 611 && (row * 25 + col) <= 613) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 614 && (row * 25 + col) <= 635) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 636 && (row * 25 + col) <= 638) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 639 && (row * 25 + col) <= 653) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 654 && (row * 25 + col) <= 670) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 671 && (row * 25 + col) <= 678) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 679 && (row * 25 + col) <= 695) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 696 && (row * 25 + col) <= 703) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 704 && (row * 25 + col) <= 720) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 721 && (row * 25 + col) < 750) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule
