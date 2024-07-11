module rfill_rom (
    input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 1950 && (row * 584 + col) <= 1992) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 2517 && (row * 584 + col) <= 2592) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 3092 && (row * 584 + col) <= 3185) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 3669 && (row * 584 + col) <= 3776) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 4247 && (row * 584 + col) <= 4366) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 4829 && (row * 584 + col) <= 4952) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 5410 && (row * 584 + col) <= 5539) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 5993 && (row * 584 + col) <= 6125) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 6576 && (row * 584 + col) <= 6709) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 7159 && (row * 584 + col) <= 7294) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 7743 && (row * 584 + col) <= 7878) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 8327 && (row * 584 + col) <= 8462) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 8912 && (row * 584 + col) <= 9045) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 9496 && (row * 584 + col) <= 9629) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 10082 && (row * 584 + col) <= 10211) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 10668 && (row * 584 + col) <= 10793) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 11255 && (row * 584 + col) <= 11374) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 11844 && (row * 584 + col) <= 11953) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 12435 && (row * 584 + col) <= 12530) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 13029 && (row * 584 + col) <= 13104) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 13629 && (row * 584 + col) <= 13672) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule