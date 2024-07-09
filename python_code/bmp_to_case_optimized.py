import imageio.v2 as imageio
import math
import re
from collections import Counter

# Returns string of 12-bit color at row x, column y of image
def get_color_bits(im, y, x):
    # Convert color components to byte string and slice needed upper bits
    b  = format(im[y][x][0], 'b').zfill(8)
    rx = b[0:4]
    b  = format(im[y][x][1], 'b').zfill(8)
    gx = b[0:4]
    b  = format(im[y][x][2], 'b').zfill(8)
    bx = b[0:4]

    # Return concatenation of RGB bits
    return str(rx+gx+bx)

# Write to file Verilog HDL
# Takes name of file, image array,
# pixel coordinates of background color to mask as 0
def rom_12_bit(name, im, mask=False, rem_x=-1, rem_y=-1):
    # Get colorbyte of background color
    # If coordinates left at default, map all data without masking
    if rem_x == -1 or rem_y == -1:
        a = "000000000000"
    # Else set mask compare byte
    else:
        a = get_color_bits(im, rem_x, rem_y)

    # Make output filename from input
    file_name = name.split('.')[0] + "_rom.v"

    # Open file
    f = open(file_name, 'w')

    # Get image dimensions
    y_max, x_max, z = im.shape

    # Get width of row and column case words
    row_width = math.ceil(math.log(y_max-1,2))
    col_width = math.ceil(math.log(x_max-1,2))

    # Write beginning part of module up to case statements
    f.write("module " + name.split('.')[0] + "_rom\n\t(\n\t\t")
    f.write("input wire clk,\n\t\tinput wire [" + str(row_width-1) + ":0] row,\n\t\t")
    f.write("input wire [" + str(col_width-1) + ":0] col,\n\t\t")
    f.write("output reg [11:0] color_data\n\t);\n\n\t")
    f.write("(* rom_style = \"block\" *)\n\n\t//signal declaration\n\t")
    f.write("reg [" + str(row_width-1) + ":0] row_reg;\n\t")
    f.write("reg [" + str(col_width-1) + ":0] col_reg;\n\n\t")
    f.write("always @(posedge clk)\n\t\tbegin\n\t\trow_reg <= row;\n\t\tcol_reg <= col;\n\t\tend\n\n\t")
    f.write("always @*\n\tcase ({row_reg, col_reg})\n")
    
    # Loops through y rows and x columns
    for y in range(y_max):
        for x in range(x_max):
            # Write : color_data = 
            case = format(y, 'b').zfill(row_width) + format(x, 'b').zfill(col_width)
            f.write("\t\t" + str(row_width + col_width) + "'b" + case + ": color_data = " + str(12) + "'b")

            # If mask is set to false, just write color data
            if(mask == False):
                f.write(get_color_bits(im, y, x))
                f.write(";\n")
            elif(get_color_bits(im, y, x) != a):
                # Write color bits to file
                f.write(get_color_bits(im, y, x))
                f.write(";\n")
            else:
                f.write("000000000000;\n")
                
    # Write end of module
    f.write("\t\tdefault: color_data = 12'b000000000000;\n\tendcase\nendmodule")

    # Close file
    f.close()

    # Optimize the Verilog file
    process_verilog_file(file_name)

# Process the Verilog file to optimize it
def process_verilog_file(file_path):
    # Read the file
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # Extract all color data values
    color_data_pattern = re.compile(r"12'b[01]{12}")
    color_values = [match.group(0) for line in lines for match in color_data_pattern.finditer(line)]

    # Determine the most common color value
    most_common_color = Counter(color_values).most_common(1)[0][0]
    print(most_common_color)

    # Process lines: remove those with the most common color value
    processed_lines = []
    for line in lines:
        if most_common_color in line and "default" not in line:
            continue  # Skip lines containing the most common color value
        if "default" in line:
            line = f"        default: color_data = {most_common_color};\n"
        processed_lines.append(line)

    # Write the processed lines back to the file
    with open(file_path, 'w') as file:
        file.writelines(processed_lines)

# Driver function
def generate(name, rem_x=-1, rem_y=-1):
    im = imageio.imread(name)
    print("width: " + str(im.shape[1]) + ", height: " + str(im.shape[0]))
    rom_12_bit(name, im)

generate("c_stick.bmp")  # Update the path to your bitmap file
