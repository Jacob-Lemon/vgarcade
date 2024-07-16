module dleftfill_rom (
	input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 63368 && (row * 584 + col) <= 63392) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 63952 && (row * 584 + col) <= 63976) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 64536 && (row * 584 + col) <= 64560) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 65120 && (row * 584 + col) <= 65144) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 65704 && (row * 584 + col) <= 65728) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 66288 && (row * 584 + col) <= 66312) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 66872 && (row * 584 + col) <= 66896) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 67456 && (row * 584 + col) <= 67480) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 68040 && (row * 584 + col) <= 68064) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 68624 && (row * 584 + col) <= 68648) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 69208 && (row * 584 + col) <= 69232) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 69792 && (row * 584 + col) <= 69816) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 70376 && (row * 584 + col) <= 70400) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 70960 && (row * 584 + col) <= 70984) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 71544 && (row * 584 + col) <= 71568) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 72128 && (row * 584 + col) <= 72152) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule