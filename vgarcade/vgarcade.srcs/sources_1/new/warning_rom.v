`timescale 1ns / 1ps
module warning_rom (
    input wire clk,
    input wire [5:0] row,
    input wire [5:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 50 + col) >= 0 && (row * 50 + col) <= 223) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 224 && (row * 50 + col) <= 224) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 225 && (row * 50 + col) <= 273) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 274 && (row * 50 + col) <= 275) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 276 && (row * 50 + col) <= 322) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 323 && (row * 50 + col) <= 323) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 324 && (row * 50 + col) <= 325) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 326 && (row * 50 + col) <= 326) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 327 && (row * 50 + col) <= 372) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 373 && (row * 50 + col) <= 373) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 374 && (row * 50 + col) <= 375) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 376 && (row * 50 + col) <= 376) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 377 && (row * 50 + col) <= 421) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 422 && (row * 50 + col) <= 422) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 423 && (row * 50 + col) <= 426) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 427 && (row * 50 + col) <= 427) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 428 && (row * 50 + col) <= 471) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 472 && (row * 50 + col) <= 472) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 473 && (row * 50 + col) <= 476) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 477 && (row * 50 + col) <= 477) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 478 && (row * 50 + col) <= 520) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 521 && (row * 50 + col) <= 521) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 522 && (row * 50 + col) <= 527) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 528 && (row * 50 + col) <= 528) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 529 && (row * 50 + col) <= 570) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 571 && (row * 50 + col) <= 571) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 572 && (row * 50 + col) <= 577) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 578 && (row * 50 + col) <= 578) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 579 && (row * 50 + col) <= 619) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 620 && (row * 50 + col) <= 620) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 621 && (row * 50 + col) <= 628) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 629 && (row * 50 + col) <= 629) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 630 && (row * 50 + col) <= 669) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 670 && (row * 50 + col) <= 670) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 671 && (row * 50 + col) <= 672) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 673 && (row * 50 + col) <= 675) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 676 && (row * 50 + col) <= 678) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 679 && (row * 50 + col) <= 679) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 680 && (row * 50 + col) <= 718) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 719 && (row * 50 + col) <= 719) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 720 && (row * 50 + col) <= 722) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 723 && (row * 50 + col) <= 725) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 726 && (row * 50 + col) <= 729) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 730 && (row * 50 + col) <= 730) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 731 && (row * 50 + col) <= 767) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 768 && (row * 50 + col) <= 768) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 769 && (row * 50 + col) <= 772) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 773 && (row * 50 + col) <= 775) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 776 && (row * 50 + col) <= 780) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 781 && (row * 50 + col) <= 781) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 782 && (row * 50 + col) <= 817) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 818 && (row * 50 + col) <= 818) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 819 && (row * 50 + col) <= 822) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 823 && (row * 50 + col) <= 825) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 826 && (row * 50 + col) <= 830) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 831 && (row * 50 + col) <= 831) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 832 && (row * 50 + col) <= 866) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 867 && (row * 50 + col) <= 867) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 868 && (row * 50 + col) <= 872) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 873 && (row * 50 + col) <= 875) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 876 && (row * 50 + col) <= 881) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 882 && (row * 50 + col) <= 882) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 883 && (row * 50 + col) <= 916) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 917 && (row * 50 + col) <= 917) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 918 && (row * 50 + col) <= 922) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 923 && (row * 50 + col) <= 925) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 926 && (row * 50 + col) <= 931) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 932 && (row * 50 + col) <= 932) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 933 && (row * 50 + col) <= 965) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 966 && (row * 50 + col) <= 966) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 967 && (row * 50 + col) <= 972) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 973 && (row * 50 + col) <= 975) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 976 && (row * 50 + col) <= 982) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 983 && (row * 50 + col) <= 983) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 984 && (row * 50 + col) <= 1015) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1016 && (row * 50 + col) <= 1016) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1017 && (row * 50 + col) <= 1022) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1023 && (row * 50 + col) <= 1025) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1026 && (row * 50 + col) <= 1032) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1033 && (row * 50 + col) <= 1033) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1034 && (row * 50 + col) <= 1064) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1065 && (row * 50 + col) <= 1065) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1066 && (row * 50 + col) <= 1072) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1073 && (row * 50 + col) <= 1075) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1076 && (row * 50 + col) <= 1083) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1084 && (row * 50 + col) <= 1084) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1085 && (row * 50 + col) <= 1114) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1115 && (row * 50 + col) <= 1115) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1116 && (row * 50 + col) <= 1122) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1123 && (row * 50 + col) <= 1125) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1126 && (row * 50 + col) <= 1133) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1134 && (row * 50 + col) <= 1134) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1135 && (row * 50 + col) <= 1163) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1164 && (row * 50 + col) <= 1164) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1165 && (row * 50 + col) <= 1172) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1173 && (row * 50 + col) <= 1175) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1176 && (row * 50 + col) <= 1184) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1185 && (row * 50 + col) <= 1185) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1186 && (row * 50 + col) <= 1213) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1214 && (row * 50 + col) <= 1214) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1215 && (row * 50 + col) <= 1222) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1223 && (row * 50 + col) <= 1225) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1226 && (row * 50 + col) <= 1234) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1235 && (row * 50 + col) <= 1235) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1236 && (row * 50 + col) <= 1262) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1263 && (row * 50 + col) <= 1263) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1264 && (row * 50 + col) <= 1272) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1273 && (row * 50 + col) <= 1275) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1276 && (row * 50 + col) <= 1285) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1286 && (row * 50 + col) <= 1286) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1287 && (row * 50 + col) <= 1311) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1312 && (row * 50 + col) <= 1312) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1313 && (row * 50 + col) <= 1322) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1323 && (row * 50 + col) <= 1325) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1326 && (row * 50 + col) <= 1336) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1337 && (row * 50 + col) <= 1337) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1338 && (row * 50 + col) <= 1361) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1362 && (row * 50 + col) <= 1362) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1363 && (row * 50 + col) <= 1372) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1373 && (row * 50 + col) <= 1375) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1376 && (row * 50 + col) <= 1386) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1387 && (row * 50 + col) <= 1387) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1388 && (row * 50 + col) <= 1410) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1411 && (row * 50 + col) <= 1411) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1412 && (row * 50 + col) <= 1422) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1423 && (row * 50 + col) <= 1425) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1426 && (row * 50 + col) <= 1437) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1438 && (row * 50 + col) <= 1438) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1439 && (row * 50 + col) <= 1460) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1461 && (row * 50 + col) <= 1461) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1462 && (row * 50 + col) <= 1472) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1473 && (row * 50 + col) <= 1475) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1476 && (row * 50 + col) <= 1487) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1488 && (row * 50 + col) <= 1488) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1489 && (row * 50 + col) <= 1509) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1510 && (row * 50 + col) <= 1510) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1511 && (row * 50 + col) <= 1522) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1523 && (row * 50 + col) <= 1525) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1526 && (row * 50 + col) <= 1538) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1539 && (row * 50 + col) <= 1539) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1540 && (row * 50 + col) <= 1559) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1560 && (row * 50 + col) <= 1560) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1561 && (row * 50 + col) <= 1572) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1573 && (row * 50 + col) <= 1575) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1576 && (row * 50 + col) <= 1588) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1589 && (row * 50 + col) <= 1589) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1590 && (row * 50 + col) <= 1608) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1609 && (row * 50 + col) <= 1609) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1610 && (row * 50 + col) <= 1622) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1623 && (row * 50 + col) <= 1625) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1626 && (row * 50 + col) <= 1639) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1640 && (row * 50 + col) <= 1640) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1641 && (row * 50 + col) <= 1658) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1659 && (row * 50 + col) <= 1659) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1660 && (row * 50 + col) <= 1672) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1673 && (row * 50 + col) <= 1675) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1676 && (row * 50 + col) <= 1689) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1690 && (row * 50 + col) <= 1690) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1691 && (row * 50 + col) <= 1707) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1708 && (row * 50 + col) <= 1708) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1709 && (row * 50 + col) <= 1722) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1723 && (row * 50 + col) <= 1725) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1726 && (row * 50 + col) <= 1740) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1741 && (row * 50 + col) <= 1741) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1742 && (row * 50 + col) <= 1757) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1758 && (row * 50 + col) <= 1758) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1759 && (row * 50 + col) <= 1772) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1773 && (row * 50 + col) <= 1775) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1776 && (row * 50 + col) <= 1790) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1791 && (row * 50 + col) <= 1791) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1792 && (row * 50 + col) <= 1806) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1807 && (row * 50 + col) <= 1807) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1808 && (row * 50 + col) <= 1822) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1823 && (row * 50 + col) <= 1825) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1826 && (row * 50 + col) <= 1841) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1842 && (row * 50 + col) <= 1842) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1843 && (row * 50 + col) <= 1855) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1856 && (row * 50 + col) <= 1856) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1857 && (row * 50 + col) <= 1892) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1893 && (row * 50 + col) <= 1893) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1894 && (row * 50 + col) <= 1905) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1906 && (row * 50 + col) <= 1906) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1907 && (row * 50 + col) <= 1942) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1943 && (row * 50 + col) <= 1943) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1944 && (row * 50 + col) <= 1954) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 1955 && (row * 50 + col) <= 1955) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1956 && (row * 50 + col) <= 1993) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 1994 && (row * 50 + col) <= 1994) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 1995 && (row * 50 + col) <= 2004) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2005 && (row * 50 + col) <= 2005) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2006 && (row * 50 + col) <= 2043) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2044 && (row * 50 + col) <= 2044) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2045 && (row * 50 + col) <= 2053) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2054 && (row * 50 + col) <= 2054) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2055 && (row * 50 + col) <= 2072) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2073 && (row * 50 + col) <= 2075) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2076 && (row * 50 + col) <= 2094) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2095 && (row * 50 + col) <= 2095) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2096 && (row * 50 + col) <= 2103) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2104 && (row * 50 + col) <= 2104) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2105 && (row * 50 + col) <= 2121) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2122 && (row * 50 + col) <= 2126) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2127 && (row * 50 + col) <= 2144) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2145 && (row * 50 + col) <= 2145) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2146 && (row * 50 + col) <= 2152) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2153 && (row * 50 + col) <= 2153) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2154 && (row * 50 + col) <= 2171) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2172 && (row * 50 + col) <= 2176) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2177 && (row * 50 + col) <= 2195) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2196 && (row * 50 + col) <= 2196) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2197 && (row * 50 + col) <= 2202) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2203 && (row * 50 + col) <= 2203) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2204 && (row * 50 + col) <= 2221) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2222 && (row * 50 + col) <= 2226) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2227 && (row * 50 + col) <= 2245) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2246 && (row * 50 + col) <= 2246) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2247 && (row * 50 + col) <= 2251) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2252 && (row * 50 + col) <= 2252) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2253 && (row * 50 + col) <= 2272) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2273 && (row * 50 + col) <= 2275) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2276 && (row * 50 + col) <= 2296) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2297 && (row * 50 + col) <= 2297) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2298 && (row * 50 + col) <= 2301) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2302 && (row * 50 + col) <= 2302) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2303 && (row * 50 + col) <= 2346) color_data <= 12'b111111110000; else
        if ((row * 50 + col) >= 2347 && (row * 50 + col) <= 2347) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2348 && (row * 50 + col) <= 2350) color_data <= 12'b111111111111; else
        if ((row * 50 + col) >= 2351 && (row * 50 + col) <= 2398) color_data <= 12'b000000000000; else
        if ((row * 50 + col) >= 2399 && (row * 50 + col) < 2500) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule