module zfill_rom (
    input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 3445 && (row * 584 + col) <= 3454) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 4028 && (row * 584 + col) <= 4042) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 4612 && (row * 584 + col) <= 4633) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 5196 && (row * 584 + col) <= 5217) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 5781 && (row * 584 + col) <= 5802) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 6366 && (row * 584 + col) <= 6388) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 6951 && (row * 584 + col) <= 6974) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 7540 && (row * 584 + col) <= 7560) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 8126 && (row * 584 + col) <= 8145) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 8711 && (row * 584 + col) <= 8730) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 9297 && (row * 584 + col) <= 9315) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 9883 && (row * 584 + col) <= 9900) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 10468 && (row * 584 + col) <= 10486) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 11053 && (row * 584 + col) <= 11071) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 11638 && (row * 584 + col) <= 11656) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 12223 && (row * 584 + col) <= 12241) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 12809 && (row * 584 + col) <= 12826) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 13394 && (row * 584 + col) <= 13412) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 13979 && (row * 584 + col) <= 13997) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 14564 && (row * 584 + col) <= 14582) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 15149 && (row * 584 + col) <= 15167) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 15735 && (row * 584 + col) <= 15752) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 16320 && (row * 584 + col) <= 16337) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 16905 && (row * 584 + col) <= 16922) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 17490 && (row * 584 + col) <= 17506) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 18076 && (row * 584 + col) <= 18091) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 18662 && (row * 584 + col) <= 18675) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 19247 && (row * 584 + col) <= 19259) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 19832 && (row * 584 + col) <= 19843) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 20417 && (row * 584 + col) <= 20427) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 21002 && (row * 584 + col) <= 21012) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 21586 && (row * 584 + col) <= 21596) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 22171 && (row * 584 + col) <= 22181) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 22756 && (row * 584 + col) <= 22765) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 23341 && (row * 584 + col) <= 23349) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 23925 && (row * 584 + col) <= 23933) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 24510 && (row * 584 + col) <= 24517) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 25095 && (row * 584 + col) <= 25101) color_data <= 12'b011000101111; else
        if ((row * 584 + col) >= 25680 && (row * 584 + col) <= 25685) color_data <= 12'b011000101111; else
        color_data <= 12'b111111111111;
    end
endmodule