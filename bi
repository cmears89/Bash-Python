#!/usr/bin/python3
import requests

url = 'http://192.168.56.68:8080/bijection'
flag = ''
index = 0

while True:
    post = requests.post(url, params={'index': index})
    char = post.text.strip()
    flag += char
    print(f"[{index}] {char} -> {flag}")
    if char == '}':
        break
    index += 1

print(f"\nFull flag: {flag}")
