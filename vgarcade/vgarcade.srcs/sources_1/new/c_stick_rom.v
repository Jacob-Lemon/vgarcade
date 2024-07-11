module c_stick_rom (
    input wire clk,
    input wire [5:0] row,
    input wire [5:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 52 + col) >= 71 && (row * 52 + col) <= 84) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 120 && (row * 52 + col) <= 139) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 170 && (row * 52 + col) <= 193) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 220 && (row * 52 + col) <= 247) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 271 && (row * 52 + col) <= 300) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 322 && (row * 52 + col) <= 353) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 373 && (row * 52 + col) <= 406) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 424 && (row * 52 + col) <= 459) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 475 && (row * 52 + col) <= 512) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 526 && (row * 52 + col) <= 565) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 577 && (row * 52 + col) <= 618) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 628 && (row * 52 + col) <= 671) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 680 && (row * 52 + col) <= 723) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 731 && (row * 52 + col) <= 776) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 783 && (row * 52 + col) <= 828) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 834 && (row * 52 + col) <= 881) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 886 && (row * 52 + col) <= 933) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 938 && (row * 52 + col) <= 985) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 989 && (row * 52 + col) <= 1038) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1041 && (row * 52 + col) <= 1090) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1093 && (row * 52 + col) <= 1142) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1145 && (row * 52 + col) <= 1194) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1197 && (row * 52 + col) <= 1246) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1249 && (row * 52 + col) <= 1298) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1301 && (row * 52 + col) <= 1350) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1353 && (row * 52 + col) <= 1402) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1405 && (row * 52 + col) <= 1454) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1457 && (row * 52 + col) <= 1506) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1509 && (row * 52 + col) <= 1558) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1561 && (row * 52 + col) <= 1610) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1613 && (row * 52 + col) <= 1662) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1665 && (row * 52 + col) <= 1714) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1718 && (row * 52 + col) <= 1765) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1770 && (row * 52 + col) <= 1817) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1822 && (row * 52 + col) <= 1869) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1875 && (row * 52 + col) <= 1920) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1927 && (row * 52 + col) <= 1972) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1980 && (row * 52 + col) <= 2023) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2032 && (row * 52 + col) <= 2075) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2085 && (row * 52 + col) <= 2126) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2138 && (row * 52 + col) <= 2177) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2191 && (row * 52 + col) <= 2228) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2244 && (row * 52 + col) <= 2280) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2297 && (row * 52 + col) <= 2331) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2350 && (row * 52 + col) <= 2381) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2403 && (row * 52 + col) <= 2432) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2456 && (row * 52 + col) <= 2483) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2510 && (row * 52 + col) <= 2533) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2564 && (row * 52 + col) <= 2583) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2619 && (row * 52 + col) <= 2632) color_data <= 12'b111111100011; else
        color_data <= 12'b000000000000;
    end
endmodule