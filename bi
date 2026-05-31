#!/usr/bin/python3
import requests

flag = ''
index = 0

while True:
    r = requests.post(f'http://192.168.56.68:8080/bijection?index={index}')
    char = r.text.strip()
    
    if len(char) != 1:
        print(f"Bad response: {char[:50]}")
        break
    
    flag += char
    print(f"[{index}] {char} -> {flag}")
    
    if char == '}':
        break
    index += 1

print(f"\nFull flag: {flag}")
