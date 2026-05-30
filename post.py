#!/usr/bin/python3
import requests
import re

url="http://192.168.57.68:8080/bijection"
flag=""

for i in range(100):
 r=requests.post(url,data={"index":i})
 text=r.text

 m=re.search(r"character '(.+?)'",text)
 if not m:
  print("no match at",i)
  print(text[:200])
  break

 c=m.group(1)
 flag+=c
 print(flag)

 if c=="}":
  break

print("FLAG:",flag)
