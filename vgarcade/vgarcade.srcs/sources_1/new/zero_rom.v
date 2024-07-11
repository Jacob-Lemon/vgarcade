module zero_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 35 && (row * 25 + col) <= 39) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 57 && (row * 25 + col) <= 67) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 81 && (row * 25 + col) <= 93) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 105 && (row * 25 + col) <= 109) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 115 && (row * 25 + col) <= 119) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 129 && (row * 25 + col) <= 132) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 142 && (row * 25 + col) <= 145) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 154 && (row * 25 + col) <= 156) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 168 && (row * 25 + col) <= 170) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 178 && (row * 25 + col) <= 181) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 194 && (row * 25 + col) <= 196) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 203 && (row * 25 + col) <= 205) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 219 && (row * 25 + col) <= 222) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 227 && (row * 25 + col) <= 229) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 245 && (row * 25 + col) <= 247) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 252 && (row * 25 + col) <= 254) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 270 && (row * 25 + col) <= 272) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 276 && (row * 25 + col) <= 279) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 296 && (row * 25 + col) <= 298) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 301 && (row * 25 + col) <= 303) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 321 && (row * 25 + col) <= 323) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 326 && (row * 25 + col) <= 328) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 346 && (row * 25 + col) <= 348) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 351 && (row * 25 + col) <= 353) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 371 && (row * 25 + col) <= 373) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 376 && (row * 25 + col) <= 378) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 396 && (row * 25 + col) <= 398) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 401 && (row * 25 + col) <= 403) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 421 && (row * 25 + col) <= 423) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 426 && (row * 25 + col) <= 428) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 446 && (row * 25 + col) <= 448) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 451 && (row * 25 + col) <= 454) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 471 && (row * 25 + col) <= 473) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 477 && (row * 25 + col) <= 479) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 495 && (row * 25 + col) <= 497) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 502 && (row * 25 + col) <= 504) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 520 && (row * 25 + col) <= 522) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 527 && (row * 25 + col) <= 530) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 544 && (row * 25 + col) <= 547) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 553 && (row * 25 + col) <= 555) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 569 && (row * 25 + col) <= 571) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 579 && (row * 25 + col) <= 581) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 593 && (row * 25 + col) <= 596) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 604 && (row * 25 + col) <= 607) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 617 && (row * 25 + col) <= 620) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 630 && (row * 25 + col) <= 634) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 640 && (row * 25 + col) <= 644) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 656 && (row * 25 + col) <= 668) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 682 && (row * 25 + col) <= 692) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 710 && (row * 25 + col) <= 715) color_data <= 12'b000000000000; else
        color_data <= 12'b111111111111;
    end
endmodule