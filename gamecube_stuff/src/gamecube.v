//----------------------------------------------------------------------------
// This module handles Gamecube Controller inputs using the Gamecube Protocol
//----------------------------------------------------------------------------

// Usage template:

/* 
    XDC file: Include this line anywhere for pullup property:

        ## Pull Up Resistor
        set_property PULLTYPE PULLUP [get_ports data]
    
    XDC file: Include this line for the pmod connection, this uses JA pmod connection port P1 but
    any can be used as long as the data line, 3.3v and ground are connected properly

        ##Sch name = JA1
        set_property PACKAGE_PIN J1 [get_ports {data}]					
            set_property IOSTANDARD LVCMOS33 [get_ports {data}]


    Top-level I/O port:
 
        inout data,


    Top-level Declared Signals and Instantiation:
  
      Signals:
    
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

      Instantiation:

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
                .R_TRIGGER(R_TRIGGER)
            );
 */

// Description of Usage:

/*
    Buttons:
        
        Any button signal will be high as long as the button is being pressed on the controller
        Ex: while A on the controller is being pressed A = 1, etc.

        There is no button limit, all buttons can be pressed simultaneously and all will be read correctly

    Joysticks:

        Joysticks report an 8 bit number for the X direction and the Y direction, a perfect controller will
        report 128, 128 for the center but individual controllers will vary. 
            
            For the X directions of the Joysticks holding left will be closer to 0 (about 30 realistically) and
            holding right will be closer to 255 (about 230 realistically) 
            
            For the Y directions of the Joysticks holding down will be closer to 0 (about 30 realistically) and
            holding up will be closer to 255 (about 230 realistically)

    Triggers: 

        The Triggers report an 8 bit number, when they are not pressed it is closer to 0 (about 30 realistically) and
        fully pressing the trigger will report closer to 255 (about 230 realistically)

    Reset:

        Every once and a while either due to poor connection when plugging/unplugging the controller or due to the data 
        line breaking randomly the module will stop reading the controller data correctly. When this happens the reset signal
        (tied to the center button on the basys board in my design) will fully reset the protocol and hopefully fix any problem.
        
*/




//required to keep line high when not driven (UART like protocol)
(* PULLTYPE = "{PULLUP}" *)

module gamecube (
			input clk,
			input reset,
			inout data,
			output A,
			output B,
			output X,
			output Y,
			output start_pause,
			output L,
			output R,
			output Z,
			output D_UP,
			output D_DOWN,
			output D_RIGHT,
			output D_LEFT,
			output [7:0] JOY_X,
			output [7:0] JOY_Y,
			output [7:0] C_STICK_X,
			output [7:0] C_STICK_Y,
			output [7:0] L_TRIGGER,
			output [7:0] R_TRIGGER
		);



//parameters for case statements
localparam [2:0] byte0 = 0,  //0,0,0,start_pause,Y,X,B,A        sometimes the first 3 bits are 0,0,1
                byte1 = 1,  //1,L,R,Z,D_UP,D_DOWN,D_RIGHT,D_LEFT
                byte2 = 2,  //8 bit JOY_X value
                byte3 = 3,  //8 bit JOY_Y value
                byte4 = 4,  //8 bit C_STICK_X value
                byte5 = 5,  //8 bit C_STICK_Y value
                byte6 = 6,  //8 bit L_TRIGGER value
                byte7 = 7;  //8 bit R_TRIGGER value


//bytes for controller data
reg [7:0] reg_byte0;
reg [7:0] reg_byte1;
reg [7:0] reg_byte2;
reg [7:0] reg_byte3;
reg [7:0] reg_byte4;
reg [7:0] reg_byte5;
reg [7:0] reg_byte6;
reg [7:0] reg_byte7;

//assign into outputs
assign A = reg_byte0[0];
assign B = reg_byte0[1];
assign X = reg_byte0[2];
assign Y = reg_byte0[3];
assign start_pause = reg_byte0[4];
assign D_LEFT = reg_byte1[0];
assign D_RIGHT = reg_byte1[1];
assign D_DOWN = reg_byte1[2];
assign D_UP = reg_byte1[3];
assign Z = reg_byte1[4];
assign R = reg_byte1[5];
assign L = reg_byte1[6];
assign JOY_X = reg_byte2;
assign JOY_Y = reg_byte3;
assign C_STICK_X = reg_byte4;
assign C_STICK_Y = reg_byte5;
assign L_TRIGGER = reg_byte6;
assign R_TRIGGER = reg_byte7;


//flag so that basys board can't be sending and receiving at the same time
reg console_send;

//microsecond timer to send data
reg [9:0] us_timer;

//millisecond timer
reg [19:0] packet_timer;

//whether to send a packet or not
reg packet_interval;

//sends data on bidirectional line
reg out_data;

//receives data on bidirectional line
wire in_data;

//value to send to the controller
reg [24:0] send_packet;

//which part of the send_packet is being sent
reg [4:0] index;

//flag that says button data was stored correctly
reg done_reading_buffer;

//flag that says all controller data was stored
reg last_byte_assigned;

//flag that says the controller is currently sending data
reg controller_sending;

//which byte to store data indo
reg [2:0] state_receive;

//which index of current byte to assign data into
reg [2:0] byte_index;

//wait until controller is sending
reg [10:0] delay_counter;

//counts how long data line is low to interpret what the controller is sending
reg [8:0] zero_counter;

//registers to keep track of a negative edge within an always block
reg reg_cur;
reg reg_prev;


//intial values
initial begin
    reg_byte0 <= 0;
    reg_byte1 <= 0;
    reg_byte2 <= 128; //center joystick
    reg_byte3 <= 128; //center joystick
    reg_byte4 <= 128; //center C Stick
    reg_byte5 <= 128; //center C Stick
    reg_byte6 <= 0;
    reg_byte7 <= 0;
    byte_index <= 7; //since bits come in opposite direction


    us_timer <= 0;
    packet_timer <= 0;
    console_send <= 1;     //on start up it is able to send data packet
    packet_interval <= 1;  //on start up it is able to send data packet
    out_data <= 0;
    send_packet <= 25'b0100_0000_0000_0011_0001_0000_1; //packet that gets controller to send data
    index <= 25; //work through it from the MSB

    done_reading_buffer <= 0;
    last_byte_assigned <= 0;
    controller_sending <= 0;
    state_receive <= byte0; //start putting data into first byte

    delay_counter <= 0;
    zero_counter <= 0;

    reg_cur <= 0;
    reg_prev <= 0;
    
end

//sends request for controller data every 10ms
always @(posedge clk) begin
    if (reset) begin
        // puts it in "receive mode" so line isn't being driven
        packet_timer <= 9800;
        packet_interval <= 0;

    end else begin
        if (packet_timer < 9800) begin //PWM where low when not sending
            packet_interval <= 1;
        end else begin
            packet_interval <= 0;
        end

        packet_timer <= packet_timer + 1;
        if (packet_timer == 1_000_000)  //10ms
            packet_timer <= 0;
    end
end


always @(posedge clk or posedge reset) begin
    if (reset) begin // does an absolute full reset in case the controller starts giving weird data
        index <= 25;

        reg_byte0 <= 0;
        reg_byte1 <= 0;
        reg_byte2 <= 128; //center joystick
        reg_byte3 <= 128; //center joystick
        reg_byte4 <= 128; //center C Stick
        reg_byte5 <= 128; //center C Stick
        reg_byte6 <= 0;
        reg_byte7 <= 0;

        console_send <= 1;
        us_timer <= 0;

        byte_index <= 7;
        done_reading_buffer <= 0;
        last_byte_assigned <= 0;
        controller_sending <= 0;
        state_receive <= byte0;

        delay_counter <= 0;
        zero_counter <= 0;

        reg_cur <= 0;
        reg_prev <= 0;

        out_data <= 0;
        
    end else begin


        //sends data packet
        if (console_send && packet_interval) begin

            if (index - 1 == 0) begin   //if the stop bit
                if (us_timer == 0)
                    out_data <= 0;
            end else if (send_packet[index - 1]) begin   //if sending a 1 (1us low 3us high)
                if (us_timer == 0)
                    out_data <= 0;
                else if (us_timer == 100)
                    out_data <= 1;
            end else begin     //if sending a 0 (3us low 1us high)
                if (us_timer == 0)
                    out_data <= 0;
                else if (us_timer == 300)
                    out_data <= 1;
            end

            us_timer <= us_timer + 1;

            if (us_timer == 400) begin  //goes through the data to send every 4us
                us_timer <= 0;
                index <= index - 1;
            end
            
            if ((index - 1) == 0 && us_timer == 100) begin //if sending the stop bit only need low 1us then drive high impedance
                us_timer <= 0;
                index <= 25;
                console_send <= 0;
            end


        //receives controller data
        end else if (!console_send) begin

            if (!controller_sending) begin
                delay_counter <= delay_counter + 1;
                if (delay_counter > 200 && !in_data) begin  //wait until low from console send finishes then check for if line is low
                    controller_sending <= 1;
                    delay_counter <= 0;
                end else if (delay_counter == 2000) begin //20us went by without receiving controller data (not connected)
                    delay_counter <= 0;
                    console_send <= 1;

                    //reset all controller data when not connected
                    reg_byte0 <= 0;
                    reg_byte1 <= 0;
                    reg_byte2 <= 128; //center joystick
                    reg_byte3 <= 128; //center joystick
                    reg_byte4 <= 128; //center C Stick
                    reg_byte5 <= 128; //center C Stick
                    reg_byte6 <= 0;
                    reg_byte7 <= 0;
                end

            //line was pulled low so therefore controller is sending something
            end else if (controller_sending) begin

                //counts how long a low lasts for
                if (!in_data) begin
                    zero_counter <= zero_counter + 1;
                end

                //method for checking for edge changes
                reg_cur <= in_data;
                reg_prev <= reg_cur;


                if (!reg_cur && reg_prev) begin //detects a negative edge on in_data
                    if (zero_counter > 200) begin //matches pattern of 3us low 1us high (0)
                        case (state_receive)
                            byte0: reg_byte0[byte_index] <= 0;
                            byte1: reg_byte1[byte_index] <= 0;
                            byte2: reg_byte2[byte_index] <= 0;
                            byte3: reg_byte3[byte_index] <= 0;
                            byte4: reg_byte4[byte_index] <= 0;
                            byte5: reg_byte5[byte_index] <= 0;
                            byte6: reg_byte6[byte_index] <= 0;
                            byte7: reg_byte7[byte_index] <= 0;
                        endcase
                    end else begin //matches pattern of 1us low 3us high (1)
                        case (state_receive)
                            byte0: reg_byte0[byte_index] <= 1;
                            byte1: reg_byte1[byte_index] <= 1;
                            byte2: reg_byte2[byte_index] <= 1;
                            byte3: reg_byte3[byte_index] <= 1;
                            byte4: reg_byte4[byte_index] <= 1;
                            byte5: reg_byte5[byte_index] <= 1;
                            byte6: reg_byte6[byte_index] <= 1;
                            byte7: reg_byte7[byte_index] <= 1;
                        endcase
                    end

                    done_reading_buffer <= 1;
                    zero_counter <= 0;
                end

                //logic for handling which byte to put data into
                if (done_reading_buffer) begin
                    if (byte_index == 0) begin
                        byte_index <= 7;
                        if (state_receive == byte7) begin
                            state_receive <= 0;
                            last_byte_assigned <= 1;
                        end else
                            state_receive <= state_receive + 1;
                    end else
                        byte_index <= byte_index - 1;

                    done_reading_buffer <= 0;
                end

                //reset various things so that basys board is able to send again
                if (last_byte_assigned) begin
                    console_send <= 1;
                    controller_sending <= 0;
                    delay_counter <= 0;
                    last_byte_assigned <= 0;
                end

            end
        end
    end
end


//bidirectional line logic
assign data = (console_send && packet_interval) ? out_data : 1'bz;
assign in_data = data;

endmodule