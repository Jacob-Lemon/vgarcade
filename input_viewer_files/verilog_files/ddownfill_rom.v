`timescale 1ns / 1ps
module ddownfill_rom (
    input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 0 && (row * 584 + col) <= 75076) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 75077 && (row * 584 + col) <= 75092) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 75093 && (row * 584 + col) <= 75660) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 75661 && (row * 584 + col) <= 75676) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 75677 && (row * 584 + col) <= 76244) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 76245 && (row * 584 + col) <= 76260) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 76261 && (row * 584 + col) <= 76828) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 76829 && (row * 584 + col) <= 76844) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 76845 && (row * 584 + col) <= 77412) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 77413 && (row * 584 + col) <= 77428) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 77429 && (row * 584 + col) <= 77996) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 77997 && (row * 584 + col) <= 78012) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 78013 && (row * 584 + col) <= 78580) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 78581 && (row * 584 + col) <= 78596) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 78597 && (row * 584 + col) <= 79164) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 79165 && (row * 584 + col) <= 79180) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 79181 && (row * 584 + col) <= 79748) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 79749 && (row * 584 + col) <= 79764) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 79765 && (row * 584 + col) <= 80332) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 80333 && (row * 584 + col) <= 80348) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 80349 && (row * 584 + col) <= 80916) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 80917 && (row * 584 + col) <= 80932) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 80933 && (row * 584 + col) <= 81500) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 81501 && (row * 584 + col) <= 81516) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 81517 && (row * 584 + col) <= 82084) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 82085 && (row * 584 + col) <= 82100) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 82101 && (row * 584 + col) <= 82668) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 82669 && (row * 584 + col) <= 82684) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 82685 && (row * 584 + col) <= 83252) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 83253 && (row * 584 + col) <= 83268) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 83269 && (row * 584 + col) <= 83836) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 83837 && (row * 584 + col) <= 83852) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 83853 && (row * 584 + col) <= 84420) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 84421 && (row * 584 + col) <= 84436) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 84437 && (row * 584 + col) <= 85004) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 85005 && (row * 584 + col) <= 85020) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 85021 && (row * 584 + col) <= 85588) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 85589 && (row * 584 + col) <= 85604) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 85605 && (row * 584 + col) <= 86172) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 86173 && (row * 584 + col) <= 86188) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 86189 && (row * 584 + col) <= 86756) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 86757 && (row * 584 + col) <= 86772) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 86773 && (row * 584 + col) <= 87340) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 87341 && (row * 584 + col) <= 87356) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 87357 && (row * 584 + col) <= 87924) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 87925 && (row * 584 + col) <= 87940) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 87941 && (row * 584 + col) <= 88508) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 88509 && (row * 584 + col) <= 88524) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 88525 && (row * 584 + col) <= 89092) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 89093 && (row * 584 + col) <= 89108) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 89109 && (row * 584 + col) <= 89676) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 89677 && (row * 584 + col) <= 89692) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 89693 && (row * 584 + col) < 97528) color_data <= 12'b000000000000; else
        color_data <= 12'b000000000000;
    end
endmodule
