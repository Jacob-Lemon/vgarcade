module three_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 30 && (row * 25 + col) <= 41) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 52 && (row * 25 + col) <= 68) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 76 && (row * 25 + col) <= 94) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 101 && (row * 25 + col) <= 107) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 114 && (row * 25 + col) <= 120) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 126 && (row * 25 + col) <= 129) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 141 && (row * 25 + col) <= 146) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 167 && (row * 25 + col) <= 171) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 193 && (row * 25 + col) <= 197) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 219 && (row * 25 + col) <= 222) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 244 && (row * 25 + col) <= 248) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 269 && (row * 25 + col) <= 273) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 294 && (row * 25 + col) <= 298) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 315 && (row * 25 + col) <= 322) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 336 && (row * 25 + col) <= 346) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 361 && (row * 25 + col) <= 371) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 386 && (row * 25 + col) <= 397) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 411 && (row * 25 + col) <= 422) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 444 && (row * 25 + col) <= 447) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 470 && (row * 25 + col) <= 473) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 495 && (row * 25 + col) <= 498) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 520 && (row * 25 + col) <= 523) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 544 && (row * 25 + col) <= 548) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 569 && (row * 25 + col) <= 572) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 593 && (row * 25 + col) <= 597) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 602 && (row * 25 + col) <= 603) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 616 && (row * 25 + col) <= 621) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 627 && (row * 25 + col) <= 629) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 637 && (row * 25 + col) <= 646) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 652 && (row * 25 + col) <= 670) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 677 && (row * 25 + col) <= 693) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 703 && (row * 25 + col) <= 714) color_data <= 12'b000000000000; else
        color_data <= 12'b111111111111;
    end
endmodule