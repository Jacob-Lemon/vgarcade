`timescale 1ns / 1ps
module zero_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 0 && (row * 25 + col) <= 34) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 35 && (row * 25 + col) <= 39) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 40 && (row * 25 + col) <= 56) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 57 && (row * 25 + col) <= 67) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 68 && (row * 25 + col) <= 80) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 81 && (row * 25 + col) <= 93) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 94 && (row * 25 + col) <= 104) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 105 && (row * 25 + col) <= 109) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 110 && (row * 25 + col) <= 114) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 115 && (row * 25 + col) <= 119) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 120 && (row * 25 + col) <= 128) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 129 && (row * 25 + col) <= 132) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 133 && (row * 25 + col) <= 141) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 142 && (row * 25 + col) <= 145) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 146 && (row * 25 + col) <= 153) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 154 && (row * 25 + col) <= 156) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 157 && (row * 25 + col) <= 167) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 168 && (row * 25 + col) <= 170) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 171 && (row * 25 + col) <= 177) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 178 && (row * 25 + col) <= 181) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 182 && (row * 25 + col) <= 193) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 194 && (row * 25 + col) <= 196) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 197 && (row * 25 + col) <= 202) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 203 && (row * 25 + col) <= 205) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 206 && (row * 25 + col) <= 218) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 219 && (row * 25 + col) <= 222) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 223 && (row * 25 + col) <= 226) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 227 && (row * 25 + col) <= 229) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 230 && (row * 25 + col) <= 244) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 245 && (row * 25 + col) <= 247) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 248 && (row * 25 + col) <= 251) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 252 && (row * 25 + col) <= 254) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 255 && (row * 25 + col) <= 269) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 270 && (row * 25 + col) <= 272) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 273 && (row * 25 + col) <= 275) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 276 && (row * 25 + col) <= 279) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 280 && (row * 25 + col) <= 295) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 296 && (row * 25 + col) <= 298) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 299 && (row * 25 + col) <= 300) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 301 && (row * 25 + col) <= 303) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 304 && (row * 25 + col) <= 320) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 321 && (row * 25 + col) <= 323) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 324 && (row * 25 + col) <= 325) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 326 && (row * 25 + col) <= 328) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 329 && (row * 25 + col) <= 345) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 346 && (row * 25 + col) <= 348) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 349 && (row * 25 + col) <= 350) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 351 && (row * 25 + col) <= 353) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 354 && (row * 25 + col) <= 370) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 371 && (row * 25 + col) <= 373) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 374 && (row * 25 + col) <= 375) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 376 && (row * 25 + col) <= 378) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 379 && (row * 25 + col) <= 395) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 396 && (row * 25 + col) <= 398) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 399 && (row * 25 + col) <= 400) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 401 && (row * 25 + col) <= 403) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 404 && (row * 25 + col) <= 420) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 421 && (row * 25 + col) <= 423) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 424 && (row * 25 + col) <= 425) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 426 && (row * 25 + col) <= 428) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 429 && (row * 25 + col) <= 445) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 446 && (row * 25 + col) <= 448) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 449 && (row * 25 + col) <= 450) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 451 && (row * 25 + col) <= 454) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 455 && (row * 25 + col) <= 470) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 471 && (row * 25 + col) <= 473) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 474 && (row * 25 + col) <= 476) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 477 && (row * 25 + col) <= 479) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 480 && (row * 25 + col) <= 494) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 495 && (row * 25 + col) <= 497) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 498 && (row * 25 + col) <= 501) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 502 && (row * 25 + col) <= 504) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 505 && (row * 25 + col) <= 519) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 520 && (row * 25 + col) <= 522) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 523 && (row * 25 + col) <= 526) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 527 && (row * 25 + col) <= 530) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 531 && (row * 25 + col) <= 543) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 544 && (row * 25 + col) <= 547) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 548 && (row * 25 + col) <= 552) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 553 && (row * 25 + col) <= 555) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 556 && (row * 25 + col) <= 568) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 569 && (row * 25 + col) <= 571) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 572 && (row * 25 + col) <= 578) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 579 && (row * 25 + col) <= 581) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 582 && (row * 25 + col) <= 592) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 593 && (row * 25 + col) <= 596) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 597 && (row * 25 + col) <= 603) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 604 && (row * 25 + col) <= 607) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 608 && (row * 25 + col) <= 616) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 617 && (row * 25 + col) <= 620) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 621 && (row * 25 + col) <= 629) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 630 && (row * 25 + col) <= 634) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 635 && (row * 25 + col) <= 639) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 640 && (row * 25 + col) <= 644) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 645 && (row * 25 + col) <= 655) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 656 && (row * 25 + col) <= 668) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 669 && (row * 25 + col) <= 681) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 682 && (row * 25 + col) <= 692) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 693 && (row * 25 + col) <= 709) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 710 && (row * 25 + col) <= 715) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 716 && (row * 25 + col) < 750) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule
