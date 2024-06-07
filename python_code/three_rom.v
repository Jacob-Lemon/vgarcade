`timescale 1ns / 1ps
module three_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 0 && (row * 25 + col) <= 29) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 30 && (row * 25 + col) <= 41) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 42 && (row * 25 + col) <= 51) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 52 && (row * 25 + col) <= 68) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 69 && (row * 25 + col) <= 75) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 76 && (row * 25 + col) <= 94) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 95 && (row * 25 + col) <= 100) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 101 && (row * 25 + col) <= 107) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 108 && (row * 25 + col) <= 113) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 114 && (row * 25 + col) <= 120) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 121 && (row * 25 + col) <= 125) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 126 && (row * 25 + col) <= 129) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 130 && (row * 25 + col) <= 140) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 141 && (row * 25 + col) <= 146) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 147 && (row * 25 + col) <= 166) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 167 && (row * 25 + col) <= 171) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 172 && (row * 25 + col) <= 192) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 193 && (row * 25 + col) <= 197) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 198 && (row * 25 + col) <= 218) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 219 && (row * 25 + col) <= 222) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 223 && (row * 25 + col) <= 243) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 244 && (row * 25 + col) <= 248) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 249 && (row * 25 + col) <= 268) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 269 && (row * 25 + col) <= 273) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 274 && (row * 25 + col) <= 293) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 294 && (row * 25 + col) <= 298) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 299 && (row * 25 + col) <= 314) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 315 && (row * 25 + col) <= 322) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 323 && (row * 25 + col) <= 335) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 336 && (row * 25 + col) <= 346) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 347 && (row * 25 + col) <= 360) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 361 && (row * 25 + col) <= 371) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 372 && (row * 25 + col) <= 385) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 386 && (row * 25 + col) <= 397) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 398 && (row * 25 + col) <= 410) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 411 && (row * 25 + col) <= 422) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 423 && (row * 25 + col) <= 443) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 444 && (row * 25 + col) <= 447) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 448 && (row * 25 + col) <= 469) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 470 && (row * 25 + col) <= 473) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 474 && (row * 25 + col) <= 494) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 495 && (row * 25 + col) <= 498) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 499 && (row * 25 + col) <= 519) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 520 && (row * 25 + col) <= 523) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 524 && (row * 25 + col) <= 543) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 544 && (row * 25 + col) <= 548) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 549 && (row * 25 + col) <= 568) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 569 && (row * 25 + col) <= 572) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 573 && (row * 25 + col) <= 592) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 593 && (row * 25 + col) <= 597) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 598 && (row * 25 + col) <= 601) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 602 && (row * 25 + col) <= 603) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 604 && (row * 25 + col) <= 615) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 616 && (row * 25 + col) <= 621) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 622 && (row * 25 + col) <= 626) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 627 && (row * 25 + col) <= 629) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 630 && (row * 25 + col) <= 636) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 637 && (row * 25 + col) <= 646) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 647 && (row * 25 + col) <= 651) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 652 && (row * 25 + col) <= 670) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 671 && (row * 25 + col) <= 676) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 677 && (row * 25 + col) <= 693) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 694 && (row * 25 + col) <= 702) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 703 && (row * 25 + col) <= 714) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 715 && (row * 25 + col) < 750) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule
