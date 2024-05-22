`timescale 1ns/1ps

module top (
    input clk,
    input reset,
    inout data,
    output [15:0] button_data
);


//--------------------------
// Gamecube.v instantiation
//--------------------------

wire A;
wire B;
wire X;
wire Y;
wire start_pause;
wire L;
wire R;
wire Z;
wire D_UP;
wire D_DOWN;
wire D_RIGHT;
wire D_LEFT;
wire [7:0] JOY_X;
wire [7:0] JOY_Y;
wire [7:0] C_STICK_X;
wire [7:0] C_STICK_Y;
wire [7:0] L_TRIGGER;
wire [7:0] R_TRIGGER;

wire [3:0] flag_led;


gamecube controller
    (
        .clk(clk),
        .reset(reset),
        .data(data),
        .A(A),
        .B(B),
        .X(X),
        .Y(Y),
        .start_pause(start_pause),
        .L(L),
        .R(R),
        .Z(Z),
        .D_UP(D_UP),
        .D_DOWN(D_DOWN),
        .D_RIGHT(D_RIGHT),
        .D_LEFT(D_LEFT),
        .JOY_X(JOY_X),
        .JOY_Y(JOY_Y),
        .C_STICK_X(C_STICK_X),
        .C_STICK_Y(C_STICK_Y),
        .L_TRIGGER(L_TRIGGER),
        .R_TRIGGER(R_TRIGGER),
        .flag_led(flag_led)
    );



//-----------------------------------------------------
// Basic behavior to show buttons and joystick on leds
//-----------------------------------------------------
//doesn't include cstick movement
assign button_data[0] = A;
assign button_data[1] = B;
assign button_data[2] = X;
assign button_data[3] = Y;
assign button_data[4] = start_pause;
assign button_data[5] = L;
assign button_data[6] = R;
assign button_data[7] = Z;
assign button_data[8] = D_UP;
assign button_data[9] = D_DOWN;
assign button_data[10] = D_RIGHT;
assign button_data[11] = D_LEFT;
assign button_data[12] = JOY_X[5];     //only tests for movement, not value
assign button_data[13] = JOY_Y[5];     //only tests for movement, not value
assign button_data[14] = L_TRIGGER[4]; //only tests for movement, not value
assign button_data[15] = R_TRIGGER[4]; //only tests for movement, not value



endmodule
