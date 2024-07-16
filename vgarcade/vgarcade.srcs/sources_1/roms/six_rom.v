module six_rom (
	input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 31 && (row * 25 + col) <= 43) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 54 && (row * 25 + col) <= 71) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 78 && (row * 25 + col) <= 97) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 103 && (row * 25 + col) <= 108) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 116 && (row * 25 + col) <= 123) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 127 && (row * 25 + col) <= 131) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 144 && (row * 25 + col) <= 148) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 152 && (row * 25 + col) <= 155) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 170 && (row * 25 + col) <= 173) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 177 && (row * 25 + col) <= 180) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 196 && (row * 25 + col) <= 198) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 202 && (row * 25 + col) <= 204) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 227 && (row * 25 + col) <= 229) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 252 && (row * 25 + col) <= 254) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 276 && (row * 25 + col) <= 279) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 301 && (row * 25 + col) <= 304) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 326 && (row * 25 + col) <= 329) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 351 && (row * 25 + col) <= 353) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 361 && (row * 25 + col) <= 368) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 376 && (row * 25 + col) <= 378) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 384 && (row * 25 + col) <= 395) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 401 && (row * 25 + col) <= 403) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 408 && (row * 25 + col) <= 422) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 426 && (row * 25 + col) <= 428) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 431 && (row * 25 + col) <= 438) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 441 && (row * 25 + col) <= 447) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 451 && (row * 25 + col) <= 453) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 455 && (row * 25 + col) <= 461) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 469 && (row * 25 + col) <= 473) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 476 && (row * 25 + col) <= 485) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 495 && (row * 25 + col) <= 498) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 501 && (row * 25 + col) <= 508) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 520 && (row * 25 + col) <= 523) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 526 && (row * 25 + col) <= 532) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 546 && (row * 25 + col) <= 548) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 551 && (row * 25 + col) <= 556) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 571 && (row * 25 + col) <= 573) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 576 && (row * 25 + col) <= 581) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 595 && (row * 25 + col) <= 598) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 602 && (row * 25 + col) <= 607) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 619 && (row * 25 + col) <= 623) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 627 && (row * 25 + col) <= 633) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 642 && (row * 25 + col) <= 648) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 652 && (row * 25 + col) <= 672) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 678 && (row * 25 + col) <= 697) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 705 && (row * 25 + col) <= 719) color_data <= 12'b000000000000; else
        color_data <= 12'b111111111111;
    end
endmodule