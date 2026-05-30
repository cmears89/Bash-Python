#!/usr/bin/python3
import socket

target="192.168.57.68"

for port in range(3000,4000):
 s=socket.socket()
 s.settimeout(0.5)
 r=s.connect_ex((target,port))
 if r==0:
  print(port)
 s.close()
