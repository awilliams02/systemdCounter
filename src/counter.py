import datetime
import time
import signal
import sys 

file = open("/tmp/currentCount.out", "w")

def sigterm_handler(signum, frame):
    now = datetime.datetime.now()
    string = "Alexa: " + str(now.strftime("%Y-%m-%d %H:%M:%S")) + " Recieved SIGTERM, exiting \n"
    file.write(string)
    print('Exiting....', flush=True)
    sys.exit()

signal.signal(signal.SIGTERM, sigterm_handler)

count = 0
stop = False
while(not stop):
    now= datetime.datetime.now()
    string = "Alexa: " + str(now.strftime("%Y-%m-%d %H:%M:%S")) + " #" + str(count)
    print(string)
    file.write(string + "\n")
    count = count + 1
    time.sleep(1)

