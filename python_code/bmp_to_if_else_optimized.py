import imageio.v2 as imageio
import math
import re
from collections import Counter

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

    module_name_thing = f"{file_name.split('/')[0]}"
    print(module_name_thing)
    
    with open(file_name, 'w') as f:
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
        f.write("    end\nendmodule")

    optimize_verilog_file(file_name)

def optimize_verilog_file(file_path):
    # Read the file
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # Extract all color data values
    color_data_pattern = re.compile(r"12'b[01]{12}")
    color_values = [match.group(0) for line in lines for match in color_data_pattern.finditer(line)]

    # Determine the most common color value
    most_common_color = Counter(color_values).most_common(1)[0][0]

    # Process lines: remove those with the most common color value
    processed_lines = []
    for line in lines:
        if most_common_color in line and "if" in line:
            continue  # Skip lines containing the most common color value
        if "color_data <=" in line and "if" not in line:
            line = f"        color_data <= {most_common_color};\n"
        processed_lines.append(line)

    # Write the processed lines back to the file
    with open(file_path, 'w') as file:
        file.writelines(processed_lines)

def generate(name):
    im = imageio.imread(name)  # Load image
    print(f"width: {im.shape[1]}, height: {im.shape[0]}")
    generate_verilog_module(name, im)




generate("xfill.bmp")  # Update the path to your bitmap file
