#!/usr/bin/python3
import requests

base="http://192.168.57.68:8080/bijection"
flag=""

for i in range(100):
 r=requests.post(base+"?index="+str(i))
 c=r.text.strip()

 print(i, repr(c))

 if c == "" or "error" in c.lower():
  break

 flag += c

 if c == "}":
  break

print("FLAG:",flag)
