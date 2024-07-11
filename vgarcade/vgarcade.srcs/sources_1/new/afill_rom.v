module afill_rom (
    input wire clk,
    input wire [7:0] row,
    input wire [9:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 584 + col) >= 47201 && (row * 584 + col) <= 47209) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 47780 && (row * 584 + col) <= 47798) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 48361 && (row * 584 + col) <= 48385) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 48943 && (row * 584 + col) <= 48971) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 49525 && (row * 584 + col) <= 49557) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 50107 && (row * 584 + col) <= 50143) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 50690 && (row * 584 + col) <= 50728) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 51273 && (row * 584 + col) <= 51313) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 51856 && (row * 584 + col) <= 51898) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 52439 && (row * 584 + col) <= 52483) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 53022 && (row * 584 + col) <= 53068) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 53605 && (row * 584 + col) <= 53653) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 54188 && (row * 584 + col) <= 54238) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 54771 && (row * 584 + col) <= 54823) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 55354 && (row * 584 + col) <= 55408) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 55938 && (row * 584 + col) <= 55992) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 56521 && (row * 584 + col) <= 56577) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 57105 && (row * 584 + col) <= 57161) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 57688 && (row * 584 + col) <= 57746) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 58272 && (row * 584 + col) <= 58330) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 58855 && (row * 584 + col) <= 58915) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 59439 && (row * 584 + col) <= 59499) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 60023 && (row * 584 + col) <= 60083) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 60606 && (row * 584 + col) <= 60668) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 61190 && (row * 584 + col) <= 61252) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 61774 && (row * 584 + col) <= 61836) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 62358 && (row * 584 + col) <= 62420) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 62942 && (row * 584 + col) <= 63005) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 63525 && (row * 584 + col) <= 63589) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 64109 && (row * 584 + col) <= 64173) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 64693 && (row * 584 + col) <= 64757) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 65277 && (row * 584 + col) <= 65341) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 65861 && (row * 584 + col) <= 65925) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 66445 && (row * 584 + col) <= 66509) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 67029 && (row * 584 + col) <= 67093) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 67613 && (row * 584 + col) <= 67677) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 68197 && (row * 584 + col) <= 68261) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 68782 && (row * 584 + col) <= 68845) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 69366 && (row * 584 + col) <= 69428) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 69950 && (row * 584 + col) <= 70012) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 70534 && (row * 584 + col) <= 70596) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 71118 && (row * 584 + col) <= 71180) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 71703 && (row * 584 + col) <= 71763) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 72287 && (row * 584 + col) <= 72347) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 72871 && (row * 584 + col) <= 72931) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 73456 && (row * 584 + col) <= 73514) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 74040 && (row * 584 + col) <= 74098) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 74625 && (row * 584 + col) <= 74681) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 75209 && (row * 584 + col) <= 75265) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 75794 && (row * 584 + col) <= 75848) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 76378 && (row * 584 + col) <= 76432) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 76963 && (row * 584 + col) <= 77015) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 77548 && (row * 584 + col) <= 77598) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 78133 && (row * 584 + col) <= 78181) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 78718 && (row * 584 + col) <= 78764) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 79303 && (row * 584 + col) <= 79348) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 79888 && (row * 584 + col) <= 79930) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 80473 && (row * 584 + col) <= 80513) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 81058 && (row * 584 + col) <= 81096) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 81643 && (row * 584 + col) <= 81679) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 82229 && (row * 584 + col) <= 82261) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 82815 && (row * 584 + col) <= 82843) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 83401 && (row * 584 + col) <= 83425) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 83988 && (row * 584 + col) <= 84006) color_data <= 12'b011111111001; else
        if ((row * 584 + col) >= 84576 && (row * 584 + col) <= 84586) color_data <= 12'b011111111001; else
        color_data <= 12'b111111111111;
    end
endmodule