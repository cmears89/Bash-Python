#!/usr/bin/python3
import requests

base="http://192.168.57.68:8080"

r=requests.get(base+"/")
print("INDEX:")
print(r.text)

flag=""
for i in range(1,51):
 r=requests.get(base+"/"+str(i)+".html")
 flag+=r.text.strip()

print("FLAG:")
print(flag)
