## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 

## Pull Up Resistor
set_property PULLTYPE PULLUP [get_ports data]


## LEDs
set_property PACKAGE_PIN U16 [get_ports {button_data[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[0]}]
set_property PACKAGE_PIN E19 [get_ports {button_data[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[1]}]
set_property PACKAGE_PIN U19 [get_ports {button_data[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[2]}]
set_property PACKAGE_PIN V19 [get_ports {button_data[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[3]}]
set_property PACKAGE_PIN W18 [get_ports {button_data[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[4]}]
set_property PACKAGE_PIN U15 [get_ports {button_data[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[5]}]
set_property PACKAGE_PIN U14 [get_ports {button_data[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[6]}]
set_property PACKAGE_PIN V14 [get_ports {button_data[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[7]}]
set_property PACKAGE_PIN V13 [get_ports {button_data[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[8]}]
set_property PACKAGE_PIN V3 [get_ports {button_data[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[9]}]
set_property PACKAGE_PIN W3 [get_ports {button_data[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[10]}]
set_property PACKAGE_PIN U3 [get_ports {button_data[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[11]}]
set_property PACKAGE_PIN P3 [get_ports {button_data[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[12]}]
set_property PACKAGE_PIN N3 [get_ports {button_data[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[13]}]
set_property PACKAGE_PIN P1 [get_ports {button_data[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[14]}]
set_property PACKAGE_PIN L1 [get_ports {button_data[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {button_data[15]}]


##Buttons
set_property PACKAGE_PIN U18 [get_ports reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports reset]

 
##Pmod Header JA
##Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {data}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {data}]