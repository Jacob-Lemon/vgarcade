module analog_trigger_maker (
    input clk,
    input [9:0] x, y,
    input [7:0] L_TRIGGER,
    input [7:0] R_TRIGGER,
    output trigger_on,
    output [11:0] trigger_rgb_data
);



//         LEFT TRIGGER

// left trigger display positioning
wire [7:0] l_trigger_background_width;
assign l_trigger_background_width = L_TRIGGER >> 1; // uses the trigger value divided by 2
parameter l_trigger_background_height = 14;


// top left pixel position
parameter l_trigger_background_x_location = 35;
parameter l_trigger_background_y_location = 162;


// boundaries
wire [9:0] l_trigger_left_bound;
wire [9:0] l_trigger_right_bound;
wire [9:0] l_trigger_up_bound;
wire [9:0] l_trigger_down_bound;

assign l_trigger_left_bound  = l_trigger_background_x_location;
assign l_trigger_right_bound = l_trigger_background_x_location + l_trigger_background_width; // changes the right bound according to left trigger value
assign l_trigger_up_bound    = l_trigger_background_y_location;
assign l_trigger_down_bound  = l_trigger_background_y_location + l_trigger_background_height;


// logic for when to draw the left trigger
wire l_trigger_on;
assign l_trigger_on = (x >= l_trigger_left_bound) && (x <= l_trigger_right_bound) &&
                      (y >= l_trigger_up_bound)   && (y <= l_trigger_down_bound);






//         RIGHT TRIGGER

// right trigger display positioning
wire [7:0] r_trigger_background_width;
assign r_trigger_background_width = R_TRIGGER >> 1; // uses the trigger value divided by 2
parameter r_trigger_background_height = 14;

// top right pixel position (scary!)
parameter r_trigger_background_x_location = 312;
parameter r_trigger_background_y_location = 162;


// boundaries
wire [9:0] r_trigger_left_bound;
wire [9:0] r_trigger_right_bound;
wire [9:0] r_trigger_up_bound;
wire [9:0] r_trigger_down_bound;

assign r_trigger_left_bound  = r_trigger_background_x_location - r_trigger_background_width; // changes the left bound according to right trigger value
assign r_trigger_right_bound = r_trigger_background_x_location;
assign r_trigger_up_bound    = r_trigger_background_y_location;
assign r_trigger_down_bound  = r_trigger_background_y_location + r_trigger_background_height;


// logic for when to draw the right trigger
wire r_trigger_on;
assign r_trigger_on = (x > r_trigger_left_bound) && (x < r_trigger_right_bound) &&
                      (y > r_trigger_up_bound)   && (y < r_trigger_down_bound);



// logic for when to draw the triggers
assign trigger_on = l_trigger_on || r_trigger_on;



//logic for displaying joystick
reg [11:0] intermediate_rgb;
always @(posedge clk) begin
    if (l_trigger_on)
        intermediate_rgb <= 12'hFFF;
    else if (r_trigger_on)
        intermediate_rgb <= 12'hFFF;
    else
        intermediate_rgb <= 12'h000;
end


// rgb that contains all trigger data
assign trigger_rgb_data = intermediate_rgb;

endmodule
