module c_stick_rom (
    input wire clk,
    input wire [5:0] row,
    input wire [5:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 52 + col) >= 0 && (row * 52 + col) <= 70) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 71 && (row * 52 + col) <= 84) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 85 && (row * 52 + col) <= 119) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 120 && (row * 52 + col) <= 139) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 140 && (row * 52 + col) <= 169) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 170 && (row * 52 + col) <= 193) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 194 && (row * 52 + col) <= 219) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 220 && (row * 52 + col) <= 247) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 248 && (row * 52 + col) <= 270) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 271 && (row * 52 + col) <= 300) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 301 && (row * 52 + col) <= 321) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 322 && (row * 52 + col) <= 353) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 354 && (row * 52 + col) <= 372) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 373 && (row * 52 + col) <= 406) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 407 && (row * 52 + col) <= 423) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 424 && (row * 52 + col) <= 459) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 460 && (row * 52 + col) <= 474) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 475 && (row * 52 + col) <= 512) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 513 && (row * 52 + col) <= 525) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 526 && (row * 52 + col) <= 565) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 566 && (row * 52 + col) <= 576) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 577 && (row * 52 + col) <= 618) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 619 && (row * 52 + col) <= 627) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 628 && (row * 52 + col) <= 671) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 672 && (row * 52 + col) <= 679) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 680 && (row * 52 + col) <= 723) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 724 && (row * 52 + col) <= 730) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 731 && (row * 52 + col) <= 776) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 777 && (row * 52 + col) <= 782) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 783 && (row * 52 + col) <= 828) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 829 && (row * 52 + col) <= 833) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 834 && (row * 52 + col) <= 881) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 882 && (row * 52 + col) <= 885) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 886 && (row * 52 + col) <= 933) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 934 && (row * 52 + col) <= 937) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 938 && (row * 52 + col) <= 985) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 986 && (row * 52 + col) <= 988) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 989 && (row * 52 + col) <= 1038) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1039 && (row * 52 + col) <= 1040) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1041 && (row * 52 + col) <= 1090) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1091 && (row * 52 + col) <= 1092) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1093 && (row * 52 + col) <= 1142) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1143 && (row * 52 + col) <= 1144) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1145 && (row * 52 + col) <= 1194) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1195 && (row * 52 + col) <= 1196) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1197 && (row * 52 + col) <= 1246) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1247 && (row * 52 + col) <= 1248) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1249 && (row * 52 + col) <= 1298) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1299 && (row * 52 + col) <= 1300) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1301 && (row * 52 + col) <= 1350) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1351 && (row * 52 + col) <= 1352) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1353 && (row * 52 + col) <= 1402) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1403 && (row * 52 + col) <= 1404) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1405 && (row * 52 + col) <= 1454) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1455 && (row * 52 + col) <= 1456) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1457 && (row * 52 + col) <= 1506) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1507 && (row * 52 + col) <= 1508) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1509 && (row * 52 + col) <= 1558) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1559 && (row * 52 + col) <= 1560) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1561 && (row * 52 + col) <= 1610) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1611 && (row * 52 + col) <= 1612) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1613 && (row * 52 + col) <= 1662) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1663 && (row * 52 + col) <= 1664) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1665 && (row * 52 + col) <= 1714) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1715 && (row * 52 + col) <= 1717) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1718 && (row * 52 + col) <= 1765) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1766 && (row * 52 + col) <= 1769) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1770 && (row * 52 + col) <= 1817) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1818 && (row * 52 + col) <= 1821) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1822 && (row * 52 + col) <= 1869) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1870 && (row * 52 + col) <= 1874) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1875 && (row * 52 + col) <= 1920) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1921 && (row * 52 + col) <= 1926) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1927 && (row * 52 + col) <= 1972) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 1973 && (row * 52 + col) <= 1979) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 1980 && (row * 52 + col) <= 2023) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2024 && (row * 52 + col) <= 2031) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 2032 && (row * 52 + col) <= 2075) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2076 && (row * 52 + col) <= 2084) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 2085 && (row * 52 + col) <= 2126) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2127 && (row * 52 + col) <= 2137) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 2138 && (row * 52 + col) <= 2177) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2178 && (row * 52 + col) <= 2190) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 2191 && (row * 52 + col) <= 2228) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2229 && (row * 52 + col) <= 2243) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 2244 && (row * 52 + col) <= 2280) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2281 && (row * 52 + col) <= 2296) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 2297 && (row * 52 + col) <= 2331) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2332 && (row * 52 + col) <= 2349) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 2350 && (row * 52 + col) <= 2381) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2382 && (row * 52 + col) <= 2402) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 2403 && (row * 52 + col) <= 2432) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2433 && (row * 52 + col) <= 2455) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 2456 && (row * 52 + col) <= 2483) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2484 && (row * 52 + col) <= 2509) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 2510 && (row * 52 + col) <= 2533) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2534 && (row * 52 + col) <= 2563) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 2564 && (row * 52 + col) <= 2583) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2584 && (row * 52 + col) <= 2618) color_data <= 12'b000000000000; else
        if ((row * 52 + col) >= 2619 && (row * 52 + col) <= 2632) color_data <= 12'b111111100011; else
        if ((row * 52 + col) >= 2633 && (row * 52 + col) < 2704) color_data <= 12'b000000000000; else
        color_data <= 12'b000000000000;
    end
endmodule
