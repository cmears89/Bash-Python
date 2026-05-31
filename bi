#!/usr/bin/python3
import requests

url = 'http://192.168.56.68:8080/bijection'
flag = ''
index = 0

while True:
    post = requests.post(url, data={'index': index})
    char = post.text.strip()
    
    # Stop if response is too long (getting HTML back instead of a char)
    if len(char) > 1:
        print(f"Unexpected response at index {index}: {char[:50]}")
        break
        
    flag += char
    print(f"[{index}] {char} -> {flag}")
    
    if char == '}':
        break
    index += 1

print(f"\nFull flag: {flag}")
