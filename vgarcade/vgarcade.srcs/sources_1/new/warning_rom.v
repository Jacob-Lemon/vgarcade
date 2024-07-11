module warning_rom (
    input wire clk,
    input wire [5:0] row,
    input wire [5:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 50 + col) >= 0 && (row * 50 + col) <= 374) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 376 && (row * 50 + col) <= 423) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 427 && (row * 50 + col) <= 473) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 475 && (row * 50 + col) <= 475) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 477 && (row * 50 + col) <= 522) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 524 && (row * 50 + col) <= 526) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 528 && (row * 50 + col) <= 572) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 574 && (row * 50 + col) <= 576) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 578 && (row * 50 + col) <= 621) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 623 && (row * 50 + col) <= 627) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 629 && (row * 50 + col) <= 670) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 672 && (row * 50 + col) <= 678) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 680 && (row * 50 + col) <= 720) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 722 && (row * 50 + col) <= 728) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 730 && (row * 50 + col) <= 769) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 771 && (row * 50 + col) <= 779) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 781 && (row * 50 + col) <= 818) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 820 && (row * 50 + col) <= 830) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 832 && (row * 50 + col) <= 868) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 870 && (row * 50 + col) <= 873) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 877 && (row * 50 + col) <= 880) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 882 && (row * 50 + col) <= 917) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 919 && (row * 50 + col) <= 923) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 927 && (row * 50 + col) <= 931) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 933 && (row * 50 + col) <= 967) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 969 && (row * 50 + col) <= 973) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 977 && (row * 50 + col) <= 981) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 983 && (row * 50 + col) <= 1016) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1018 && (row * 50 + col) <= 1023) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1027 && (row * 50 + col) <= 1032) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1034 && (row * 50 + col) <= 1065) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1067 && (row * 50 + col) <= 1073) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1077 && (row * 50 + col) <= 1083) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1085 && (row * 50 + col) <= 1115) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1117 && (row * 50 + col) <= 1123) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1127 && (row * 50 + col) <= 1133) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1135 && (row * 50 + col) <= 1164) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1166 && (row * 50 + col) <= 1173) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1177 && (row * 50 + col) <= 1184) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1186 && (row * 50 + col) <= 1213) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1215 && (row * 50 + col) <= 1223) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1227 && (row * 50 + col) <= 1235) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1237 && (row * 50 + col) <= 1263) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1265 && (row * 50 + col) <= 1273) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1277 && (row * 50 + col) <= 1285) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1287 && (row * 50 + col) <= 1312) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1314 && (row * 50 + col) <= 1323) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1327 && (row * 50 + col) <= 1336) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1338 && (row * 50 + col) <= 1362) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1364 && (row * 50 + col) <= 1373) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1377 && (row * 50 + col) <= 1386) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1388 && (row * 50 + col) <= 1411) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1413 && (row * 50 + col) <= 1423) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1427 && (row * 50 + col) <= 1437) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1439 && (row * 50 + col) <= 1460) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1462 && (row * 50 + col) <= 1473) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1477 && (row * 50 + col) <= 1488) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1490 && (row * 50 + col) <= 1510) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1512 && (row * 50 + col) <= 1523) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1527 && (row * 50 + col) <= 1538) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1540 && (row * 50 + col) <= 1559) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1561 && (row * 50 + col) <= 1573) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1577 && (row * 50 + col) <= 1589) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1591 && (row * 50 + col) <= 1608) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1610 && (row * 50 + col) <= 1623) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1627 && (row * 50 + col) <= 1640) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1642 && (row * 50 + col) <= 1658) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1660 && (row * 50 + col) <= 1673) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1677 && (row * 50 + col) <= 1690) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1692 && (row * 50 + col) <= 1707) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1709 && (row * 50 + col) <= 1723) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1727 && (row * 50 + col) <= 1741) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1743 && (row * 50 + col) <= 1757) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1759 && (row * 50 + col) <= 1791) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1793 && (row * 50 + col) <= 1806) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1808 && (row * 50 + col) <= 1842) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1844 && (row * 50 + col) <= 1855) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1857 && (row * 50 + col) <= 1893) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1895 && (row * 50 + col) <= 1905) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1907 && (row * 50 + col) <= 1923) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1927 && (row * 50 + col) <= 1943) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1945 && (row * 50 + col) <= 1954) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1956 && (row * 50 + col) <= 1973) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1977 && (row * 50 + col) <= 1994) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1996 && (row * 50 + col) <= 2003) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2005 && (row * 50 + col) <= 2023) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2027 && (row * 50 + col) <= 2045) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2047 && (row * 50 + col) <= 2053) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2055 && (row * 50 + col) <= 2095) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2097 && (row * 50 + col) <= 2102) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2104 && (row * 50 + col) <= 2146) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2148 && (row * 50 + col) <= 2152) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2154 && (row * 50 + col) <= 2196) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2198 && (row * 50 + col) <= 2201) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2249 && (row * 50 + col) < 2500) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule