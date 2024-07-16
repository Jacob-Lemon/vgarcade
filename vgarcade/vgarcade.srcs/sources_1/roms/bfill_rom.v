module bfill_rom (
	input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 68736 && (row * 584 + col) <= 68744) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 69317 && (row * 584 + col) <= 69331) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 69899 && (row * 584 + col) <= 69917) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 70481 && (row * 584 + col) <= 70503) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 71063 && (row * 584 + col) <= 71089) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 71646 && (row * 584 + col) <= 71674) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 72229 && (row * 584 + col) <= 72259) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 72812 && (row * 584 + col) <= 72844) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 73395 && (row * 584 + col) <= 73429) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 73978 && (row * 584 + col) <= 74014) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 74562 && (row * 584 + col) <= 74598) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 75145 && (row * 584 + col) <= 75183) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 75729 && (row * 584 + col) <= 75767) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 76312 && (row * 584 + col) <= 76352) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 76896 && (row * 584 + col) <= 76936) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 77480 && (row * 584 + col) <= 77520) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 78063 && (row * 584 + col) <= 78105) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 78647 && (row * 584 + col) <= 78689) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 79231 && (row * 584 + col) <= 79273) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 79815 && (row * 584 + col) <= 79857) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 80399 && (row * 584 + col) <= 80441) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 80983 && (row * 584 + col) <= 81025) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 81567 && (row * 584 + col) <= 81609) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 82151 && (row * 584 + col) <= 82193) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 82735 && (row * 584 + col) <= 82777) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 83320 && (row * 584 + col) <= 83360) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 83904 && (row * 584 + col) <= 83944) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 84488 && (row * 584 + col) <= 84528) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 85073 && (row * 584 + col) <= 85111) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 85657 && (row * 584 + col) <= 85695) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 86242 && (row * 584 + col) <= 86278) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 86826 && (row * 584 + col) <= 86862) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 87411 && (row * 584 + col) <= 87445) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 87996 && (row * 584 + col) <= 88028) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 88581 && (row * 584 + col) <= 88611) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 89166 && (row * 584 + col) <= 89194) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 89751 && (row * 584 + col) <= 89777) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 90336 && (row * 584 + col) <= 90360) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 90922 && (row * 584 + col) <= 90942) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 91508 && (row * 584 + col) <= 91524) color_data <= 12'b111100100011; else
        if ((row * 584 + col) >= 92096 && (row * 584 + col) <= 92104) color_data <= 12'b111100100011; else
        color_data <= 12'b111111111111;
    end
endmodule