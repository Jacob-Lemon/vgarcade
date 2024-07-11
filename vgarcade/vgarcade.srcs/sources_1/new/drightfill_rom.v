module drightfill_rom (
    input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 63417 && (row * 584 + col) <= 63442) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 64001 && (row * 584 + col) <= 64026) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 64585 && (row * 584 + col) <= 64610) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 65169 && (row * 584 + col) <= 65194) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 65753 && (row * 584 + col) <= 65778) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 66337 && (row * 584 + col) <= 66362) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 66921 && (row * 584 + col) <= 66946) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 67505 && (row * 584 + col) <= 67530) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 68089 && (row * 584 + col) <= 68114) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 68673 && (row * 584 + col) <= 68698) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 69257 && (row * 584 + col) <= 69282) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 69841 && (row * 584 + col) <= 69866) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 70425 && (row * 584 + col) <= 70450) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 71009 && (row * 584 + col) <= 71034) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 71593 && (row * 584 + col) <= 71618) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 72177 && (row * 584 + col) <= 72202) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule