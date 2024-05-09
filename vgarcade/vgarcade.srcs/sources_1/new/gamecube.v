`timescale 1ns/1ps


//---------------------------------------------------------------------------
// This module handles Gamecube Controller inputs using Uart and Python Code
//---------------------------------------------------------------------------

// Usage template:

/* 
    XDC file, include this block:

        ##USB-RS232 Interface
        set_property PACKAGE_PIN B18 [get_ports rx]						
            set_property IOSTANDARD LVCMOS33 [get_ports rx]
        set_property PACKAGE_PIN A18 [get_ports tx]						
            set_property IOSTANDARD LVCMOS33 [get_ports tx]


    Top-level I/O ports:
 
        input   rx,
        output  tx,


    Declared Signals and Instantiation:
  
      Signals:
    
        wire a, b, start_pause;
        wire [3:0] joy_dir;

      Instantiation:

        gamecube controller
            (
                .clk(clk),
                .rst_n(rst_n),
                .rx(rx),
                .tx(tx),
                .a(a),
                .b(b),
                .start_pause(start_pause),
                .joy_dir(joy_dir)
            );
 */

// Description of Usage:

/*
    Buttons:
        
        Any button signal will be high as long as the button is being pressed on the controller
        Ex: while a on the controller is being pressed a = 1, etc.

    Joystick:

        The joy_dir variable is a number 0-8 that indicates the direction the joystick is

        joy_dir number to direction conversion:

            0: Deadzone
            1: Right
            2: Right and Up (diagonal)
            3: Up
            4: Up and Left (diagonal)
            5: Left
            6: Left and Down (diagonal)
            7: Down
            8: Down and Right (diagonal)
*/


module gamecube (
    input clk,
    input rst_n,

    //UART ports
    input rx,
    output tx,

    //controller ports only a, b, start_pause, and main joystick is supported
    output a,
    output b,
    output start_pause,
    output [3:0] joy_dir
);


//-------------------------------------------
// UART Receiver and associated connections
//-------------------------------------------

reg ack;
wire d_ready;
wire [7:0] d_in;

// 8-bit data from receiver is stored here
reg [7:0] received_number;

uart_rx testrx
    (
        .clk(clk),
        .rst_n(rst_n),
        .rx(rx),
        .ack(ack),
        .d_ready(d_ready),
        .d_in(d_in)
    );



//---------------------------------------------
// UART Transmitter and associated connections
//---------------------------------------------

reg [7:0] d_out;
reg start;
wire done;

uart_tx testtx
     (
      .clk(clk),
      .rst_n(rst_n),
      .d_out(d_out),
      .start(start),
      .done(done),
      .tx(tx)
      );



//---------------------------------------------
// Associated connections with controller data
//---------------------------------------------

// Registers to interface with output wires
reg reg_a; 
reg reg_b;
reg reg_start_pause;
reg [3:0] reg_joy_dir;

// Assigning wires to register middle values
assign a = reg_a;
assign b = reg_b;
assign start_pause = reg_start_pause;
assign joy_dir = reg_joy_dir;



//---------------------
// Initial parameters
//---------------------

initial begin
    // Uart data
    ack = 0;
    start = 0;
    
    // Registers for assigning controller data
    reg_a = 0;
    reg_b = 0;
    reg_start_pause = 0;
    reg_joy_dir = 0;
end



//------------------------------------------------------------------------
// Receives and sends to python code and assigns register controller data
//------------------------------------------------------------------------

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        // Reset behavior
        received_number <= 0;
        d_out <= 0;
    end
    else begin
        start <= 0;

        // If uart says data is ready to be received
        if (d_ready) begin
            // Collect received data
            received_number <= d_in;

            // Send same data back to python code to check for errors
            d_out <= d_in;
            start <= 1;
        end

        //assigns button data
        {reg_start_pause,reg_b,reg_a} <= received_number[2:0];

        //assigns joystick data
        reg_joy_dir <= received_number[6:3];
    end
end

endmodule