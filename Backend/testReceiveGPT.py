import can
import zmq
import json

import sys

# Setup ZeroMQ publisher
context = zmq.Context()
socket = context.socket(zmq.PUSH)
socket.bind("tcp://127.0.0.1:5555")  # Change IP if running on another device

try:
    bus = can.interface.Bus(bustype='socketcan', channel='can0', bitrate=250000)
    print("Bus started successfully")
except can.CanError as e:
    print(f"Error starting bus: {e}")
    exit()
except OSError as e:
    print("\n##### CAN ERROR #####\nCAN Adapter not found. Check adapter USB connection to computer.\n")
    sys.exit()

try:
    while True:
        message = bus.recv(timeout=0.1)
        #txmessage = can.Message(arbitration_id=200, data=[0, 25, 0, 1, 3, 1, 4, 1], is_extended_id=False)
        #bus.send(txmessage)
        if message is not None:
            data = {
                "id": message.arbitration_id,
                "data": list(message.data),
                "timestamp": message.timestamp
            }
            socket.send_json(data)  # Send CAN data as JSON
            print(f"Sent: {data}")

except KeyboardInterrupt:
    print("Program terminated by user.")
finally:
    if 'bus' in locals():
        bus.shutdown()
        print("Bus shut down")
