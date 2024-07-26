`timescale 1ns / 1ps
module yfill_rom (
    input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 0 && (row * 584 + col) <= 14479) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 14480 && (row * 584 + col) <= 14496) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 14497 && (row * 584 + col) <= 15057) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 15058 && (row * 584 + col) <= 15086) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 15087 && (row * 584 + col) <= 15636) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 15637 && (row * 584 + col) <= 15675) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 15676 && (row * 584 + col) <= 16217) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 16218 && (row * 584 + col) <= 16262) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 16263 && (row * 584 + col) <= 16799) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 16800 && (row * 584 + col) <= 16849) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 16850 && (row * 584 + col) <= 17381) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 17382 && (row * 584 + col) <= 17435) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 17436 && (row * 584 + col) <= 17963) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 17964 && (row * 584 + col) <= 18021) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 18022 && (row * 584 + col) <= 18545) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 18546 && (row * 584 + col) <= 18606) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 18607 && (row * 584 + col) <= 19128) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 19129 && (row * 584 + col) <= 19191) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 19192 && (row * 584 + col) <= 19711) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 19712 && (row * 584 + col) <= 19776) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 19777 && (row * 584 + col) <= 20294) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 20295 && (row * 584 + col) <= 20361) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 20362 && (row * 584 + col) <= 20877) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 20878 && (row * 584 + col) <= 20946) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 20947 && (row * 584 + col) <= 21460) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 21461 && (row * 584 + col) <= 21531) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 21532 && (row * 584 + col) <= 22044) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 22045 && (row * 584 + col) <= 22115) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 22116 && (row * 584 + col) <= 22628) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 22629 && (row * 584 + col) <= 22699) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 22700 && (row * 584 + col) <= 23211) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 23212 && (row * 584 + col) <= 23284) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 23285 && (row * 584 + col) <= 23795) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 23796 && (row * 584 + col) <= 23868) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 23869 && (row * 584 + col) <= 24379) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 24380 && (row * 584 + col) <= 24452) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 24453 && (row * 584 + col) <= 24963) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 24964 && (row * 584 + col) <= 25036) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 25037 && (row * 584 + col) <= 25548) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 25549 && (row * 584 + col) <= 25619) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 25620 && (row * 584 + col) <= 26132) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 26133 && (row * 584 + col) <= 26203) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 26204 && (row * 584 + col) <= 26716) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 26717 && (row * 584 + col) <= 26787) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 26788 && (row * 584 + col) <= 27301) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 27302 && (row * 584 + col) <= 27370) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 27371 && (row * 584 + col) <= 27886) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 27887 && (row * 584 + col) <= 27953) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 27954 && (row * 584 + col) <= 28470) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 28471 && (row * 584 + col) <= 28537) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 28538 && (row * 584 + col) <= 29053) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 29054 && (row * 584 + col) <= 29119) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 29120 && (row * 584 + col) <= 29636) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 29637 && (row * 584 + col) <= 29702) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 29703 && (row * 584 + col) <= 30222) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 30223 && (row * 584 + col) <= 30285) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 30286 && (row * 584 + col) <= 30806) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 30807 && (row * 584 + col) <= 30867) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 30868 && (row * 584 + col) <= 31390) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 31391 && (row * 584 + col) <= 31449) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 31450 && (row * 584 + col) <= 31974) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 31975 && (row * 584 + col) <= 32030) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 32031 && (row * 584 + col) <= 32557) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 32558 && (row * 584 + col) <= 32611) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 32612 && (row * 584 + col) <= 33141) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 33142 && (row * 584 + col) <= 33191) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 33192 && (row * 584 + col) <= 33725) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 33726 && (row * 584 + col) <= 33744) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 33745 && (row * 584 + col) <= 33751) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 33752 && (row * 584 + col) <= 33768) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 33769 && (row * 584 + col) <= 34310) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 34311 && (row * 584 + col) <= 34327) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 34328 && (row * 584 + col) <= 34896) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 34897 && (row * 584 + col) <= 34909) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 34910 && (row * 584 + col) <= 35482) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 35483 && (row * 584 + col) <= 35490) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 35491 && (row * 584 + col) < 97528) color_data <= 12'b000000000000; else
        color_data <= 12'b000000000000;
    end
endmodule
