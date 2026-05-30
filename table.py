#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup

url="http://192.168.57.68:8080/table/"
r=requests.get(url)
soup=BeautifulSoup(r.text,"html.parser")

flag=""

for row in soup.find_all("tr")[1:]:
 cells=[c.get_text(strip=True) for c in row.find_all("td")]
 flag+="".join(cells)

print(flag)
