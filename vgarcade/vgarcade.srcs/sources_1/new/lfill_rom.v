module lfill_rom (
	input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 637 && (row * 584 + col) <= 673) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 1206 && (row * 584 + col) <= 1271) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 1781 && (row * 584 + col) <= 1864) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 2358 && (row * 584 + col) <= 2455) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 2937 && (row * 584 + col) <= 3044) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 3517 && (row * 584 + col) <= 3632) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 4098 && (row * 584 + col) <= 4219) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 4680 && (row * 584 + col) <= 4805) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 5262 && (row * 584 + col) <= 5391) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 5845 && (row * 584 + col) <= 5976) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 6429 && (row * 584 + col) <= 6560) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 7012 && (row * 584 + col) <= 7145) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 7596 && (row * 584 + col) <= 7729) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 8180 && (row * 584 + col) <= 8313) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 8765 && (row * 584 + col) <= 8896) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 9349 && (row * 584 + col) <= 9480) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 9934 && (row * 584 + col) <= 10063) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 10520 && (row * 584 + col) <= 10645) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 11106 && (row * 584 + col) <= 11227) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 11693 && (row * 584 + col) <= 11808) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 12281 && (row * 584 + col) <= 12388) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 12870 && (row * 584 + col) <= 12967) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 13460 && (row * 584 + col) <= 13545) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 14053 && (row * 584 + col) <= 14120) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 14651 && (row * 584 + col) <= 14690) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule