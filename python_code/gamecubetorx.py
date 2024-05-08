import hid
import serial
from math import atan2, sqrt, degrees

# basys3 board serial port settings2604*2
serial_port = 'COM4'
baud_rate = 10000
# Open the serial port
ser = serial.Serial(serial_port, baud_rate)

# setup gamecube controller
gamepad = hid.device()
gamepad.open(0x0079, 0x1843)
gamepad.set_nonblocking(True)

running = True
send_again = False

a_button = 0b000
b_button = 0b000
start_button = 0b000

button_bits = 0b000
joystick_bits = 0b00000
prev_bin_to_send = None
bin_to_send = 0b00000000

# joystick deadzone
DEADZONE = 40

while running:
    report = gamepad.read(64)
    if report:
        # button logic
        if report[1] == 2:
            button_bits = 0b001
        elif report[1] == 4:
            button_bits = 0b010
        elif report[1] == 6:
            button_bits = 0b011
        elif report[2] == 2:
            button_bits = 0b100
        else:
            button_bits = 0b000

        # joystick logic
        x_pos = report[3]
        y_pos = report[4]

        # Calculate angle and magnitude of joystick position in degrees
        joystick_degree = 360 - (degrees(atan2(y_pos - 130, x_pos - 132)) % 360)
        # print(joystick_degree)
        magnitude = sqrt((x_pos - 132) ** 2 + (y_pos - 130) ** 2)

        # Check for deadzone
        if magnitude < DEADZONE:
            joystick_bits = 0b00000
        else:
            # Determine direction based on degrees
            if 337.5 < joystick_degree <= 360 or 0 <= joystick_degree < 22.5:
                joystick_bits = 0b00001
            elif 22.5 < joystick_degree <= 67.5:
                joystick_bits = 0b00010
            elif 67.5 < joystick_degree <= 112.5:
                joystick_bits = 0b00011
            elif 112.5 < joystick_degree <= 157.5:
                joystick_bits = 0b00100
            elif 157.5 < joystick_degree <= 202.5:
                joystick_bits = 0b00101
            elif 202.5 < joystick_degree <= 247.5:
                joystick_bits = 0b00110
            elif 247.5 < joystick_degree <= 292.5:
                joystick_bits = 0b00111
            elif 292.5 < joystick_degree <= 337.5:
                joystick_bits = 0b01000

    bin_to_send = (joystick_bits << 3) | button_bits


    if bin_to_send != prev_bin_to_send:
        ser.write(bytes([bin_to_send]))
        prev_bin_to_send = bin_to_send


    # Check how many bytes are available in the input buffer
    bytes_to_read = ser.inWaiting()
    if bytes_to_read:
        # Read the available bytes from the serial port
        received_data = ser.read(bytes_to_read)
        if received_data != bytes([bin_to_send]):
            ser.write(bytes([bin_to_send]))


ser.close()
gamepad.close()
