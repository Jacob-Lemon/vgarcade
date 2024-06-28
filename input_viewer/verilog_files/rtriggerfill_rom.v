`timescale 1ns / 1ps
module rtriggerfill_rom (
    input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 0 && (row * 584 + col) <= 1949) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 1950 && (row * 584 + col) <= 1992) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 1993 && (row * 584 + col) <= 2516) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 2517 && (row * 584 + col) <= 2592) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 2593 && (row * 584 + col) <= 3091) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 3092 && (row * 584 + col) <= 3185) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 3186 && (row * 584 + col) <= 3668) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 3669 && (row * 584 + col) <= 3776) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 3777 && (row * 584 + col) <= 4246) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 4247 && (row * 584 + col) <= 4366) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 4367 && (row * 584 + col) <= 4828) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 4829 && (row * 584 + col) <= 4952) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 4953 && (row * 584 + col) <= 5409) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 5410 && (row * 584 + col) <= 5539) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 5540 && (row * 584 + col) <= 5992) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 5993 && (row * 584 + col) <= 6125) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 6126 && (row * 584 + col) <= 6575) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 6576 && (row * 584 + col) <= 6709) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 6710 && (row * 584 + col) <= 7158) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 7159 && (row * 584 + col) <= 7294) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 7295 && (row * 584 + col) <= 7742) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 7743 && (row * 584 + col) <= 7878) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 7879 && (row * 584 + col) <= 8326) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 8327 && (row * 584 + col) <= 8462) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 8463 && (row * 584 + col) <= 8911) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 8912 && (row * 584 + col) <= 9045) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 9046 && (row * 584 + col) <= 9495) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 9496 && (row * 584 + col) <= 9629) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 9630 && (row * 584 + col) <= 10081) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 10082 && (row * 584 + col) <= 10211) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 10212 && (row * 584 + col) <= 10667) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 10668 && (row * 584 + col) <= 10793) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 10794 && (row * 584 + col) <= 11254) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 11255 && (row * 584 + col) <= 11374) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 11375 && (row * 584 + col) <= 11843) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 11844 && (row * 584 + col) <= 11953) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 11954 && (row * 584 + col) <= 12434) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 12435 && (row * 584 + col) <= 12530) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 12531 && (row * 584 + col) <= 13028) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 13029 && (row * 584 + col) <= 13104) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 13105 && (row * 584 + col) <= 13628) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 13629 && (row * 584 + col) <= 13672) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 13673 && (row * 584 + col) < 97528) color_data <= 12'b000000000000; else
        color_data <= 12'b000000000000;
    end
endmodule
