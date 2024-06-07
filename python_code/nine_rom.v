`timescale 1ns / 1ps
module nine_rom (
    input wire clk,
    input wire [4:0] row,
    input wire [4:0] col,
    output reg [11:0] color_data
);

    always @(posedge clk) begin
        if ((row * 25 + col) >= 0 && (row * 25 + col) <= 34) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 35 && (row * 25 + col) <= 39) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 40 && (row * 25 + col) <= 57) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 58 && (row * 25 + col) <= 65) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 66 && (row * 25 + col) <= 80) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 81 && (row * 25 + col) <= 92) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 93 && (row * 25 + col) <= 105) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 106 && (row * 25 + col) <= 109) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 110 && (row * 25 + col) <= 113) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 114 && (row * 25 + col) <= 119) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 120 && (row * 25 + col) <= 129) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 130 && (row * 25 + col) <= 133) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 134 && (row * 25 + col) <= 139) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 140 && (row * 25 + col) <= 144) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 145 && (row * 25 + col) <= 154) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 155 && (row * 25 + col) <= 157) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 158 && (row * 25 + col) <= 165) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 166 && (row * 25 + col) <= 169) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 170 && (row * 25 + col) <= 178) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 179 && (row * 25 + col) <= 181) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 182 && (row * 25 + col) <= 191) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 192 && (row * 25 + col) <= 194) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 195 && (row * 25 + col) <= 203) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 204 && (row * 25 + col) <= 206) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 207 && (row * 25 + col) <= 216) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 217 && (row * 25 + col) <= 219) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 220 && (row * 25 + col) <= 228) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 229 && (row * 25 + col) <= 231) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 232 && (row * 25 + col) <= 241) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 242 && (row * 25 + col) <= 244) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 245 && (row * 25 + col) <= 253) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 254 && (row * 25 + col) <= 256) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 257 && (row * 25 + col) <= 266) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 267 && (row * 25 + col) <= 269) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 270 && (row * 25 + col) <= 278) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 279 && (row * 25 + col) <= 282) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 283 && (row * 25 + col) <= 290) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 291 && (row * 25 + col) <= 294) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 295 && (row * 25 + col) <= 304) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 305 && (row * 25 + col) <= 307) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 308 && (row * 25 + col) <= 315) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 316 && (row * 25 + col) <= 319) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 320 && (row * 25 + col) <= 330) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 331 && (row * 25 + col) <= 334) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 335 && (row * 25 + col) <= 338) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 339 && (row * 25 + col) <= 344) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 345 && (row * 25 + col) <= 355) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 356 && (row * 25 + col) <= 369) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 370 && (row * 25 + col) <= 382) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 383 && (row * 25 + col) <= 394) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 395 && (row * 25 + col) <= 408) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 409 && (row * 25 + col) <= 414) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 415 && (row * 25 + col) <= 416) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 417 && (row * 25 + col) <= 419) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 420 && (row * 25 + col) <= 441) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 442 && (row * 25 + col) <= 444) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 445 && (row * 25 + col) <= 466) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 467 && (row * 25 + col) <= 469) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 470 && (row * 25 + col) <= 491) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 492 && (row * 25 + col) <= 494) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 495 && (row * 25 + col) <= 516) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 517 && (row * 25 + col) <= 519) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 520 && (row * 25 + col) <= 541) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 542 && (row * 25 + col) <= 544) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 545 && (row * 25 + col) <= 566) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 567 && (row * 25 + col) <= 569) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 570 && (row * 25 + col) <= 591) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 592 && (row * 25 + col) <= 594) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 595 && (row * 25 + col) <= 616) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 617 && (row * 25 + col) <= 619) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 620 && (row * 25 + col) <= 641) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 642 && (row * 25 + col) <= 644) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 645 && (row * 25 + col) <= 666) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 667 && (row * 25 + col) <= 669) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 670 && (row * 25 + col) <= 691) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 692 && (row * 25 + col) <= 694) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 695 && (row * 25 + col) <= 716) color_data <= 12'b111111111111; else
        if ((row * 25 + col) >= 717 && (row * 25 + col) <= 719) color_data <= 12'b000000000000; else
        if ((row * 25 + col) >= 720 && (row * 25 + col) < 750) color_data <= 12'b111111111111; else
        color_data <= 12'b000000000000;
    end
endmodule
