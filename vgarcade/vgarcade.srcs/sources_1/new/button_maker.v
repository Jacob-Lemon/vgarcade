module button_maker (
    input clk,
    input [9:0] x, y,
    input [9:0] x_position, y_position, //all button roms are in the same location as the input background for simplicity
    input [9:0] size_x, size_y,  //all button roms are the same size as the input background for simplicity
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
    output button_on,
    output [11:0] button_rgb_data
);


// used for all button rom instantiations
wire [9:0] button_row, button_col;

// boundaries
wire [9:0] left_bound;
wire [9:0] right_bound;
wire [9:0] up_bound;
wire [9:0] down_bound;

assign left_bound  = x_position;
assign right_bound = x_position + size_x;
assign up_bound    = y_position;
assign down_bound  = y_position + size_y;

assign button_col = x - left_bound;
assign button_row = y - up_bound;




// all button rom data signals
wire [11:0] a_rom_data;
wire [11:0] b_rom_data;
wire [11:0] x_rom_data;
wire [11:0] y_rom_data;
wire [11:0] start_rom_data;
wire [11:0] l_rom_data;
wire [11:0] r_rom_data;
wire [11:0] z_rom_data;
wire [11:0] d_up_rom_data;
wire [11:0] d_down_rom_data;
wire [11:0] d_right_rom_data;
wire [11:0] d_left_rom_data;


// all buttons' "on" signals
wire a_on;
wire b_on;
wire x_on;
wire y_on;
wire start_on;
wire l_on;
wire r_on;
wire z_on;
wire d_up_on;
wire d_down_on;
wire d_right_on;
wire d_left_on;


// all buttons' rom logic
assign a_on = (a_rom_data != 12'hFFF);
assign b_on = (b_rom_data != 12'hFFF);
assign x_on = (x_rom_data != 12'h000);
assign y_on = (y_rom_data != 12'h000);
assign start_on = (start_rom_data != 12'h000);
assign l_on = (l_rom_data != 12'h000);
assign r_on = (r_rom_data != 12'h000);
assign z_on = (z_rom_data != 12'hFFF);
assign d_up_on = (d_up_rom_data != 12'h000);
assign d_down_on = (d_down_rom_data != 12'h000);
assign d_right_on = (d_right_rom_data != 12'h000);
assign d_left_on = (d_left_rom_data != 12'h000);



//logic for when to draw the buttons
assign button_on = (x > left_bound) && (x <= right_bound) &&
                  (y >= up_bound)   && (y < down_bound) &&
                  ((A && a_on) || (B && b_on) || (X && x_on) || (Y && y_on) || (start_pause && start_on) ||
                   (L && l_on) || (R && r_on) || (Z && z_on) || (D_UP && d_up_on) || (D_DOWN && d_down_on) ||
                   (D_RIGHT && d_right_on) || (D_LEFT && d_left_on));




//    all button rom instantiations

afill_rom a_but (
    .clk(clk),
    .row(button_row),
    .col(button_col),
    .color_data(a_rom_data)
);

bfill_rom b_but (
    .clk(clk),
    .row(button_row),
    .col(button_col),
    .color_data(b_rom_data)
);

xfill_rom x_but (
    .clk(clk),
    .row(button_row),
    .col(button_col),
    .color_data(x_rom_data)
);

yfill_rom y_but (
    .clk(clk),
    .row(button_row),
    .col(button_col),
    .color_data(y_rom_data)
);

startfill_rom start_but (
    .clk(clk),
    .row(button_row),
    .col(button_col),
    .color_data(start_rom_data)
);

lfill_rom l_but (
    .clk(clk),
    .row(button_row),
    .col(button_col),
    .color_data(l_rom_data)
);

rfill_rom r_but (
    .clk(clk),
    .row(button_row),
    .col(button_col),
    .color_data(r_rom_data)
);

zfill_rom z_but (
    .clk(clk),
    .row(button_row),
    .col(button_col),
    .color_data(z_rom_data)
);

dupfill_rom dup_but (
    .clk(clk),
    .row(button_row),
    .col(button_col),
    .color_data(d_up_rom_data)
);

ddownfill_rom ddown_but (
    .clk(clk),
    .row(button_row),
    .col(button_col),
    .color_data(d_down_rom_data)
);

drightfill_rom dright_but (
    .clk(clk),
    .row(button_row),
    .col(button_col),
    .color_data(d_right_rom_data)
);

dleftfill_rom dleft_but (
    .clk(clk),
    .row(button_row),
    .col(button_col),
    .color_data(d_left_rom_data)
);




// logic for displaying buttons
reg [11:0] intermediate_rgb;
always @(posedge clk) begin
    if (a_on && A)
        intermediate_rgb <= a_rom_data;
    else if (b_on && B)
        intermediate_rgb <= b_rom_data;
    else if (x_on && X)
        intermediate_rgb <= x_rom_data;
    else if (y_on && Y)
        intermediate_rgb <= y_rom_data;
    else if (start_on && start_pause)
        intermediate_rgb <= start_rom_data;
    else if (l_on && L)
        intermediate_rgb <= l_rom_data;
    else if (r_on && R)
        intermediate_rgb <= r_rom_data;
    else if (z_on && Z)
        intermediate_rgb <= z_rom_data;
    else if (d_up_on && D_UP)
        intermediate_rgb <= d_up_rom_data;
    else if (d_down_on && D_DOWN)
        intermediate_rgb <= d_down_rom_data;
    else if (d_right_on && D_RIGHT)
        intermediate_rgb <= d_right_rom_data;
    else if (d_left_on && D_LEFT)
        intermediate_rgb <= d_left_rom_data;
    else
        intermediate_rgb <= 12'h000;
end


// rgb that contains all button data
assign button_rgb_data = intermediate_rgb;


endmodule