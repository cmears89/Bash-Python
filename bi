#!/usr/bin/python3
import requests
import re

flag=""

for i in range(100):
 url="http://192.168.57.68:8080/bijection?index="+str(i)
 r=requests.post(url)

 pattern=r"/bijection\?index="+str(i)+r" will return the character '(.)'"
 m=re.search(pattern,r.text)

 if not m:
  print("no match for",i)
  print(r.text[:500])
  break

 c=m.group(1)
 flag+=c
 print(i,c,flag)

 if c=="}":
  break

print("FLAG:",flag)
