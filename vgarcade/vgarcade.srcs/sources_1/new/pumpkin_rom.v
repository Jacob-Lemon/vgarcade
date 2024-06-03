`timescale 1ns / 1ps
module pumpkin_rom (
    input wire clk,
    input wire [5:0] row,
    input wire [5:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 40 + col) >= 0 && (row * 40 + col) <= 338) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 339 && (row * 40 + col) <= 339) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 340 && (row * 40 + col) <= 377) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 378 && (row * 40 + col) <= 380) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 381 && (row * 40 + col) <= 417) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 418 && (row * 40 + col) <= 418) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 419 && (row * 40 + col) <= 420) color_data <= 12'b001010110100; else
        if ((row * 40 + col) >= 421 && (row * 40 + col) <= 421) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 422 && (row * 40 + col) <= 457) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 458 && (row * 40 + col) <= 458) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 459 && (row * 40 + col) <= 460) color_data <= 12'b001010110100; else
        if ((row * 40 + col) >= 461 && (row * 40 + col) <= 461) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 462 && (row * 40 + col) <= 496) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 497 && (row * 40 + col) <= 498) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 499 && (row * 40 + col) <= 500) color_data <= 12'b001010110100; else
        if ((row * 40 + col) >= 501 && (row * 40 + col) <= 501) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 502 && (row * 40 + col) <= 536) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 537 && (row * 40 + col) <= 537) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 538 && (row * 40 + col) <= 540) color_data <= 12'b001010110100; else
        if ((row * 40 + col) >= 541 && (row * 40 + col) <= 541) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 542 && (row * 40 + col) <= 573) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 574 && (row * 40 + col) <= 582) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 583 && (row * 40 + col) <= 610) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 611 && (row * 40 + col) <= 613) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 614 && (row * 40 + col) <= 622) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 623 && (row * 40 + col) <= 625) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 626 && (row * 40 + col) <= 648) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 649 && (row * 40 + col) <= 650) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 651 && (row * 40 + col) <= 665) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 666 && (row * 40 + col) <= 667) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 668 && (row * 40 + col) <= 686) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 687 && (row * 40 + col) <= 688) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 689 && (row * 40 + col) <= 707) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 708 && (row * 40 + col) <= 709) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 710 && (row * 40 + col) <= 725) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 726 && (row * 40 + col) <= 726) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 727 && (row * 40 + col) <= 749) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 750 && (row * 40 + col) <= 750) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 751 && (row * 40 + col) <= 764) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 765 && (row * 40 + col) <= 765) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 766 && (row * 40 + col) <= 790) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 791 && (row * 40 + col) <= 791) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 792 && (row * 40 + col) <= 803) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 804 && (row * 40 + col) <= 804) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 805 && (row * 40 + col) <= 831) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 832 && (row * 40 + col) <= 832) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 833 && (row * 40 + col) <= 843) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 844 && (row * 40 + col) <= 844) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 845 && (row * 40 + col) <= 871) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 872 && (row * 40 + col) <= 872) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 873 && (row * 40 + col) <= 882) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 883 && (row * 40 + col) <= 883) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 884 && (row * 40 + col) <= 912) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 913 && (row * 40 + col) <= 913) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 914 && (row * 40 + col) <= 922) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 923 && (row * 40 + col) <= 923) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 924 && (row * 40 + col) <= 952) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 953 && (row * 40 + col) <= 953) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 954 && (row * 40 + col) <= 962) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 963 && (row * 40 + col) <= 963) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 964 && (row * 40 + col) <= 992) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 993 && (row * 40 + col) <= 993) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 994 && (row * 40 + col) <= 1002) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1003 && (row * 40 + col) <= 1003) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1004 && (row * 40 + col) <= 1032) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 1033 && (row * 40 + col) <= 1033) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1034 && (row * 40 + col) <= 1042) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1043 && (row * 40 + col) <= 1043) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1044 && (row * 40 + col) <= 1072) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 1073 && (row * 40 + col) <= 1073) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1074 && (row * 40 + col) <= 1083) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1084 && (row * 40 + col) <= 1084) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1085 && (row * 40 + col) <= 1111) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 1112 && (row * 40 + col) <= 1112) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1113 && (row * 40 + col) <= 1123) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1124 && (row * 40 + col) <= 1124) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1125 && (row * 40 + col) <= 1151) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 1152 && (row * 40 + col) <= 1152) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1153 && (row * 40 + col) <= 1164) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1165 && (row * 40 + col) <= 1165) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1166 && (row * 40 + col) <= 1190) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 1191 && (row * 40 + col) <= 1191) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1192 && (row * 40 + col) <= 1205) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1206 && (row * 40 + col) <= 1206) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1207 && (row * 40 + col) <= 1229) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 1230 && (row * 40 + col) <= 1230) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1231 && (row * 40 + col) <= 1246) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1247 && (row * 40 + col) <= 1248) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1249 && (row * 40 + col) <= 1267) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 1268 && (row * 40 + col) <= 1269) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1270 && (row * 40 + col) <= 1288) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1289 && (row * 40 + col) <= 1290) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1291 && (row * 40 + col) <= 1305) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 1306 && (row * 40 + col) <= 1307) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1308 && (row * 40 + col) <= 1330) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1331 && (row * 40 + col) <= 1333) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1334 && (row * 40 + col) <= 1342) color_data <= 12'b111101110001; else
        if ((row * 40 + col) >= 1343 && (row * 40 + col) <= 1345) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1346 && (row * 40 + col) <= 1373) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1374 && (row * 40 + col) <= 1382) color_data <= 12'b000000000000; else
        if ((row * 40 + col) >= 1383 && (row * 40 + col) < 1600) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule
