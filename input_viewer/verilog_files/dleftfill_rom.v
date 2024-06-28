`timescale 1ns / 1ps
module dleftfill_rom (
    input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 0 && (row * 584 + col) <= 63367) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 63368 && (row * 584 + col) <= 63392) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 63393 && (row * 584 + col) <= 63951) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 63952 && (row * 584 + col) <= 63976) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 63977 && (row * 584 + col) <= 64535) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 64536 && (row * 584 + col) <= 64560) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 64561 && (row * 584 + col) <= 65119) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 65120 && (row * 584 + col) <= 65144) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 65145 && (row * 584 + col) <= 65703) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 65704 && (row * 584 + col) <= 65728) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 65729 && (row * 584 + col) <= 66287) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 66288 && (row * 584 + col) <= 66312) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 66313 && (row * 584 + col) <= 66871) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 66872 && (row * 584 + col) <= 66896) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 66897 && (row * 584 + col) <= 67455) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 67456 && (row * 584 + col) <= 67480) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 67481 && (row * 584 + col) <= 68039) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 68040 && (row * 584 + col) <= 68064) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 68065 && (row * 584 + col) <= 68623) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 68624 && (row * 584 + col) <= 68648) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 68649 && (row * 584 + col) <= 69207) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 69208 && (row * 584 + col) <= 69232) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 69233 && (row * 584 + col) <= 69791) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 69792 && (row * 584 + col) <= 69816) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 69817 && (row * 584 + col) <= 70375) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 70376 && (row * 584 + col) <= 70400) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 70401 && (row * 584 + col) <= 70959) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 70960 && (row * 584 + col) <= 70984) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 70985 && (row * 584 + col) <= 71543) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 71544 && (row * 584 + col) <= 71568) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 71569 && (row * 584 + col) <= 72127) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 72128 && (row * 584 + col) <= 72152) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 72153 && (row * 584 + col) < 97528) color_data <= 12'b000000000000; else
        color_data <= 12'b000000000000;
    end
endmodule
