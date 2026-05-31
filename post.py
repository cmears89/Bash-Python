#!/usr/bin/python3
import requests

flag = ''
index = 0

while True:
    r = requests.post('http://192.168.56.68:8080/bijection/', data={'index': index})
    # Character is right after <div class="container">\n
    char = r.text.split('<div class="container">')[1].strip()[0]
    
    flag += char
    print(f"[{index}] {char} -> {flag}")
    
    if char == '}':
        break
    index += 1

print(f"\nFull flag: {flag}")
