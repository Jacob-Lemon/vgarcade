# Vgarcade


## Description

This is a fruit catching game made entirely with Verilog. It is implemented on the Basys3 FPGA board and has Gamecube controller support.

![start screen picture](https://github.com/Jacob-Lemon/vgarcade/blob/main/readme_images/start_screen.bmp)



## Table of Contents

- [Installation and Usage](#installation-and-usage)
- [Connecting a Controller](#connecting-a-controller)
- [Playing without a Controller](#playing-without-a-controller)
- [Rules and Gameplay](#rules-and-gameplay)
- [Python Scripts](#python-scripts)
- [Authors](#authors)
- [Future Plans](#future-plans)



## Installation and Usage

To generate your own bitstream, download the source files and constraints from the `vgarcade.srcs` folder and include them in a Vivado project. Keep in mind that generating a bitstream may take an hour or longer to complete. You can also program your Basys3 board directly by downloading the `vgarcade.bit` bitstream from the `game_bitstream` folder and using Vivado to program your board.

For visual output, connect the Basys3 to a VGA monitor using a VGA cable. To control the game, you can use either a Gamecube controller (see [Connecting a Controller](#connecting-a-controller) for more details) or the Basys3 switches for input (see [Playing Without a Controller](#playing-without-a-controller) for more details).



## Connecting a Controller

### Gamecube Controller Protocol in Verilog

We have implemented a simple version of the Gamecube controller protocol in Verilog. It's **very important** to connect your controller correctly to avoid damaging or shorting your controller or the Basys3 board.


### Recommended Materials

- **Gamecube Extension Cord:** [Amazon Link](https://a.co/d/5di0RBq)
- **Similar Header Pins:** [Amazon Link](https://a.co/d/1t0p9pt)


### Extension Cord Pinout

Note: Colors may differ, use a multimeter to ensure accuracy:

| Pin | Color  | Function                |
| :-: | :----: | :---------------------- |
| 1   | White  | 5V Rumble Motor Power   |
| 2   | Red    | Data Line               |
| 3   | Black  | Ground                  |
| 4   | Yellow | Ground                  |
| 5   | None   | Unused                  |
| 6   | Green  | 3.3V Controller Power   |


### Connecting the Extension Cord to the Basys3 Board

We used the extension cord linked above and tied the extension cord pinout to the header pin cord we made as follows:
1. **Pin 6 of the extension cord** (3.3V Controller Power) is connected to **Pin 1 of the homemade connection**.
2. **Pins 3 and 4 of the extension cord** (Ground) are soldered together and connected to **Pin 2 of the homemade connection**.
3. **Pin 2 of the extension cord** (Data Line) is connected to **Pin 6 of the homemade connection**.
4. **Pin 1 of the extension cord** (5V Rumble Motor Power) is not used and left inside the extension cord.

We soldered these connections to the header pins, similar to the ones linked above, and shrink-wrapped it all together.

| ![cord pins picture](https://github.com/Jacob-Lemon/vgarcade/blob/main/readme_images/gamecube_connection.png) |
| :-------------------------------: |
| *Homemade Connection and Pin Numbers* |

With the current bitstream the homemade connection must be connected to the top row of header JA in the correct orientation to function properly.

| ![connection to board picture](https://github.com/Jacob-Lemon/vgarcade/blob/main/readme_images/connection_to_board.png) |
| :-------------------------------: |
| *Connections to the Basys3 Board* |


### Important Considerations

- **Different Extension Cord:** If you have a different extension cord, you can use a multimeter to figure out your respective pinout.
- **Correct Connection:** It is very important that you connect the pins correctly to avoid shorting the controller or the Basys3 board.
- **Pull-up Resistor:** Some Gamecube protocol explanations mention connecting a pull-up resistor between the data line and the 3.3V power supply. We found that this wasn't necessary, but if you have connected everything correctly and are getting incorrect results, try using a 1k ohm pull-up resistor.

For more details on the Gamecube protocol we implemented, visit: [https://www.int03.co.uk/crema/hardware/gamecube/gc-control.html](https://www.int03.co.uk/crema/hardware/gamecube/gc-control.html)



## Playing without a Controller

If you don't have a Gamecube controller or a method to connect one, you can use the Basys3 switches to play the game as listed below:

```cpp
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

The goal of the game is to catch the falling fruit and to avoid the car that periodically comes through. Every so often power-ups will fall, the shield is activated until hit whereas the speed boost is active for 4 seconds when you press B. 



## Python Scripts

Python scripts were used to convert bmp images into rom files that Verilog could understand. The scripts that we used are listed below: 

- `python_image2verilog.py`: Used as a template and was created by Embedded Thoughts and modified by David J. Marion aka FPGA Dude. We modified this file to create 2 different styles of rom generators.

- `bmp_to_case_optimized.py`: Similar to the template but with an optimizing function that removes the lines of the most commonly referenced color and catch it in the default statement instead.

- `bmp_to_if_else_optimized.py`: A different approach to storing rom data in Verilog. We wrote the code to specify ranges of color and put them into an if else style. This code also optimizes the file and removes lines containing the most commonly referenced color and catches it in the last else statement.

- `batch_bmp_files.py`: Applies the case statement or if else rom maker method to all bmp files within a single directory. Follow the instructions within the script to use. 

There is a trade off for using each type of rom maker. The case statement method will use less LUTs but take longer to generate a bitstream and cause Vivado to be more unstable. The if else method will make storing less complex images faster and result in faster bitstreams but will crash when the if else chain is longer than 10,000 lines. We found that it was best practice to try different combinations of the two when working with big projects to find the best balance between LUT usage and bitstream generation time. 



## Authors

Jacob Lemon: [GitHub](https://github.com/Jacob-Lemon)

Easton McBeth: [GitHub](https://github.com/easton-mcbeth)



## Future Plans

- We currently have around -5 WNS, we want to go through this article and try to fix this: [AMD Forum Link](https://support.xilinx.com/s/article/9417?language=en_US)
- Add bombs/anvil/avoidable that takes a life away.
- Implement a high score system (either UART or SD card).