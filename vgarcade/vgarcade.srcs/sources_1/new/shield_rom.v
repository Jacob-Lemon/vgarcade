module shield_rom (
    input wire clk,
    input wire [5:0] row,
    input wire [5:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 40 + col) >= 0 && (row * 40 + col) <= 98) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 100 && (row * 40 + col) <= 136) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 139 && (row * 40 + col) <= 139) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 142 && (row * 40 + col) <= 174) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 177 && (row * 40 + col) <= 181) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 184 && (row * 40 + col) <= 212) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 215 && (row * 40 + col) <= 218) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 220 && (row * 40 + col) <= 223) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 226 && (row * 40 + col) <= 250) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 253 && (row * 40 + col) <= 265) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 268 && (row * 40 + col) <= 288) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 291 && (row * 40 + col) <= 307) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 310 && (row * 40 + col) <= 326) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 329 && (row * 40 + col) <= 349) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 352 && (row * 40 + col) <= 364) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 367 && (row * 40 + col) <= 391) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 394 && (row * 40 + col) <= 402) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 405 && (row * 40 + col) <= 433) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 436 && (row * 40 + col) <= 441) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 443 && (row * 40 + col) <= 475) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 477 && (row * 40 + col) <= 481) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 483 && (row * 40 + col) <= 483) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 485 && (row * 40 + col) <= 493) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 494 && (row * 40 + col) <= 496) color_data <= 12'b111011101110; else
        if ((row * 40 + col) >= 497 && (row * 40 + col) <= 513) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 515 && (row * 40 + col) <= 515) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 517 && (row * 40 + col) <= 521) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 523 && (row * 40 + col) <= 531) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 532 && (row * 40 + col) <= 535) color_data <= 12'b111011101110; else
        if ((row * 40 + col) >= 536 && (row * 40 + col) <= 555) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 557 && (row * 40 + col) <= 561) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 563 && (row * 40 + col) <= 569) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 570 && (row * 40 + col) <= 574) color_data <= 12'b111011101110; else
        if ((row * 40 + col) >= 575 && (row * 40 + col) <= 595) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 597 && (row * 40 + col) <= 601) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 603 && (row * 40 + col) <= 608) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 609 && (row * 40 + col) <= 613) color_data <= 12'b111011101110; else
        if ((row * 40 + col) >= 614 && (row * 40 + col) <= 635) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 637 && (row * 40 + col) <= 641) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 643 && (row * 40 + col) <= 648) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 649 && (row * 40 + col) <= 652) color_data <= 12'b111011101110; else
        if ((row * 40 + col) >= 653 && (row * 40 + col) <= 675) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 677 && (row * 40 + col) <= 681) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 683 && (row * 40 + col) <= 687) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 688 && (row * 40 + col) <= 691) color_data <= 12'b111011101110; else
        if ((row * 40 + col) >= 692 && (row * 40 + col) <= 715) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 717 && (row * 40 + col) <= 721) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 723 && (row * 40 + col) <= 727) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 728 && (row * 40 + col) <= 730) color_data <= 12'b111011101110; else
        if ((row * 40 + col) >= 731 && (row * 40 + col) <= 755) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 757 && (row * 40 + col) <= 761) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 763 && (row * 40 + col) <= 766) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 767 && (row * 40 + col) <= 769) color_data <= 12'b111011101110; else
        if ((row * 40 + col) >= 770 && (row * 40 + col) <= 795) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 797 && (row * 40 + col) <= 801) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 803 && (row * 40 + col) <= 806) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 807 && (row * 40 + col) <= 808) color_data <= 12'b111011101110; else
        if ((row * 40 + col) >= 809 && (row * 40 + col) <= 835) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 837 && (row * 40 + col) <= 841) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 843 && (row * 40 + col) <= 846) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 847 && (row * 40 + col) <= 847) color_data <= 12'b111011101110; else
        if ((row * 40 + col) >= 848 && (row * 40 + col) <= 875) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 877 && (row * 40 + col) <= 881) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 883 && (row * 40 + col) <= 915) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 917 && (row * 40 + col) <= 921) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 923 && (row * 40 + col) <= 955) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 957 && (row * 40 + col) <= 961) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 963 && (row * 40 + col) <= 995) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 997 && (row * 40 + col) <= 1001) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1003 && (row * 40 + col) <= 1035) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1037 && (row * 40 + col) <= 1041) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1043 && (row * 40 + col) <= 1075) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1077 && (row * 40 + col) <= 1081) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1083 && (row * 40 + col) <= 1115) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1117 && (row * 40 + col) <= 1121) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1123 && (row * 40 + col) <= 1123) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1125 && (row * 40 + col) <= 1153) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1155 && (row * 40 + col) <= 1155) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1157 && (row * 40 + col) <= 1161) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1163 && (row * 40 + col) <= 1195) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1197 && (row * 40 + col) <= 1202) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1205 && (row * 40 + col) <= 1233) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1236 && (row * 40 + col) <= 1244) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1247 && (row * 40 + col) <= 1271) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1274 && (row * 40 + col) <= 1286) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1289 && (row * 40 + col) <= 1309) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1312 && (row * 40 + col) <= 1328) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1331 && (row * 40 + col) <= 1347) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1350 && (row * 40 + col) <= 1370) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1373 && (row * 40 + col) <= 1385) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1388 && (row * 40 + col) <= 1412) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1415 && (row * 40 + col) <= 1418) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1420 && (row * 40 + col) <= 1423) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1426 && (row * 40 + col) <= 1454) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1457 && (row * 40 + col) <= 1461) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1464 && (row * 40 + col) <= 1496) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1499 && (row * 40 + col) <= 1499) color_data <= 12'b110011001100; else
        if ((row * 40 + col) >= 1502 && (row * 40 + col) <= 1538) color_data <= 12'b111111111111; else
        if ((row * 40 + col) >= 1540 && (row * 40 + col) < 1600) color_data <= 12'b111111111111; else
        color_data <= 12'b011101110111;
    end
endmodule