module joystick_maker (
    input clk,
    input [9:0] x, y,
    input [7:0] JOY_X,
    input [7:0] JOY_Y,
    input [7:0] C_STICK_X,
    input [7:0] C_STICK_Y,
    input start_pause, // used to reassign the "center" of the joysticks
    input center_joystick, // used to reassign the "center" of the joysticks
    output in_center_of_joystick,
    output joystick_on,
    output [11:0] joystick_rgb_data
);



//           MAIN JOYSTICK


// used for ability to change the main joystick resting state
reg [7:0] joystick_x_center_reg;
reg [7:0] joystick_y_center_reg;
initial joystick_x_center_reg = 128;
initial joystick_y_center_reg = 128;

wire [7:0] joystick_x_center, joystick_y_center;
assign joystick_x_center = joystick_x_center_reg;
assign joystick_y_center = joystick_y_center_reg;




// joystick display positioning
parameter joystick_background_width = 70;
parameter joystick_background_height = 70;



wire [7:0] joy_x_difference, joy_y_difference;

// approximates 1/3 scaling (1/4 + 1/8 ~= .37) (ternary to avoid working with negative numbers)
assign joy_x_difference = (JOY_X >= joystick_x_center) ? (((JOY_X - joystick_x_center) >> 2) + ((JOY_X - joystick_x_center) >> 3)) :
                                                         (((joystick_x_center - JOY_X) >> 2) + ((joystick_x_center - JOY_X) >> 3));
assign joy_y_difference = (JOY_Y >= joystick_y_center) ? (((JOY_Y - joystick_y_center) >> 2) + ((JOY_Y - joystick_y_center) >> 3)) :
                                                         (((joystick_y_center - JOY_Y) >> 2) + ((joystick_y_center - JOY_Y) >> 3));


wire [9:0] joystick_background_x_location, joystick_background_y_location;

// ternary to avoid using negatives
assign joystick_background_x_location = (JOY_X >= joystick_x_center) ? (64 + joy_x_difference) : (64 - joy_x_difference);
assign joystick_background_y_location = (JOY_Y >= joystick_y_center) ? (223 - joy_y_difference) : (223 + joy_y_difference);


//used for joystick rom instantiation
wire [9:0] joystick_row, joystick_col;

// boundaries
wire [9:0] joystick_left_bound;
wire [9:0] joystick_right_bound;
wire [9:0] joystick_up_bound;
wire [9:0] joystick_down_bound;

assign joystick_left_bound  = joystick_background_x_location;
assign joystick_right_bound = joystick_background_x_location + joystick_background_width;
assign joystick_up_bound    = joystick_background_y_location;
assign joystick_down_bound  = joystick_background_y_location + joystick_background_height;

assign joystick_col = x - joystick_left_bound;
assign joystick_row = y - joystick_up_bound;



// main joystick rom instantiation
wire [11:0] joystick_rom_data;
joystick_rom joyrom (
    .clk(clk),
    .row(joystick_row),
    .col(joystick_col),
    .color_data(joystick_rom_data)
);


//logic for when to draw the main joystick
wire left_joystick_on;
assign left_joystick_on = (x > joystick_left_bound) && (x < joystick_right_bound) &&
                   (y > joystick_up_bound)   && (y < joystick_down_bound) &&
                   (joystick_rom_data != 12'h000) && (joystick_rom_data != 12'h888);


//this turns the middle of the joystick off so that it overwrites the center with whatever the background is
//this gives it an "overlay" effect
assign in_center_of_joystick = (x > joystick_left_bound) && (x < joystick_right_bound) &&
                               (y > joystick_up_bound)   && (y < joystick_down_bound)  &&
                               joystick_rom_data == 12'h888;






//       C STICK

//used for ability to change the cstick resting state
reg [7:0] c_stick_x_center_reg;
reg [7:0] c_stick_y_center_reg;
initial c_stick_x_center_reg = 128;
initial c_stick_y_center_reg = 128;

wire [7:0] c_stick_x_center, c_stick_y_center;
assign c_stick_x_center = c_stick_x_center_reg;
assign c_stick_y_center = c_stick_y_center_reg;




//cstick display positioning
parameter c_stick_background_width = 52;
parameter c_stick_background_height = 52;



wire [7:0] c_stick_x_difference, c_stick_y_difference;

//approximates 1/3 scaling (1/4 + 1/8 ~= .37) (ternary to avoid working with negative numbers)
assign c_stick_x_difference = (C_STICK_X >= c_stick_x_center_reg) ? (((C_STICK_X - c_stick_x_center) >> 2) + ((C_STICK_X - c_stick_x_center) >> 3)) :
                                                                    (((c_stick_x_center - C_STICK_X) >> 2) + ((c_stick_x_center - C_STICK_X) >> 3));
assign c_stick_y_difference = (C_STICK_Y >= c_stick_y_center_reg) ? (((C_STICK_Y - c_stick_y_center) >> 2) + ((C_STICK_Y - c_stick_y_center) >> 3)) :
                                                                    (((c_stick_y_center - C_STICK_Y) >> 2) + ((c_stick_y_center - C_STICK_Y) >> 3));


wire [9:0] c_stick_background_x_location, c_stick_background_y_location;

// ternary to avoid using negatives
assign c_stick_background_x_location = (C_STICK_X >= c_stick_x_center_reg) ? (221 + c_stick_x_difference) : (221 - c_stick_x_difference);
assign c_stick_background_y_location = (C_STICK_Y >= c_stick_y_center_reg) ? (232 - c_stick_y_difference) : (232 + c_stick_y_difference);



//used for c_stick rom instantiation
wire [9:0] c_stick_row, c_stick_col;

// boundaries
wire [9:0] c_stick_left_bound;
wire [9:0] c_stick_right_bound;
wire [9:0] c_stick_up_bound;
wire [9:0] c_stick_down_bound;

assign c_stick_left_bound  = c_stick_background_x_location;
assign c_stick_right_bound = c_stick_background_x_location + c_stick_background_width;
assign c_stick_up_bound    = c_stick_background_y_location;
assign c_stick_down_bound  = c_stick_background_y_location + c_stick_background_height;

assign c_stick_col = x - c_stick_left_bound;
assign c_stick_row = y - c_stick_up_bound;



// c_stick rom instantiation
wire [11:0] c_stick_rom_data;
c_stick_rom cstickrom (
    .clk(clk),
    .row(c_stick_row),
    .col(c_stick_col),
    .color_data(c_stick_rom_data)
);



// logic for when to draw the c_stick
wire c_stick_on;
assign c_stick_on = (x > c_stick_left_bound) && (x < c_stick_right_bound) &&
                   (y > c_stick_up_bound)   && (y < c_stick_down_bound) &&
                   (c_stick_rom_data != 12'h000);






// logic for when to draw the joysticks
assign joystick_on = left_joystick_on || c_stick_on;



// logic for displaying both joysticks
reg [11:0] intermediate_rgb;
always @(posedge clk) begin
    if (left_joystick_on)
        intermediate_rgb <= joystick_rom_data;
    else if (c_stick_on)
        intermediate_rgb <= c_stick_rom_data;
    else
        intermediate_rgb <= 12'h000;
end


// gives the ability to assign the specific controllers manufactured center
// ex: in theory it should always be 128, but in practice it can be 5ish higher or lower
always @(posedge clk) begin
    if (start_pause || center_joystick) begin
        joystick_x_center_reg <= JOY_X;
        joystick_y_center_reg <= JOY_Y;
        c_stick_x_center_reg <= C_STICK_X;
        c_stick_y_center_reg <= C_STICK_Y;
    end
end


// rgb that contains all joystick data
assign joystick_rgb_data = intermediate_rgb;

endmodule
