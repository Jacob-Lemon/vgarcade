# vgarcade

## Description
This is an arcade style game created using verilog and stuff

![picture of Game](https://github.com/Jacob-Lemon/vgarcade/blob/main/readme_images/start_screen.bmp)

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Authors](#authors)
- [Contributing](#contributing)
- [License](#license)
- [more](#more-stuff)

## installation
If you want to generate your own bitstream, you can download or install this however you want.
If you just want to program your own basys3, you can just download the top.bit bitstream and use vivado to program your board.

## usage
Visual output is done through a vga monitor. Connect the basys3 to the monitor using a vga cable.
Use with a gamecube controller or the basys3 switches.

### gamecube controller
You can connect a gamecube controller directly to the basys3 board using a home-made connection
![picture of connection](https://github.com/Jacob-Lemon/vgarcade/blob/main/readme_images/gamecube_connection.png)
Gamecube Protocol we implemented is described here: [https://www.int03.co.uk/crema/hardware/gamecube/gc-control.html](https://www.int03.co.uk/crema/hardware/gamecube/gc-control.html)
Extension cord used: [Link to Amazon](https://a.co/d/5di0RBq)



### basys3 switches
If you don't have a controller, you can use these switches to play the game anyway using the basys3 switches
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


## features
This game is super cool.
## authors
Easton McBeth
## Look into Later?

- This AMD Forum gives suggestions on how to solve timing issues: [https://support.xilinx.com/s/article/9417?language=en_US](https://support.xilinx.com/s/article/9417?language=en_US)
- Add Bombs/anvil/avoidable that takes a life away
- implement a high score system (either uart or sd card)
- Make a pong multiplayer game
