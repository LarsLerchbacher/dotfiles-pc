from datetime import datetime
from math import floor
import os

def progress_to_next_2h():
    uptime = float(os.popen("uptime -r").read().split(" ")[1])

    # Remove the time of every previous iteration (2 hours + 10 min pause)
    elapsed = uptime - (floor(uptime / 7800) * 7800)

    if (elapsed / 7200) >= 1.0:
        os.system("notify-send 'Take a break!'")

    # current progress / 2h, max prevents the time from going above 100%
    progress = min((elapsed / 7200), 1.0) * 100
    return round(progress, 2)

print(f"{progress_to_next_2h()}")
