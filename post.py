#!/usr/bin/python3
import requests
import re

url="http://192.168.57.68:8080/bijection"
flag=""

for i in range(100):
 r=requests.post(url,data={"index":i})
 chars=re.findall(r"character '(.)'",r.text)

 if not chars:
  print("no char at",i)
  break

 c=chars[-1]
 flag+=c
 print(flag)

 if c=="}":
  break

print("FLAG:",flag)
