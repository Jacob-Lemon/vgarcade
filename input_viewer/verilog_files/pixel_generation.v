module pixel_generation (
    input clk,                              // 100MHz from Basys 3
    input reset,                            // btnC
    input video_on,                         // from VGA controller
    input [9:0] x, y,                       // from VGA controller
    input A,
    input B,
    input X,
    input Y,
    input start_pause,
    input L,
    input R,
    input Z,
    input D_UP,
    input D_DOWN,
    input D_RIGHT,
    input D_LEFT,
    input [7:0] JOY_X,
    input [7:0] JOY_Y,
    input [7:0] C_STICK_X,
    input [7:0] C_STICK_Y,
    input [7:0] L_TRIGGER,
    input [7:0] R_TRIGGER,
    output reg [11:0] rgb                   // to DAC, to VGA controller
    );



/******************************************************************************
Drawing background of input viewer
******************************************************************************/
wire input_background_on;
wire [11:0] input_background_rgb_data;

//input maker instantiation for displaying background
input_maker display_background (
        .clk(clk),
        .x(x),
        .y(y),
        .input_background_on(input_background_on),
        .rgb_data(input_background_rgb_data),
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
        .R_TRIGGER(R_TRIGGER)
    );


// Stage 1: Check if video is on
reg video_active;
always @(posedge clk or posedge reset) begin
    if (reset)
        video_active <= 1'b0;
    else
        video_active <= video_on;
end

// Stage 2: RGB control
reg [11:0] intermediate_rgb;
always @(posedge clk or posedge reset) begin
    if (reset)
        intermediate_rgb <= 12'h000;
    else if (~video_active)
        intermediate_rgb <= 12'h000;
    //--------------------input_background------------------------------------------------
    else if (input_background_on)
        intermediate_rgb <= input_background_rgb_data;
    //--------------------background-------------------------------------------
    else
        intermediate_rgb <= 12'h000;
end





// Stage 3: Final assignment to RGB output
always @(posedge clk or posedge reset) begin
    if (reset)
        rgb <= 12'h000;
    else
        rgb <= intermediate_rgb;
end
            
        

endmodule