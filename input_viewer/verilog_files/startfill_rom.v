`timescale 1ns / 1ps
module startfill_rom (
    input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 0 && (row * 584 + col) <= 9112) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 9113 && (row * 584 + col) <= 9119) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 9120 && (row * 584 + col) <= 9693) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 9694 && (row * 584 + col) <= 9706) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 9707 && (row * 584 + col) <= 10276) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 10277 && (row * 584 + col) <= 10291) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 10292 && (row * 584 + col) <= 10858) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 10859 && (row * 584 + col) <= 10877) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 10878 && (row * 584 + col) <= 11442) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 11443 && (row * 584 + col) <= 11462) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 11463 && (row * 584 + col) <= 12025) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 12026 && (row * 584 + col) <= 12046) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 12047 && (row * 584 + col) <= 12608) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 12609 && (row * 584 + col) <= 12631) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 12632 && (row * 584 + col) <= 13191) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 13192 && (row * 584 + col) <= 13216) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 13217 && (row * 584 + col) <= 13775) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 13776 && (row * 584 + col) <= 13800) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 13801 && (row * 584 + col) <= 14359) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 14360 && (row * 584 + col) <= 14384) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 14385 && (row * 584 + col) <= 14942) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 14943 && (row * 584 + col) <= 14969) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 14970 && (row * 584 + col) <= 15526) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 15527 && (row * 584 + col) <= 15553) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 15554 && (row * 584 + col) <= 16110) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 16111 && (row * 584 + col) <= 16137) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 16138 && (row * 584 + col) <= 16694) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 16695 && (row * 584 + col) <= 16721) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 16722 && (row * 584 + col) <= 17278) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 17279 && (row * 584 + col) <= 17305) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 17306 && (row * 584 + col) <= 17862) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 17863 && (row * 584 + col) <= 17889) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 17890 && (row * 584 + col) <= 18447) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 18448 && (row * 584 + col) <= 18473) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 18474 && (row * 584 + col) <= 19031) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 19032 && (row * 584 + col) <= 19056) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 19057 && (row * 584 + col) <= 19615) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 19616 && (row * 584 + col) <= 19640) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 19641 && (row * 584 + col) <= 20200) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 20201 && (row * 584 + col) <= 20223) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 20224 && (row * 584 + col) <= 20785) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 20786 && (row * 584 + col) <= 20806) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 20807 && (row * 584 + col) <= 21369) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 21370 && (row * 584 + col) <= 21390) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 21391 && (row * 584 + col) <= 21954) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 21955 && (row * 584 + col) <= 21973) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 21974 && (row * 584 + col) <= 22540) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 22541 && (row * 584 + col) <= 22555) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 22556 && (row * 584 + col) <= 23125) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 23126 && (row * 584 + col) <= 23138) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 23139 && (row * 584 + col) <= 23712) color_data <= 12'b000000000000; else
        if ((row * 584 + col) >= 23713 && (row * 584 + col) <= 23719) color_data <= 12'b111111111111; else
        if ((row * 584 + col) >= 23720 && (row * 584 + col) < 97528) color_data <= 12'b000000000000; else
        color_data <= 12'b000000000000;
    end
endmodule
