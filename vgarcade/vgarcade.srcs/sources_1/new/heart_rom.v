module heart_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 54 && (row * 25 + col) <= 56) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 66 && (row * 25 + col) <= 68) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 78 && (row * 25 + col) <= 83) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 89 && (row * 25 + col) <= 94) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 102 && (row * 25 + col) <= 109) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 113 && (row * 25 + col) <= 120) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 127 && (row * 25 + col) <= 135) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 137 && (row * 25 + col) <= 145) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 151 && (row * 25 + col) <= 160) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 162 && (row * 25 + col) <= 171) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 176 && (row * 25 + col) <= 196) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 201 && (row * 25 + col) <= 221) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 226 && (row * 25 + col) <= 246) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 251 && (row * 25 + col) <= 271) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 277 && (row * 25 + col) <= 296) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 302 && (row * 25 + col) <= 320) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 327 && (row * 25 + col) <= 345) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 353 && (row * 25 + col) <= 369) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 379 && (row * 25 + col) <= 393) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 404 && (row * 25 + col) <= 418) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 430 && (row * 25 + col) <= 442) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 456 && (row * 25 + col) <= 466) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 482 && (row * 25 + col) <= 490) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 508 && (row * 25 + col) <= 514) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 534 && (row * 25 + col) <= 538) color_data <= 12'b111000010010; else
        if ((row * 25 + col) >= 560 && (row * 25 + col) <= 562) color_data <= 12'b111000010010; else
        color_data <= 12'b111111111111;
    end
endmodule