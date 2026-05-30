#!/usr/bin/python3

import requests

url = "http://192.168.57.68:8080/bijection"

flag = ""

for i in range(100):
    r = requests.post(url, params={"index": i})
    char = r.text.strip()

    print(f"{i}: {char}")

    flag += char

    if char == "}":
        break

print("\nFlag:", flag)
