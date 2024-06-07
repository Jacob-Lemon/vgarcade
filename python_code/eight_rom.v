`timescale 1ns / 1ps
module eight_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 0 && (row * 25 + col) <= 33) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 34 && (row * 25 + col) <= 40) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 41 && (row * 25 + col) <= 55) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 56 && (row * 25 + col) <= 68) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 69 && (row * 25 + col) <= 78) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 79 && (row * 25 + col) <= 95) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 96 && (row * 25 + col) <= 102) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 103 && (row * 25 + col) <= 108) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 109 && (row * 25 + col) <= 115) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 116 && (row * 25 + col) <= 121) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 122 && (row * 25 + col) <= 126) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 127 && (row * 25 + col) <= 130) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 131 && (row * 25 + col) <= 143) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 144 && (row * 25 + col) <= 147) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 148 && (row * 25 + col) <= 150) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 151 && (row * 25 + col) <= 154) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 155 && (row * 25 + col) <= 169) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 170 && (row * 25 + col) <= 173) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 174 && (row * 25 + col) <= 175) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 176 && (row * 25 + col) <= 178) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 179 && (row * 25 + col) <= 195) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 196 && (row * 25 + col) <= 198) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 199 && (row * 25 + col) <= 200) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 201 && (row * 25 + col) <= 203) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 204 && (row * 25 + col) <= 220) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 221 && (row * 25 + col) <= 223) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 224 && (row * 25 + col) <= 225) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 226 && (row * 25 + col) <= 228) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 229 && (row * 25 + col) <= 245) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 246 && (row * 25 + col) <= 248) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 249 && (row * 25 + col) <= 250) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 251 && (row * 25 + col) <= 254) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 255 && (row * 25 + col) <= 269) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 270 && (row * 25 + col) <= 273) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 274 && (row * 25 + col) <= 276) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 277 && (row * 25 + col) <= 280) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 281 && (row * 25 + col) <= 293) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 294 && (row * 25 + col) <= 297) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 298 && (row * 25 + col) <= 302) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 303 && (row * 25 + col) <= 308) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 309 && (row * 25 + col) <= 315) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 316 && (row * 25 + col) <= 321) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 322 && (row * 25 + col) <= 328) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 329 && (row * 25 + col) <= 345) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 346 && (row * 25 + col) <= 355) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 356 && (row * 25 + col) <= 368) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 369 && (row * 25 + col) <= 378) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 379 && (row * 25 + col) <= 395) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 396 && (row * 25 + col) <= 402) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 403 && (row * 25 + col) <= 408) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 409 && (row * 25 + col) <= 415) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 416 && (row * 25 + col) <= 421) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 422 && (row * 25 + col) <= 426) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 427 && (row * 25 + col) <= 431) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 432 && (row * 25 + col) <= 442) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 443 && (row * 25 + col) <= 447) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 448 && (row * 25 + col) <= 451) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 452 && (row * 25 + col) <= 455) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 456 && (row * 25 + col) <= 469) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 470 && (row * 25 + col) <= 472) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 473 && (row * 25 + col) <= 475) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 476 && (row * 25 + col) <= 479) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 480 && (row * 25 + col) <= 495) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 496 && (row * 25 + col) <= 498) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 499 && (row * 25 + col) <= 500) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 501 && (row * 25 + col) <= 503) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 504 && (row * 25 + col) <= 520) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 521 && (row * 25 + col) <= 523) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 524 && (row * 25 + col) <= 525) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 526 && (row * 25 + col) <= 528) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 529 && (row * 25 + col) <= 545) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 546 && (row * 25 + col) <= 548) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 549 && (row * 25 + col) <= 550) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 551 && (row * 25 + col) <= 553) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 554 && (row * 25 + col) <= 570) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 571 && (row * 25 + col) <= 573) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 574 && (row * 25 + col) <= 576) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 577 && (row * 25 + col) <= 579) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 580 && (row * 25 + col) <= 594) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 595 && (row * 25 + col) <= 597) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 598 && (row * 25 + col) <= 601) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 602 && (row * 25 + col) <= 606) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 607 && (row * 25 + col) <= 618) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 619 && (row * 25 + col) <= 622) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 623 && (row * 25 + col) <= 627) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 628 && (row * 25 + col) <= 633) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 634 && (row * 25 + col) <= 640) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 641 && (row * 25 + col) <= 646) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 647 && (row * 25 + col) <= 653) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 654 && (row * 25 + col) <= 670) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 671 && (row * 25 + col) <= 680) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 681 && (row * 25 + col) <= 693) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 694 && (row * 25 + col) <= 707) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 708 && (row * 25 + col) <= 716) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 717 && (row * 25 + col) < 750) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule
