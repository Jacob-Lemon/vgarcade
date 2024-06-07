`timescale 1ns / 1ps
module seven_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 0 && (row * 25 + col) <= 28) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 29 && (row * 25 + col) <= 44) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 45 && (row * 25 + col) <= 51) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 52 && (row * 25 + col) <= 71) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 72 && (row * 25 + col) <= 76) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 77 && (row * 25 + col) <= 97) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 98 && (row * 25 + col) <= 101) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 102 && (row * 25 + col) <= 122) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 123 && (row * 25 + col) <= 127) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 128 && (row * 25 + col) <= 147) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 148 && (row * 25 + col) <= 165) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 166 && (row * 25 + col) <= 171) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 172 && (row * 25 + col) <= 189) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 190 && (row * 25 + col) <= 196) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 197 && (row * 25 + col) <= 214) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 215 && (row * 25 + col) <= 220) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 221 && (row * 25 + col) <= 238) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 239 && (row * 25 + col) <= 244) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 245 && (row * 25 + col) <= 262) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 263 && (row * 25 + col) <= 269) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 270 && (row * 25 + col) <= 287) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 288 && (row * 25 + col) <= 293) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 294 && (row * 25 + col) <= 311) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 312 && (row * 25 + col) <= 317) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 318 && (row * 25 + col) <= 335) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 336 && (row * 25 + col) <= 341) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 342 && (row * 25 + col) <= 360) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 361 && (row * 25 + col) <= 366) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 367 && (row * 25 + col) <= 384) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 385 && (row * 25 + col) <= 390) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 391 && (row * 25 + col) <= 408) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 409 && (row * 25 + col) <= 414) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 415 && (row * 25 + col) <= 433) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 434 && (row * 25 + col) <= 439) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 440 && (row * 25 + col) <= 457) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 458 && (row * 25 + col) <= 463) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 464 && (row * 25 + col) <= 481) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 482 && (row * 25 + col) <= 487) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 488 && (row * 25 + col) <= 506) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 507 && (row * 25 + col) <= 512) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 513 && (row * 25 + col) <= 530) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 531 && (row * 25 + col) <= 536) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 537 && (row * 25 + col) <= 554) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 555 && (row * 25 + col) <= 560) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 561 && (row * 25 + col) <= 579) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 580 && (row * 25 + col) <= 585) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 586 && (row * 25 + col) <= 603) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 604 && (row * 25 + col) <= 609) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 610 && (row * 25 + col) <= 627) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 628 && (row * 25 + col) <= 633) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 634 && (row * 25 + col) <= 652) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 653 && (row * 25 + col) <= 658) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 659 && (row * 25 + col) <= 677) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 678 && (row * 25 + col) <= 682) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 683 && (row * 25 + col) <= 703) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 704 && (row * 25 + col) <= 706) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 707 && (row * 25 + col) < 750) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule
