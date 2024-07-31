# Vgarcade

## Description
This is a fruit catching arcade style game made entirely with verilog. It is implemented on the Basys3 FPGA board and has gamecube controller support.

![start screen picture](https://github.com/Jacob-Lemon/vgarcade/blob/main/readme_images/start_screen.bmp)

## Table of Contents
- [Installation and Usage](#installation-and-usage)
- [Connecting a Controller](#connecting-a-controller)
- [Playing Without a Controller](#playing-without-a-controller)
- [Rules and Gameplay](#rules-and-gameplay)
- [Authors](#authors)
- [Python Scripts Used](#python-scripts-used)
- [Future Plans](#future-plans)

## Installation and Usage
To generate your own bitstream you can download the source files and constraints from the `vgarcade.srcs` folder and include them in a vivado project. Keep in mind that generating a bitstream may take an hour or longer to complete. You can also program your Basys3 board directly by downloading the `vgarcade.bit` bitstream from the `game_bitstream` folder and use Vivado to program your board.

For visual output, connect the Basys3 to a VGA monitor using a VGA cable. To control the game you can use either a GameCube controller (see [Connecting a Controller](#connecting-a-controller) for more details) or the Basys3 switches for input (see [Playing Without a Controller](#playing-without-a-controller) for more details).

## Connecting a Controller
You can connect a gamecube controller directly to the basys3 board using a home-made connection

Gamecube Protocol we implemented is described here: [https://www.int03.co.uk/crema/hardware/gamecube/gc-control.html](https://www.int03.co.uk/crema/hardware/gamecube/gc-control.html)

Extension cord used: [Amazon Link](https://a.co/d/5di0RBq)

Extension cord pinout (colors may differ, use a multimeter to ensure accuracy): 

| Pin      | Color     | Function                |
| :---:    | :----:    |  :---:                  |
| 1        | White     | 5V Rumble Motor Power   |
| 2        | Red       | Data Line               |
| 3        | Black     | Ground                  |
| 4        | Yellow    | Ground                  |
| 5        | None      | Unused                  |
| 6        | Green     | 3.3V Controller Power   |

Similar header pins: [Amazon Link](https://a.co/d/1t0p9pt)

This home-made connection only uses the 3.3v supply pin, ground pins (tied together), and the data pin. 

![cord pins picture](https://github.com/Jacob-Lemon/vgarcade/blob/main/readme_images/gamecube_connection.png)

![connection to board picture](https://github.com/Jacob-Lemon/vgarcade/blob/main/readme_images/connection_to_board.png)



## Playing Without a Controller
If you don't have a gamecube controller or a method to connect one, you can use the Basys 3 board switches to play the game as listed below:

```swift
sw[0] = A
sw[1] = B
sw[2] = X
sw[3] = Y
sw[4] = start_pause
sw[5] = L
sw[6] = R
sw[7] = Z
sw[8] = D_UP
sw[9] = D_DOWN
sw[10] = D_RIGHT
sw[11] = D_LEFT
```

## Rules and Gameplay
![instructions picture](https://github.com/Jacob-Lemon/vgarcade/blob/main/readme_images/instructions.bmp)

The goal of the game is to catch the falling fruit and to avoid the car that periodically comes through. Every so often powerups will fall, the shield is activated until hit whereas the speed boost is actived for 4 seconds when you press B. 


## Authors
Jacob Lemon: [Github](https://github.com/Jacob-Lemon)

Easton McBeth: [Github](https://github.com/easton-mcbeth)


## Python Scripts Used
Python scripts were used to convert bmp images into rom files that verilog could understand. The scripts that we used are listed below: 

- `python_image2verilog.py`: Used as a template and was created by embedded thoughts and modified by David J. Marion aka FPGA Dude. We modified this file to create 2 different styles of rom generators.

- `bmp_to_case_optimized.py`: Similar to the template but with an optimizing function that was added to remove the lines of the most commonly referenced color and catch it in the default statement instead.

- `bmp_to_if_else_optimized.py`: A different approach to storing rom data in verilog. We wrote the code to specify ranges of color and put them into an if else style. This code also optimizes the file and removes lines containing the most commonly referenced color and catches it in the last else statement.

- `batch_bmp_files.py`: Applies the case statement or if else rom maker method to all bmp files within a single directory. Follow the instructions within the script to use. 

There is a trade off for using each type of rom maker. The case statement method will use less LUTs but take longer to generate a bitstream and cause Vivado to be more unstable. The if else method will make storing less complex images faster and result in faster bitstreams but will crash when the if else chain is longer than 10,000 lines. We found that it was best practice to try different combinations of the two when working with big projects in order to find the best balance between LUT usage and bitstream generation time. 

## Future Plans

- We currently have around -5 WNS, we want to go through this article and try to fix this: [AMD Forum Link](https://support.xilinx.com/s/article/9417?language=en_US)
- Add bombs/anvil/avoidable that takes a life away
- Implement a high score system (either UART or SD card)