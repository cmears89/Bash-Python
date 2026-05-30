#!/usr/bin/python3

import requests

url = "http://192.168.57.68:8080/bijection"

flag = ""

for i in range(100):
    r = requests.post(url, params={"index": i})

    char = r.text.strip()

    if not char:
        break

    flag += char
    print(flag)

    if char == "}":
        break

print("\nFinal flag:", flag)
