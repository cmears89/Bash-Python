#!/usr/bin/python3
import socket,time

h="192.168.57.68"
ports=[4032,4160,4290,4422,4556,4692,4830,4970]

for p in ports:
 s=socket.socket()
 s.settimeout(1)
 s.connect_ex((h,p))
 s.close()
 print("knocked",p)
 time.sleep(0.5)
