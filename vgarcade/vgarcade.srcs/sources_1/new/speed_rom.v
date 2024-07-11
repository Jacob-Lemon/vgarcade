module speed_rom (
    input wire clk,
    input wire [5:0] row,
    input wire [5:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 40 + col) >= 0 && (row * 40 + col) <= 54) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 56 && (row * 40 + col) <= 92) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 95 && (row * 40 + col) <= 95) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 97 && (row * 40 + col) <= 130) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 133 && (row * 40 + col) <= 136) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 138 && (row * 40 + col) <= 168) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 171 && (row * 40 + col) <= 177) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 179 && (row * 40 + col) <= 206) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 209 && (row * 40 + col) <= 217) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 219 && (row * 40 + col) <= 244) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 247 && (row * 40 + col) <= 258) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 260 && (row * 40 + col) <= 282) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 285 && (row * 40 + col) <= 299) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 301 && (row * 40 + col) <= 320) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 323 && (row * 40 + col) <= 339) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 341 && (row * 40 + col) <= 361) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 364 && (row * 40 + col) <= 380) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 382 && (row * 40 + col) <= 403) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 406 && (row * 40 + col) <= 421) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 423 && (row * 40 + col) <= 445) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 448 && (row * 40 + col) <= 462) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 464 && (row * 40 + col) <= 487) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 489 && (row * 40 + col) <= 500) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 503 && (row * 40 + col) <= 528) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 531 && (row * 40 + col) <= 539) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 541 && (row * 40 + col) <= 570) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 573 && (row * 40 + col) <= 580) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 582 && (row * 40 + col) <= 612) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 615 && (row * 40 + col) <= 621) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 624 && (row * 40 + col) <= 652) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 654 && (row * 40 + col) <= 663) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 665 && (row * 40 + col) <= 690) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 693 && (row * 40 + col) <= 704) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 706 && (row * 40 + col) <= 729) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 732 && (row * 40 + col) <= 745) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 747 && (row * 40 + col) <= 771) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 774 && (row * 40 + col) <= 786) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 788 && (row * 40 + col) <= 813) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 815 && (row * 40 + col) <= 827) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 829 && (row * 40 + col) <= 854) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 857 && (row * 40 + col) <= 868) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 870 && (row * 40 + col) <= 896) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 899 && (row * 40 + col) <= 906) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 909 && (row * 40 + col) <= 938) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 940 && (row * 40 + col) <= 945) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 947 && (row * 40 + col) <= 979) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 982 && (row * 40 + col) <= 986) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 988 && (row * 40 + col) <= 1020) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1022 && (row * 40 + col) <= 1027) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 1029 && (row * 40 + col) <= 1058) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1061 && (row * 40 + col) <= 1068) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 1070 && (row * 40 + col) <= 1098) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1101 && (row * 40 + col) <= 1108) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 1110 && (row * 40 + col) <= 1140) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1142 && (row * 40 + col) <= 1149) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 1151 && (row * 40 + col) <= 1181) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1184 && (row * 40 + col) <= 1190) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 1192 && (row * 40 + col) <= 1223) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1226 && (row * 40 + col) <= 1231) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 1233 && (row * 40 + col) <= 1265) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1267 && (row * 40 + col) <= 1271) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 1273 && (row * 40 + col) <= 1306) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1309 && (row * 40 + col) <= 1312) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 1314 && (row * 40 + col) <= 1348) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1351 && (row * 40 + col) <= 1353) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 1355 && (row * 40 + col) <= 1390) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1393 && (row * 40 + col) <= 1394) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 1396 && (row * 40 + col) <= 1432) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1434 && (row * 40 + col) <= 1435) color_data <= 12'b111111110000; else
        if ((row * 40 + col) >= 1437 && (row * 40 + col) <= 1473) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1477 && (row * 40 + col) <= 1515) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1518 && (row * 40 + col) <= 1557) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1559 && (row * 40 + col) < 1600) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule