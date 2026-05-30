#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin

base="http://192.168.57.68:8080/crawling/"
seen=set()
todo=[base]

while todo:
 url=todo.pop()
 if url in seen:
  continue
 seen.add(url)

 r=requests.get(url)
 print("checking",url)

 if "OS{" in r.text:
  print(r.text)
  break

 soup=BeautifulSoup(r.text,"html.parser")
 for a in soup.find_all("a"):
  href=a.get("href")
  if href:
   nxt=urljoin(url,href)
   if "/crawling" in nxt and nxt not in seen:
    todo.append(nxt)
