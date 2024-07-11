import os
from bmp_to_if_else_optimized import generate    # uncomment this to generate all bmp files to case statement method
# from bmp_to_case_optimized import generate     # uncomment this to generate all bmp files to if else method

# Function to process all BMP files in a directory
def process_bmp_files(directory, output_dir):
    bmp_files = [file for file in os.listdir(directory) if file.endswith(".bmp")]
    for bmp_file in bmp_files:
        generate(bmp_file, output_dir)

# Example usage:
process_bmp_files("C:/path/to/all/bmps", "C:/path/to/output/rom/files")  # Replace with your directory path
