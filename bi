#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup

urls=[
 "http://192.168.57.68:8080/bijection",
 "http://192.168.57.68:8080/bijection/",
 "http://192.168.57.68:8080/bijection/index.php"
]

for u in urls:
 print("TESTING",u)
 r=requests.post(u,data={"index":"3"})
 text=BeautifulSoup(r.text,"html.parser").get_text("\n",strip=True)
 print(text[-500:])
 print()
