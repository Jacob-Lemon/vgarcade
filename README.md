# Vgarcade

## Description
This is an arcade style game created using verilog and stuff

![start screen picture](https://github.com/Jacob-Lemon/vgarcade/blob/main/readme_images/start_screen.bmp)

## Table of Contents
- [Installation and Usage](#installation-and-usage)
- [Connecting a Controller](#connecting-a-controller)
- [Playing Without a Controller](#playing-without-a-controller)
- [Rules and Gameplay](#rules-and-gameplay)
- [Authors](#authors)
- [Future Plans](#future-plans)

## Installation and Usage
If you want to generate your own bitstream, you can download or install this however you want. Keep in mind that a bitstream may take an hour or longer to complete. \
If you just want to program your own basys3, you can just download the vgarcade.bit bitstream from the game_bitstream folder and use vivado to program your board. \

Visual output is done through a vga monitor. Connect the basys3 to the monitor using a vga cable. \
Use with a gamecube controller or the basys3 switches.

## Connecting a Controller
You can connect a gamecube controller directly to the basys3 board using a home-made connection

Gamecube Protocol we implemented is described here: [https://www.int03.co.uk/crema/hardware/gamecube/gc-control.html](https://www.int03.co.uk/crema/hardware/gamecube/gc-control.html) \
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
- sw[0] = A;
- sw[1] = B;
- sw[2] = X;
- sw[3] = Y;
- sw[4] = start_pause;
- sw[5] = L;
- sw[6] = R;
- sw[7] = Z;
- sw[8] = D_UP;
- sw[9] = D_DOWN;
- sw[10] = D_RIGHT;
- sw[11] = D_LEFT;


## Rules and Gameplay
![instructions picture](https://github.com/Jacob-Lemon/vgarcade/blob/main/readme_images/instructions.bmp)


## Authors
Jacob Lemon: [Github](https://github.com/Jacob-Lemon) \
Easton McBeth: [Github](https://github.com/easton-mcbeth)

## Future Plans

- This AMD Forum gives suggestions on how to solve timing issues: [AMD Forum Link](https://support.xilinx.com/s/article/9417?language=en_US)
- Add Bombs/anvil/avoidable that takes a life away
- implement a high score system (either uart or sd card)