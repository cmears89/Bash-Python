#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup

url="http://192.168.57.68:8080/bijection"
flag=""

for i in range(100):
 r=requests.post(url,data={"index":i})
 text=BeautifulSoup(r.text,"html.parser").get_text("\n",strip=True)
 lines=text.splitlines()

 c=lines[-1].strip()

 print(i,repr(c))

 flag+=c

 if c=="}":
  break

print("FLAG:",flag)
