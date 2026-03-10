import zmq
import json
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

context = zmq.Context()
socket = context.socket(zmq.PULL)
socket.connect("tcp://127.0.0.1:5555")
#socket.setsockopt_string(zmq.SUBSCRIBE, "")  # Subscribe to all messages

# Example: Extract RPM from CAN ID 0x100 (Modify as needed)
rpm_value = 0

def update_plot(frame):
    global rpm_value
    try:
        message = socket.recv_json(flags=zmq.NOBLOCK)
        if message["id"] == 0x100:  # Modify based on your CAN message structure
            rpm_value = message["data"][1] * 10  # Example conversion
            print(f"RPM: {rpm_value}")
        
    except zmq.Again:
        pass  # No new data

    plt.clf()
    plt.ylim(0, 2000)  # Adjust RPM range as needed
    plt.bar(["RPM"], [rpm_value])
    plt.title(f"Current RPM: {rpm_value}")

fig = plt.figure()
ani = FuncAnimation(fig, update_plot, interval=1)
plt.show()