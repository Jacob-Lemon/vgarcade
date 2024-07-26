`timescale 1ns / 1ps
module dupfill_rom (
    input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 0 && (row * 584 + col) <= 45292) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 45293 && (row * 584 + col) <= 45309) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 45310 && (row * 584 + col) <= 45876) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 45877 && (row * 584 + col) <= 45893) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 45894 && (row * 584 + col) <= 46460) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 46461 && (row * 584 + col) <= 46477) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 46478 && (row * 584 + col) <= 47044) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 47045 && (row * 584 + col) <= 47061) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 47062 && (row * 584 + col) <= 47628) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 47629 && (row * 584 + col) <= 47645) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 47646 && (row * 584 + col) <= 48212) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 48213 && (row * 584 + col) <= 48229) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 48230 && (row * 584 + col) <= 48796) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 48797 && (row * 584 + col) <= 48813) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 48814 && (row * 584 + col) <= 49380) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 49381 && (row * 584 + col) <= 49397) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 49398 && (row * 584 + col) <= 49964) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 49965 && (row * 584 + col) <= 49981) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 49982 && (row * 584 + col) <= 50548) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 50549 && (row * 584 + col) <= 50565) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 50566 && (row * 584 + col) <= 51132) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 51133 && (row * 584 + col) <= 51149) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 51150 && (row * 584 + col) <= 51716) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 51717 && (row * 584 + col) <= 51733) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 51734 && (row * 584 + col) <= 52300) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 52301 && (row * 584 + col) <= 52317) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 52318 && (row * 584 + col) <= 52884) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 52885 && (row * 584 + col) <= 52901) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 52902 && (row * 584 + col) <= 53468) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 53469 && (row * 584 + col) <= 53485) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 53486 && (row * 584 + col) <= 54052) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 54053 && (row * 584 + col) <= 54069) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 54070 && (row * 584 + col) <= 54636) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 54637 && (row * 584 + col) <= 54653) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 54654 && (row * 584 + col) <= 55220) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 55221 && (row * 584 + col) <= 55237) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 55238 && (row * 584 + col) <= 55804) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 55805 && (row * 584 + col) <= 55821) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 55822 && (row * 584 + col) <= 56388) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 56389 && (row * 584 + col) <= 56405) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 56406 && (row * 584 + col) <= 56972) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 56973 && (row * 584 + col) <= 56989) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 56990 && (row * 584 + col) <= 57556) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 57557 && (row * 584 + col) <= 57573) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 57574 && (row * 584 + col) <= 58140) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 58141 && (row * 584 + col) <= 58157) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 58158 && (row * 584 + col) <= 58724) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 58725 && (row * 584 + col) <= 58741) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 58742 && (row * 584 + col) <= 59308) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 59309 && (row * 584 + col) <= 59325) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 59326 && (row * 584 + col) <= 59892) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 59893 && (row * 584 + col) <= 59909) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 59910 && (row * 584 + col) <= 60476) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 60477 && (row * 584 + col) <= 60493) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 60494 && (row * 584 + col) < 97528) color_data <= 12'b000000000000; else
        color_data <= 12'b000000000000;
    end
endmodule
