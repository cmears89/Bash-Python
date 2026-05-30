#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup

url="http://192.168.57.68:8080/table/"
r=requests.get(url)
soup=BeautifulSoup(r.text,"html.parser")

for row in soup.find_all("tr"):
 cells=[c.get_text(strip=True) for c in row.find_all(["td","th"])]
 print(cells)
