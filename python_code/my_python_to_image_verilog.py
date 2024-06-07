import imageio
import math

def get_color_bits(im, y, x):
    # Convert color components to a 12-bit binary string using bitwise operations
    r, g, b = im[y, x]
    return ((r >> 4) << 8) | ((g >> 4) << 4) | (b >> 4)

def generate_verilog_module(name, im):
    y_max, x_max, _ = im.shape
    total_pixels = y_max * x_max
    row_width = math.ceil(math.log2(y_max))
    col_width = math.ceil(math.log2(x_max))
    max_index_width = len(str(total_pixels - 1))  # Width of the largest index as a string

    file_name = f"{name.split('.')[0]}_rom.v"

    module_name_thing = f"{file_name.split('/')[1]}"
    print(module_name_thing)
    
    with open(file_name, 'w') as f:
        f.write("`timescale 1ns / 1ps\n")
        f.write(f"module {module_name_thing.split('.')[0]} (\n    input wire clk,\n")
        f.write(f"    input wire [{row_width-1}:0] row,\n    input wire [{col_width-1}:0] col,\n")
        f.write("    output reg [11:0] color_data\n);\n\n")

        f.write("    always @(posedge clk) begin\n")
        
        # Initialize variables for range checking
        previous_color = get_color_bits(im, 0, 0)
        start_index = 0

        # Process each pixel, assuming linear index from row and col inputs
        for index in range(1, total_pixels):
            y = index // x_max
            x = index % x_max
            current_color = get_color_bits(im, y, x)

            # When color changes, write the previous range and color
            if current_color != previous_color:
                end_index = index - 1
                f.write(f"        if ((row * {x_max} + col) >= {start_index} && (row * {x_max} + col) <= {end_index}) color_data <= 12'b{previous_color:012b}; else\n")
                start_index = index
                previous_color = current_color

        # Handle the last range
        f.write(f"        if ((row * {x_max} + col) >= {start_index} && (row * {x_max} + col) < {total_pixels}) color_data <= 12'b{previous_color:012b}; else\n")
        f.write("        color_data <= 12'b000000000000;\n")
        f.write("    end\nendmodule\n")

def generate(name):
    im = imageio.imread(name)  # Load image
    print(f"width: {im.shape[1]}, height: {im.shape[0]}")
    generate_verilog_module(name, im)

generate("python_code/zero.bmp")  # Update the path to your bitmap file
