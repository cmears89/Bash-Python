#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup

url="http://192.168.57.68:8080/bijection"
flag=""

for i in range(100):
 r=requests.post(url,data={"index":str(i)})
 text=BeautifulSoup(r.text,"html.parser").get_text("\n",strip=True)
 lines=text.splitlines()

 c=lines[-1].strip()
 flag+=c

 print(i,c,flag)

 if c=="}":
  break

print("FLAG:",flag)
