module top(
    input clk_100MHz,       // from Basys 3
    input reset,            // btnC on Basys 3
    output hsync,           // VGA port on Basys 3
    output vsync,           // VGA port on Basys 3
    output [11:0] rgb,       // to DAC, 3 bits to VGA port on Basys 3
    // gamecube ports
    inout data,
    output [15:0] button_data,
    // switches
    input [15:0] sw
);

/******************************************************************************
* this is where I will make input/output delay things
******************************************************************************/
reg [15:0] sw_reg;
always @ (posedge clk_100MHz) begin
    sw_reg <= sw;
end



/******************************************************************************
* clock divider
******************************************************************************/

// reg clk_25MHz_reg;
wire clk_25MHz;

clock_divider get_25MHz (
    .clk_100MHz(clk_100MHz),
    .reset(reset),
    .clk_25MHz(clk_25MHz)
);

// assign clk_25MHz = clk_25MHz_reg;
/******************************************************************************
* this is the gamecube input things
******************************************************************************/


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



gamecube controller (
    .clk(clk_100MHz),
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
    .R_TRIGGER(R_TRIGGER)
);

// Section 1: Tests all buttons and some joystick movement
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
assign button_data[14] = C_STICK_X[5]; //only tests for movement, not value
assign button_data[15] = C_STICK_Y[5]; //only tests for movement, not value



/******************************************************************************
* these are the vga things
******************************************************************************/

wire w_video_on, w_p_tick;
wire [9:0] w_x, w_y;
reg [11:0] rgb_reg;
wire[11:0] rgb_next;

vga_controller vc (
    .clk_100MHz(clk_100MHz),
    .reset(reset),
    .video_on(w_video_on),
    .hsync(hsync), 
    .vsync(vsync),
    .p_tick(w_p_tick),
    .x(w_x),
    .y(w_y)
);

pixel_generation pg (
    .clk(clk_100MHz),   // was clk_100MHz
    .reset(reset),
    .video_on(w_video_on),
    .x(w_x),
    .y(w_y),
    .rgb(rgb_next),
    // gamecube things
    .A(A),
    .B(B),
    .start_pause(start_pause),
    .JOY_X(JOY_X),
    .sw(sw_reg),
    .score(score)
);

// rgb buffer
always @(posedge clk_100MHz)
    if(w_p_tick)
        rgb_reg <= rgb_next;

assign rgb = rgb_reg;

endmodule