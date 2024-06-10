`timescale 1ns / 1ps
module two_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 0 && (row * 25 + col) <= 34) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 35 && (row * 25 + col) <= 39) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 40 && (row * 25 + col) <= 54) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 55 && (row * 25 + col) <= 67) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 68 && (row * 25 + col) <= 77) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 78 && (row * 25 + col) <= 94) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 95 && (row * 25 + col) <= 100) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 101 && (row * 25 + col) <= 121) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 122 && (row * 25 + col) <= 125) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 126 && (row * 25 + col) <= 132) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 133 && (row * 25 + col) <= 139) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 140 && (row * 25 + col) <= 146) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 147 && (row * 25 + col) <= 150) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 151 && (row * 25 + col) <= 155) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 156 && (row * 25 + col) <= 166) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 167 && (row * 25 + col) <= 172) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 173 && (row * 25 + col) <= 193) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 194 && (row * 25 + col) <= 197) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 198 && (row * 25 + col) <= 218) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 219 && (row * 25 + col) <= 223) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 224 && (row * 25 + col) <= 244) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 245 && (row * 25 + col) <= 248) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 249 && (row * 25 + col) <= 269) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 270 && (row * 25 + col) <= 273) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 274 && (row * 25 + col) <= 295) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 296 && (row * 25 + col) <= 298) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 299 && (row * 25 + col) <= 320) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 321 && (row * 25 + col) <= 323) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 324 && (row * 25 + col) <= 345) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 346 && (row * 25 + col) <= 348) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 349 && (row * 25 + col) <= 369) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 370 && (row * 25 + col) <= 373) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 374 && (row * 25 + col) <= 393) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 394 && (row * 25 + col) <= 398) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 399 && (row * 25 + col) <= 417) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 418 && (row * 25 + col) <= 423) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 424 && (row * 25 + col) <= 441) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 442 && (row * 25 + col) <= 447) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 448 && (row * 25 + col) <= 464) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 465 && (row * 25 + col) <= 471) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 472 && (row * 25 + col) <= 487) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 488 && (row * 25 + col) <= 495) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 496 && (row * 25 + col) <= 511) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 512 && (row * 25 + col) <= 519) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 520 && (row * 25 + col) <= 533) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 534 && (row * 25 + col) <= 542) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 543 && (row * 25 + col) <= 555) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 556 && (row * 25 + col) <= 565) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 566 && (row * 25 + col) <= 578) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 579 && (row * 25 + col) <= 588) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 589 && (row * 25 + col) <= 601) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 602 && (row * 25 + col) <= 609) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 610 && (row * 25 + col) <= 625) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 626 && (row * 25 + col) <= 648) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 649 && (row * 25 + col) <= 650) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 651 && (row * 25 + col) <= 673) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 674 && (row * 25 + col) <= 675) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 676 && (row * 25 + col) <= 698) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 699 && (row * 25 + col) <= 700) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 701 && (row * 25 + col) <= 723) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 724 && (row * 25 + col) < 750) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule
