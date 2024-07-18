module input_maker (
    input clk,
    input [9:0] x, y,
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
    input center_joystick,
    output input_background_on,
    output [11:0] rgb_data
);


//input display positioning
parameter input_background_width = 584;
parameter input_background_height = 167;


// top left pixel position
parameter input_background_x_location = 28;
parameter input_background_y_location = 156;


wire [9:0] input_row, input_col;

// boundaries
wire [9:0] left_bound;
wire [9:0] right_bound;
wire [9:0] up_bound;
wire [9:0] down_bound;

assign left_bound  = input_background_x_location;
assign right_bound = input_background_x_location + input_background_width;
assign up_bound    = input_background_y_location;
assign down_bound  = input_background_y_location + input_background_height;

assign input_col = x - left_bound;
assign input_row = y - up_bound;     


wire input_display_on;

//for the background of the input display to show
assign input_display_on = (x > left_bound) && (x <= right_bound) &&
                  (y >= up_bound)   && (y < down_bound) && 
                  (rom_input_background != 12'h000);  // this treats it as an overlay, background can be any color


//this logic tells the vga when to draw the input viewer things instead of the background
//the !in_center_of_joystick is used so that anything under the main joystick is just the background
assign input_background_on = (input_display_on || button_on || joystick_on || trigger_on) && !in_center_of_joystick;


//rom instantiation that gets the input viewer layout
wire [11:0] rom_input_background;
input_display_background_rom background (
    .clk(clk),
    .row(input_row),
    .col(input_col),
    .color_data(rom_input_background)
);


//button display positioning
parameter button_background_width = 584;
parameter button_background_height = 167;


// top left pixel position
parameter button_background_x_location = 28;
parameter button_background_y_location = 156;


// button instantiation
wire button_on;
wire [11:0] button_rgb_data;
button_maker buttons (
    .clk(clk),
    .x(x),
    .y(y),
    .x_position(button_background_x_location),
    .y_position(button_background_y_location),
    .size_x(button_background_width),
    .size_y(button_background_height),
    .button_on(button_on),
    .button_rgb_data(button_rgb_data),
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
    .D_LEFT(D_LEFT)
);



// joystick instantiation
wire in_center_of_joystick;
wire joystick_on;
wire [11:0] joystick_rgb_data;
joystick_maker joy (
    .clk(clk),
    .x(x),
    .y(y),
    .in_center_of_joystick(in_center_of_joystick),
    .joystick_on(joystick_on),
    .joystick_rgb_data(joystick_rgb_data),
    .JOY_X(JOY_X),
    .JOY_Y(JOY_Y),
    .C_STICK_X(C_STICK_X),
    .C_STICK_Y(C_STICK_Y),
    .start_pause(start_pause),
    .center_joystick(center_joystick)
);




// analog trigger instantiation
wire trigger_on;
wire [11:0] trigger_rgb_data;
analog_trigger_maker analog (
    .clk(clk),
    .x(x),
    .y(y),
    .trigger_on(trigger_on),
    .trigger_rgb_data(trigger_rgb_data),
    .L_TRIGGER(L_TRIGGER),
    .R_TRIGGER(R_TRIGGER)
);



//layering logic
reg [11:0] intermediate_rgb;
always @(posedge clk) begin
    if (joystick_on)
        intermediate_rgb <= joystick_rgb_data;
    else if (button_on)
        intermediate_rgb <= button_rgb_data;
    else if (input_display_on)
        intermediate_rgb <= rom_input_background;
    else if (trigger_on) //put underneath main display trigger buttons to hide black rectangle strip bug
        intermediate_rgb <= trigger_rgb_data;
    else 
        intermediate_rgb <= 12'h000;
end


// this is to get rgb bits in the right order
// it is originally in bgr instead of rgb format
assign rgb_data[11:8] = intermediate_rgb[3:0];
assign rgb_data[7:4]  = intermediate_rgb[7:4];
assign rgb_data[3:0]  = intermediate_rgb[11:8];


endmodule