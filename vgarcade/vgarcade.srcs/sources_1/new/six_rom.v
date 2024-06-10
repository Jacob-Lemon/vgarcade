`timescale 1ns / 1ps
module six_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 0 && (row * 25 + col) <= 30) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 31 && (row * 25 + col) <= 43) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 44 && (row * 25 + col) <= 53) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 54 && (row * 25 + col) <= 71) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 72 && (row * 25 + col) <= 77) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 78 && (row * 25 + col) <= 97) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 98 && (row * 25 + col) <= 102) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 103 && (row * 25 + col) <= 108) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 109 && (row * 25 + col) <= 115) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 116 && (row * 25 + col) <= 123) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 124 && (row * 25 + col) <= 126) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 127 && (row * 25 + col) <= 131) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 132 && (row * 25 + col) <= 143) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 144 && (row * 25 + col) <= 148) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 149 && (row * 25 + col) <= 151) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 152 && (row * 25 + col) <= 155) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 156 && (row * 25 + col) <= 169) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 170 && (row * 25 + col) <= 173) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 174 && (row * 25 + col) <= 176) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 177 && (row * 25 + col) <= 180) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 181 && (row * 25 + col) <= 195) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 196 && (row * 25 + col) <= 198) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 199 && (row * 25 + col) <= 201) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 202 && (row * 25 + col) <= 204) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 205 && (row * 25 + col) <= 226) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 227 && (row * 25 + col) <= 229) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 230 && (row * 25 + col) <= 251) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 252 && (row * 25 + col) <= 254) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 255 && (row * 25 + col) <= 275) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 276 && (row * 25 + col) <= 279) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 280 && (row * 25 + col) <= 300) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 301 && (row * 25 + col) <= 304) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 305 && (row * 25 + col) <= 325) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 326 && (row * 25 + col) <= 329) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 330 && (row * 25 + col) <= 350) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 351 && (row * 25 + col) <= 353) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 354 && (row * 25 + col) <= 360) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 361 && (row * 25 + col) <= 368) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 369 && (row * 25 + col) <= 375) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 376 && (row * 25 + col) <= 378) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 379 && (row * 25 + col) <= 383) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 384 && (row * 25 + col) <= 395) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 396 && (row * 25 + col) <= 400) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 401 && (row * 25 + col) <= 403) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 404 && (row * 25 + col) <= 407) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 408 && (row * 25 + col) <= 422) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 423 && (row * 25 + col) <= 425) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 426 && (row * 25 + col) <= 428) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 429 && (row * 25 + col) <= 430) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 431 && (row * 25 + col) <= 438) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 439 && (row * 25 + col) <= 440) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 441 && (row * 25 + col) <= 447) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 448 && (row * 25 + col) <= 450) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 451 && (row * 25 + col) <= 453) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 454 && (row * 25 + col) <= 454) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 455 && (row * 25 + col) <= 461) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 462 && (row * 25 + col) <= 468) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 469 && (row * 25 + col) <= 473) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 474 && (row * 25 + col) <= 475) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 476 && (row * 25 + col) <= 485) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 486 && (row * 25 + col) <= 494) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 495 && (row * 25 + col) <= 498) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 499 && (row * 25 + col) <= 500) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 501 && (row * 25 + col) <= 508) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 509 && (row * 25 + col) <= 519) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 520 && (row * 25 + col) <= 523) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 524 && (row * 25 + col) <= 525) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 526 && (row * 25 + col) <= 532) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 533 && (row * 25 + col) <= 545) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 546 && (row * 25 + col) <= 548) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 549 && (row * 25 + col) <= 550) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 551 && (row * 25 + col) <= 556) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 557 && (row * 25 + col) <= 570) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 571 && (row * 25 + col) <= 573) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 574 && (row * 25 + col) <= 575) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 576 && (row * 25 + col) <= 581) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 582 && (row * 25 + col) <= 594) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 595 && (row * 25 + col) <= 598) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 599 && (row * 25 + col) <= 601) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 602 && (row * 25 + col) <= 607) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 608 && (row * 25 + col) <= 618) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 619 && (row * 25 + col) <= 623) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 624 && (row * 25 + col) <= 626) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 627 && (row * 25 + col) <= 633) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 634 && (row * 25 + col) <= 641) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 642 && (row * 25 + col) <= 648) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 649 && (row * 25 + col) <= 651) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 652 && (row * 25 + col) <= 672) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 673 && (row * 25 + col) <= 677) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 678 && (row * 25 + col) <= 697) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 698 && (row * 25 + col) <= 704) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 705 && (row * 25 + col) <= 719) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 720 && (row * 25 + col) < 750) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule
