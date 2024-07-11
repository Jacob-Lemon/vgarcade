module five_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 26 && (row * 25 + col) <= 47) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 51 && (row * 25 + col) <= 72) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 76 && (row * 25 + col) <= 97) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 101 && (row * 25 + col) <= 103) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 126 && (row * 25 + col) <= 128) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 151 && (row * 25 + col) <= 153) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 176 && (row * 25 + col) <= 178) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 201 && (row * 25 + col) <= 203) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 226 && (row * 25 + col) <= 228) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 251 && (row * 25 + col) <= 253) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 276 && (row * 25 + col) <= 287) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 301 && (row * 25 + col) <= 315) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 326 && (row * 25 + col) <= 343) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 360 && (row * 25 + col) <= 369) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 388 && (row * 25 + col) <= 395) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 416 && (row * 25 + col) <= 421) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 442 && (row * 25 + col) <= 446) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 468 && (row * 25 + col) <= 472) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 494 && (row * 25 + col) <= 497) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 519 && (row * 25 + col) <= 522) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 544 && (row * 25 + col) <= 547) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 569 && (row * 25 + col) <= 572) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 594 && (row * 25 + col) <= 597) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 618 && (row * 25 + col) <= 622) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 638 && (row * 25 + col) <= 647) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 651 && (row * 25 + col) <= 671) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 676 && (row * 25 + col) <= 695) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 701 && (row * 25 + col) <= 715) color_data <= 12'b000000000000; else
        color_data <= 12'b111111111111;
    end
endmodule