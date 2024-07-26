`timescale 1ns / 1ps
module zfill_rom (
    input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 0 && (row * 584 + col) <= 3444) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 3445 && (row * 584 + col) <= 3454) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 3455 && (row * 584 + col) <= 4027) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 4028 && (row * 584 + col) <= 4042) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 4043 && (row * 584 + col) <= 4611) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 4612 && (row * 584 + col) <= 4633) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 4634 && (row * 584 + col) <= 5195) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 5196 && (row * 584 + col) <= 5217) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 5218 && (row * 584 + col) <= 5780) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 5781 && (row * 584 + col) <= 5802) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 5803 && (row * 584 + col) <= 6365) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 6366 && (row * 584 + col) <= 6388) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 6389 && (row * 584 + col) <= 6950) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 6951 && (row * 584 + col) <= 6974) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 6975 && (row * 584 + col) <= 7539) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 7540 && (row * 584 + col) <= 7560) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 7561 && (row * 584 + col) <= 8125) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 8126 && (row * 584 + col) <= 8145) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 8146 && (row * 584 + col) <= 8710) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 8711 && (row * 584 + col) <= 8730) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 8731 && (row * 584 + col) <= 9296) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 9297 && (row * 584 + col) <= 9315) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 9316 && (row * 584 + col) <= 9882) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 9883 && (row * 584 + col) <= 9900) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 9901 && (row * 584 + col) <= 10467) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 10468 && (row * 584 + col) <= 10486) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 10487 && (row * 584 + col) <= 11052) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 11053 && (row * 584 + col) <= 11071) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 11072 && (row * 584 + col) <= 11637) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 11638 && (row * 584 + col) <= 11656) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 11657 && (row * 584 + col) <= 12222) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 12223 && (row * 584 + col) <= 12241) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 12242 && (row * 584 + col) <= 12808) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 12809 && (row * 584 + col) <= 12826) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 12827 && (row * 584 + col) <= 13393) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 13394 && (row * 584 + col) <= 13412) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 13413 && (row * 584 + col) <= 13978) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 13979 && (row * 584 + col) <= 13997) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 13998 && (row * 584 + col) <= 14563) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 14564 && (row * 584 + col) <= 14582) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 14583 && (row * 584 + col) <= 15148) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 15149 && (row * 584 + col) <= 15167) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 15168 && (row * 584 + col) <= 15734) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 15735 && (row * 584 + col) <= 15752) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 15753 && (row * 584 + col) <= 16319) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 16320 && (row * 584 + col) <= 16337) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 16338 && (row * 584 + col) <= 16904) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 16905 && (row * 584 + col) <= 16922) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 16923 && (row * 584 + col) <= 17489) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 17490 && (row * 584 + col) <= 17506) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 17507 && (row * 584 + col) <= 18075) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 18076 && (row * 584 + col) <= 18091) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 18092 && (row * 584 + col) <= 18661) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 18662 && (row * 584 + col) <= 18675) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 18676 && (row * 584 + col) <= 19246) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 19247 && (row * 584 + col) <= 19259) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 19260 && (row * 584 + col) <= 19831) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 19832 && (row * 584 + col) <= 19843) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 19844 && (row * 584 + col) <= 20416) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 20417 && (row * 584 + col) <= 20427) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 20428 && (row * 584 + col) <= 21001) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 21002 && (row * 584 + col) <= 21012) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 21013 && (row * 584 + col) <= 21585) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 21586 && (row * 584 + col) <= 21596) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 21597 && (row * 584 + col) <= 22170) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 22171 && (row * 584 + col) <= 22181) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 22182 && (row * 584 + col) <= 22755) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 22756 && (row * 584 + col) <= 22765) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 22766 && (row * 584 + col) <= 23340) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 23341 && (row * 584 + col) <= 23349) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 23350 && (row * 584 + col) <= 23924) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 23925 && (row * 584 + col) <= 23933) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 23934 && (row * 584 + col) <= 24509) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 24510 && (row * 584 + col) <= 24517) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 24518 && (row * 584 + col) <= 25094) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 25095 && (row * 584 + col) <= 25101) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 25102 && (row * 584 + col) <= 25679) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 25680 && (row * 584 + col) <= 25685) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 25686 && (row * 584 + col) < 97528) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule
