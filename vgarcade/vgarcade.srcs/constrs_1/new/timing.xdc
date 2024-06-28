create_generated_clock -name {vc/r_25MHz[0]} -source [get_ports clk_100MHz] -divide_by 4 [get_pins {vc/r_25MHz_reg[0]/Q}]
create_generated_clock -name {vc/r_25MHz[1]} -source [get_ports clk_100MHz] -divide_by 4 [get_pins {vc/r_25MHz_reg[1]/Q}]
create_clock -period 40.000 -name {VIRTUAL_vc/r_25MHz[0]} -waveform {0.000 20.000}
set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports {sw[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 1.000 [get_ports {sw[*]}]
set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports data]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 1.000 [get_ports data]
set_input_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports reset]
set_input_delay -clock [get_clocks sys_clk_pin] -max -add_delay 1.000 [get_ports reset]
set_input_delay -clock [get_clocks {VIRTUAL_vc/r_25MHz[0]}] -clock_fall -min -add_delay 0.000 [get_ports reset]
set_input_delay -clock [get_clocks {VIRTUAL_vc/r_25MHz[0]}] -clock_fall -max -add_delay 4.000 [get_ports reset]

set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports {rgb[*]}]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 1.000 [get_ports {rgb[*]}]

set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports {button_data[*]}]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 1.000 [get_ports {button_data[*]}]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports data]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 1.000 [get_ports data]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports hsync]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 1.000 [get_ports hsync]
set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports vsync]
set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 1.000 [get_ports vsync]


#set_output_delay -clock [get_clocks sys_clk_pin] -min -add_delay 0.000 [get_ports intermediate_rom_number_data_reg[8]]
#set_output_delay -clock [get_clocks sys_clk_pin] -max -add_delay 1.000 [get_ports intermediate_rom_number_data_reg[8]]


