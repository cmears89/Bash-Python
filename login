#!/usr/bin/python3
import requests

url="http://192.168.57.68:8080/login-1"
data={"username":"thobbes","password":"leviathan"}

r=requests.post(url,data=data)
print(r.text)
