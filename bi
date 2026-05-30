#!/usr/bin/python3
import requests
import re

url="http://192.168.57.68:8080/bijection"
flag=""

for i in range(100):
 r=requests.post(url,data={"index":str(i)})
 chars=re.findall(r"'(.)'",r.text)

 print(i, chars)

 if len(chars) < 4:
  print("not enough chars")
  break

 c=chars[-1]
 flag+=c
 print("FLAG:",flag)

 if c=="}":
  break
