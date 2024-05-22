`timescale 1ns/1ps


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
			output [7:0] R_TRIGGER,
            output [3:0] flag_led
		);





//parameters for case statements
localparam [2:0] byte0 = 0,  //0,0,0,start_pause,Y,X,B,A CHANGE
                byte1 = 1,  //1,L,R,Z,D_UP,D_DOWN,D_RIGHT,D_LEFT
                byte2 = 2,  //8 bit JOY_X value
                byte3 = 3,  //8 bit JOY_Y value
                byte4 = 4,  //8 bit C_STICK_X value
                byte5 = 5,  //8 bit C_STICK_Y value
                byte6 = 6,  //8 bit L_TRIGGER value
                byte7 = 7;  //8 bit R_TRIGGER value


//bytes from controller data
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




//------------------------------------------------------------------------
//handshaking so can't do both at the same time
reg console_send;


reg [9:0] us_timer; //microsecond timer to send data
reg [19:0] packet_timer; //millisecond timer
reg packet_interval; //whether to send a packet or not

//sends data to data out
reg out_data;

reg [24:0] send_packet;
reg [4:0] index;

wire in_data;


//reg [7:0] bit_buffer;
//reg [3:0] buffer_bits_assigned;
//reg read_buffer;
reg done_reading_buffer;
reg last_byte_assigned;
reg controller_sending;
reg [2:0] state_receive;

reg [10:0] delay_counter;
reg [8:0] zero_counter;

reg [3:0] flag;

reg [2:0] byte_index;

reg reg_cur;
reg reg_prev;


//intial values
initial begin
    reg_byte0 <= 0;
    reg_byte1 <= 0;
    reg_byte2 <= 0;
    reg_byte3 <= 0;
    reg_byte4 <= 0;
    reg_byte5 <= 0;
    reg_byte6 <= 0;
    reg_byte7 <= 0;
    byte_index <= 7; //since bits come in opposite (i couldn't get a shift register working)


    us_timer <= 0;
    packet_timer <= 0;
    console_send <= 1;  //on start up it sends data packet
    packet_interval <= 1;
    out_data <= 0;
    send_packet <= 25'b0100_0000_0000_0011_0001_0000_1;
    index <= 25;

    flag <= 0;

    done_reading_buffer <= 0;
    last_byte_assigned <= 0;
    controller_sending <= 0;
    state_receive <= byte0;

    delay_counter <= 0;
    zero_counter <= 0;

    reg_cur <= 0;
    reg_prev <= 0;
end

//sends request for controller data every 10ms
always @(posedge clk) begin
   if (packet_timer < 9800) begin //make this low when receieving, not very calculated (110 us)
       packet_interval <= 1;
   end else begin
       packet_interval <= 0;
   end

   packet_timer <= packet_timer + 1;
   if (packet_timer == 1_000_000)  //10ms
       packet_timer <= 0;
end


//sends data packet
always @(posedge clk or posedge reset) begin
    if (reset) begin
        index <= 25;
    end else begin
        if (console_send && packet_interval) begin
            if (index - 1 == 0) begin   //if the stop bit
                if (us_timer == 0)
                    out_data <= 0;
            end else if (send_packet[index - 1]) begin   //if sending a 1
                if (us_timer == 0)
                    out_data <= 0;
                else if (us_timer == 100)
                    out_data <= 1;
            end else begin     //if sending a 0 
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
            
            if ((index - 1) == 0 && us_timer == 100) begin //if sending the stop bit only need 1us then drive high impedance
                us_timer <= 0;
                index <= 25;
                console_send <= 0;
            end

        //loop for receiving controller data
        end else if (!console_send) begin

            if (!controller_sending) begin
                delay_counter <= delay_counter + 1;
                if (delay_counter > 200 && !in_data) begin  //wait until low from console send finishes 
                    controller_sending <= 1;
                    delay_counter <= 0;
                    //flag <= 1;
                end else if (delay_counter == 2000) begin //20us went by without receiving controller data (not connected)
                    delay_counter <= 0;
                    console_send <= 1;
                end

            end else if (controller_sending) begin

                if (!in_data) begin
                    zero_counter <= zero_counter + 1;
                end

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
                        //flag[0] <= 0;
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
                    flag[0] <= !flag[0];
                end

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


                if (last_byte_assigned) begin
                    console_send <= 1;
                    controller_sending <= 0;
                    delay_counter <= 0;
                    last_byte_assigned <= 0;
                    //flag <= 0;
                end

            end
        end
    end
end



// assign flag_led[0] = flag[0];
// assign flag_led[2:1] = flag[2:1];

assign flag_led = flag;


assign data = (console_send && packet_interval) ? out_data : 1'bz;
assign in_data = data;

endmodule