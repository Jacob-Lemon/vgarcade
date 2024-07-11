module warning_rom (
	input wire clk,
    input wire [5:0] row,
    input wire [5:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 50 + col) >= 0 && (row * 50 + col) <= 424) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 426 && (row * 50 + col) <= 473) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 477 && (row * 50 + col) <= 522) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 528 && (row * 50 + col) <= 571) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 575 && (row * 50 + col) <= 575) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 579 && (row * 50 + col) <= 621) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 624 && (row * 50 + col) <= 626) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 629 && (row * 50 + col) <= 670) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 674 && (row * 50 + col) <= 676) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 680 && (row * 50 + col) <= 720) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 723 && (row * 50 + col) <= 727) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 730 && (row * 50 + col) <= 769) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 773 && (row * 50 + col) <= 777) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 781 && (row * 50 + col) <= 818) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 822 && (row * 50 + col) <= 828) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 832 && (row * 50 + col) <= 868) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 871 && (row * 50 + col) <= 879) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 882 && (row * 50 + col) <= 917) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 921 && (row * 50 + col) <= 923) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 927 && (row * 50 + col) <= 929) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 933 && (row * 50 + col) <= 967) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 970 && (row * 50 + col) <= 972) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 978 && (row * 50 + col) <= 980) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 983 && (row * 50 + col) <= 1016) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1020 && (row * 50 + col) <= 1022) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1028 && (row * 50 + col) <= 1030) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1034 && (row * 50 + col) <= 1065) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1069 && (row * 50 + col) <= 1072) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1078 && (row * 50 + col) <= 1081) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1085 && (row * 50 + col) <= 1115) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1118 && (row * 50 + col) <= 1122) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1128 && (row * 50 + col) <= 1132) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1135 && (row * 50 + col) <= 1164) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1168 && (row * 50 + col) <= 1172) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1178 && (row * 50 + col) <= 1182) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1186 && (row * 50 + col) <= 1213) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1217 && (row * 50 + col) <= 1222) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1228 && (row * 50 + col) <= 1233) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1237 && (row * 50 + col) <= 1263) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1266 && (row * 50 + col) <= 1272) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1278 && (row * 50 + col) <= 1284) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1287 && (row * 50 + col) <= 1312) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1316 && (row * 50 + col) <= 1322) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1328 && (row * 50 + col) <= 1334) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1338 && (row * 50 + col) <= 1362) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1365 && (row * 50 + col) <= 1372) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1378 && (row * 50 + col) <= 1385) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1388 && (row * 50 + col) <= 1411) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1415 && (row * 50 + col) <= 1422) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1428 && (row * 50 + col) <= 1435) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1439 && (row * 50 + col) <= 1460) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1464 && (row * 50 + col) <= 1472) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1478 && (row * 50 + col) <= 1486) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1490 && (row * 50 + col) <= 1510) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1513 && (row * 50 + col) <= 1522) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1528 && (row * 50 + col) <= 1537) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1540 && (row * 50 + col) <= 1559) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1563 && (row * 50 + col) <= 1572) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1578 && (row * 50 + col) <= 1587) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1591 && (row * 50 + col) <= 1608) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1612 && (row * 50 + col) <= 1622) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1628 && (row * 50 + col) <= 1638) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1642 && (row * 50 + col) <= 1658) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1661 && (row * 50 + col) <= 1672) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1678 && (row * 50 + col) <= 1689) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1692 && (row * 50 + col) <= 1707) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1711 && (row * 50 + col) <= 1723) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1727 && (row * 50 + col) <= 1739) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1743 && (row * 50 + col) <= 1757) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1760 && (row * 50 + col) <= 1790) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1793 && (row * 50 + col) <= 1806) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1810 && (row * 50 + col) <= 1840) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1844 && (row * 50 + col) <= 1855) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1859 && (row * 50 + col) <= 1873) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1877 && (row * 50 + col) <= 1891) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1895 && (row * 50 + col) <= 1905) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1908 && (row * 50 + col) <= 1922) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1928 && (row * 50 + col) <= 1942) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1945 && (row * 50 + col) <= 1954) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1958 && (row * 50 + col) <= 1972) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1978 && (row * 50 + col) <= 1992) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1996 && (row * 50 + col) <= 2003) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2007 && (row * 50 + col) <= 2022) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2028 && (row * 50 + col) <= 2043) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2047 && (row * 50 + col) <= 2053) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2056 && (row * 50 + col) <= 2073) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2077 && (row * 50 + col) <= 2094) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2097 && (row * 50 + col) <= 2102) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2106 && (row * 50 + col) <= 2144) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2148 && (row * 50 + col) <= 2152) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2198 && (row * 50 + col) <= 2203) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2247 && (row * 50 + col) < 2500) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule