module nine_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 35 && (row * 25 + col) <= 39) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 58 && (row * 25 + col) <= 65) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 81 && (row * 25 + col) <= 92) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 106 && (row * 25 + col) <= 109) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 114 && (row * 25 + col) <= 119) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 130 && (row * 25 + col) <= 133) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 140 && (row * 25 + col) <= 144) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 155 && (row * 25 + col) <= 157) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 166 && (row * 25 + col) <= 169) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 179 && (row * 25 + col) <= 181) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 192 && (row * 25 + col) <= 194) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 204 && (row * 25 + col) <= 206) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 217 && (row * 25 + col) <= 219) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 229 && (row * 25 + col) <= 231) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 242 && (row * 25 + col) <= 244) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 254 && (row * 25 + col) <= 256) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 267 && (row * 25 + col) <= 269) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 279 && (row * 25 + col) <= 282) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 291 && (row * 25 + col) <= 294) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 305 && (row * 25 + col) <= 307) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 316 && (row * 25 + col) <= 319) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 331 && (row * 25 + col) <= 334) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 339 && (row * 25 + col) <= 344) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 356 && (row * 25 + col) <= 369) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 383 && (row * 25 + col) <= 394) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 409 && (row * 25 + col) <= 414) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 417 && (row * 25 + col) <= 419) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 442 && (row * 25 + col) <= 444) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 467 && (row * 25 + col) <= 469) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 492 && (row * 25 + col) <= 494) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 517 && (row * 25 + col) <= 519) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 542 && (row * 25 + col) <= 544) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 567 && (row * 25 + col) <= 569) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 592 && (row * 25 + col) <= 594) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 617 && (row * 25 + col) <= 619) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 642 && (row * 25 + col) <= 644) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 667 && (row * 25 + col) <= 669) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 692 && (row * 25 + col) <= 694) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 717 && (row * 25 + col) <= 719) color_data <= 12'b000000000000; else
        color_data <= 12'b111111111111;
    end
endmodule