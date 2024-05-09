import hid # type: ignore

for device in hid.enumerate():
    print(f"0x{device['vendor_id']:04x}:0x{device['product_id']:04x} {device['product_string']}")

gamepad = hid.device()
gamepad.open(0x0079, 0x1843)
gamepad.set_nonblocking(True)

button2_pressed = False
toggle = False

while True:
    report = gamepad.read(64)
    if report:
        if report[1] == 49:
            toggle = True
        elif report[1] == 56:
            toggle = False
        elif toggle:
            print(report)
        elif report[2] == 2:
            button2_pressed = True
        elif button2_pressed and report[2] != 2:
            print(report)
            button2_pressed = False