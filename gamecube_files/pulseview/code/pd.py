import sigrokdecode as srd

class Decoder(srd.Decoder):
    api_version = 3
    id = 'Gamecube'
    name = 'Gamecube Controller'
    longname = 'Gamecube Protocol Analyzer'
    desc = 'Show the Console data packet and corresponding controller response'
    license = 'gplv2+'
    inputs = ['logic']
    outputs = []
    tags = ['Retro computing']
    channels = (
        {'id': 'data', 'name': 'Data', 'desc': 'Data channel'},
    )
    options = (
    )
    annotations = (
        ('Packet', 'Bit'),
        ('Data', 'Value'),
        ('Byte', 'Bytes_length'),
        ('Button', 'Buttons'),
    )
    annotation_rows = (
        ('packets', 'Bits', (0,)),
        ('data', 'Values', (1,)),
        ('Bytes', 'Bytes_length', (2,)),
        ('Button_states', 'Buttons', (3,)),
    )

    def __init__(self):
        self.reset()

    def reset(self):
        self.samplerate = None
        self.val = 0
        self.prevN = 0
        self.edge_count = 0  # Counter for edges
        self.packet_start = None  # Start of the current packet
        self.counter = 0
        self.test = 0
        self.begin_packet = 0
        self.controller_data = 0
        self.byte_assigning = 0
        self.begin_byte = 0
        self.byte_index = 7
        self.bits = []

    def metadata(self, key, value):
        if key == srd.SRD_CONF_SAMPLERATE:
            self.samplerate = value

    def start(self):
        self.out_ann = self.register(srd.OUTPUT_ANN)

    def decode(self):
        self.bits = []

        if self.samplerate is None:
            raise Exception('Cannot decode without samplerate.')

        while True:
            # Look for an edge
            v, = self.wait([{0: 'e'}]) 
            n = self.samplenum

            # Calculate time difference
            t = (n - self.prevN) / self.samplerate

            # No data being sent (reset some values just in case)
            if t >= 5e-3:
                self.test = n
                self.counter = 0
                self.begin_packet = n
                self.byte_assigning = 0
                self.begin_byte = n
                self.byte_index = 7
                self.bits = []

            # this means data is being sent and its a falling edge
            if t < 5e-3 and self.val:

                # Puts the bit value
                if t > 2e-6:
                    self.put(self.test, n, self.out_ann, [0, [str(1)]])
                else:
                    self.put(self.test, n, self.out_ann, [0, [str(0)]])


                self.counter += 1

                # 24 bits past means end of console packet
                if self.counter == 24:
                    self.put(self.begin_packet, n, self.out_ann, [1, ["Console Packet"]])
                    self.begin_byte = n

                # 25th bit is the stop bit
                elif self.counter == 25:
                    self.put(self.begin_byte, n, self.out_ann, [1, ["Stop Bit"]])
                    self.controller_data = n
                    self.begin_byte = n

                # End of the controller data
                elif self.counter == 89:
                    self.put(self.controller_data, n, self.out_ann, [1, ["Controller Data"]])
                    self.controller_data = 0

                # In the Controller data range
                if self.counter > 25:
                    if t > 2e-6:
                        self.bits.append(1)
                        bit_to_enter = 1
                    else:
                        self.bits.append(0)
                        bit_to_enter = 0

                    # keep track of index of byte and decode what button it is
                    if self.byte_assigning < 2:
                        self.decode_buttons(self.test, n, self.byte_assigning, self.byte_index, bit_to_enter)
                        self.byte_index -= 1

                # keeps track of which byte it is on
                if len(self.bits) == 8:
                    self.byte_lengths(self.begin_byte, n, self.byte_assigning, self.bits)
                    self.begin_byte = n
                    self.bits = []
                    self.byte_assigning += 1
                    self.byte_index = 7
                
                #probably should change this variable
                self.test = n


            # Update the previous sample number
            self.prevN = n
            self.val = v

    # Function to put the byte number and joystick/trigger values
    def byte_lengths(self, start, end, byte_num, byte_val):
        if byte_num == 0:
            self.put(start, end, self.out_ann, [2, ["Byte 0"]])
        elif byte_num == 1:
            self.put(start, end, self.out_ann, [2, ["Byte 1"]])
        elif byte_num == 2:
            self.put(start, end, self.out_ann, [2, ["Byte 2"]])
            self.put(start, end, self.out_ann, [3, ["Joy X = " + str(int(''.join(map(str, byte_val)), 2))]])
        elif byte_num == 3:
            self.put(start, end, self.out_ann, [2, ["Byte 3"]])
            self.put(start, end, self.out_ann, [3, ["Joy Y = " + str(int(''.join(map(str, byte_val)), 2))]])
        elif byte_num == 4:
            self.put(start, end, self.out_ann, [2, ["Byte 4"]])
            self.put(start, end, self.out_ann, [3, ["C Stick X = " + str(int(''.join(map(str, byte_val)), 2))]])
        elif byte_num == 5:
            self.put(start, end, self.out_ann, [2, ["Byte 5"]])
            self.put(start, end, self.out_ann, [3, ["C Stick Y = " + str(int(''.join(map(str, byte_val)), 2))]])
        elif byte_num == 6:
            self.put(start, end, self.out_ann, [2, ["Byte 6"]])
            self.put(start, end, self.out_ann, [3, ["L Trigger = " + str(int(''.join(map(str, byte_val)), 2))]])
        elif byte_num == 7:
            self.put(start, end, self.out_ann, [2, ["Byte 7"]])
            self.put(start, end, self.out_ann, [3, ["R Trigger = " + str(int(''.join(map(str, byte_val)), 2))]])
            self.byte_assigning = 0
            self.byte_index = 0

    # function to put the button data
    def decode_buttons(self, start, end, byte, index, bit):
        if byte == 0:
            if index == 0:
                self.put(start, end, self.out_ann, [3, ["A = " + str(bit)]])
            elif index == 1:
                self.put(start, end, self.out_ann, [3, ["B = " + str(bit)]])
            elif index == 2:
                self.put(start, end, self.out_ann, [3, ["X = " + str(bit)]])
            elif index == 3:
                self.put(start, end, self.out_ann, [3, ["Y = " + str(bit)]])
            elif index == 4:
                self.put(start, end, self.out_ann, [3, ["Start = " + str(bit)]])
        elif byte == 1:
            if index == 0:
                self.put(start, end, self.out_ann, [3, ["D_LEFT = " + str(bit)]])
            elif index == 1:
                self.put(start, end, self.out_ann, [3, ["D_RIGHT = " + str(bit)]])
            elif index == 2:
                self.put(start, end, self.out_ann, [3, ["D_DOWN = " + str(bit)]])
            elif index == 3:
                self.put(start, end, self.out_ann, [3, ["D_UP = " + str(bit)]])
            elif index == 4:
                self.put(start, end, self.out_ann, [3, ["Z = " + str(bit)]])
            elif index == 5:
                self.put(start, end, self.out_ann, [3, ["R = " + str(bit)]])
            elif index == 6:
                self.put(start, end, self.out_ann, [3, ["L = " + str(bit)]])