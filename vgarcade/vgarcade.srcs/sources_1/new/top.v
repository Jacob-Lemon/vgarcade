`timescale 1ns / 1ps

module top(
    input clk_100MHz,       // from Basys 3
    input reset,            // btnC on Basys 3
    output hsync,           // VGA port on Basys 3
    output vsync,           // VGA port on Basys 3
    output [11:0] rgb,       // to DAC, 3 bits to VGA port on Basys 3
    // gamecube ports
     input rx,
     output tx,
     // testing things
     output a_led,
     output b_led,
     output start_pause_led,
     output [3:0] joy_dir_led,
     output test_flag_led,
     output reset_flag_led,
     // switches
     input [15:0] sw
    );
assign reset_flag_led = reset;
/******************************************************************************
* this is the gamecube input things
******************************************************************************/
wire a, b, start_pause;
wire [3:0] joy_dir;
wire test_flag;

assign a_led = a;
assign b_led = b;
assign start_pause_led = start_pause;
assign joy_dir_led = joy_dir;
assign test_flag_led = test_flag;


gamecube controller
(
    .clk(clk_100MHz),
    .reset(reset),
    .rx(rx),
    .tx(tx),
    .a(a),
    .b(b),
    .start_pause(start_pause),
    .joy_dir(joy_dir),
    .test_flag(test_flag)
);


/******************************************************************************
* these are the vga things
******************************************************************************/

wire w_video_on, w_p_tick;
wire [9:0] w_x, w_y;
reg [11:0] rgb_reg;
wire[11:0] rgb_next;

vga_controller vc(.clk_100MHz(clk_100MHz), .reset(reset), .video_on(w_video_on), .hsync(hsync), 
                  .vsync(vsync), .p_tick(w_p_tick), .x(w_x), .y(w_y));

pixel_generation pg (
    .clk(clk_100MHz),
    .reset(reset),
    .video_on(w_video_on),
    .x(w_x),
    .y(w_y),
    .rgb(rgb_next),
    .a(a),
    .b(b),
    .start_pause(start_pause),
    .joy_dir(joy_dir),
    .sw(sw)
);

always @(posedge clk_100MHz)
    if(w_p_tick)
        rgb_reg <= rgb_next;
        
assign rgb = rgb_reg;

endmodule
