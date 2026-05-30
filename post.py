#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup

base="http://192.168.57.68:8080/bijection"
flag=""

for i in range(100):
 r=requests.post(base+"?index="+str(i))
 text=BeautifulSoup(r.text,"html.parser").get_text("",strip=True)

 print(i, repr(text))

 if text == "" or "error" in text.lower():
  break

 flag += text

 if text == "}":
  break

print("FLAG:",flag)
