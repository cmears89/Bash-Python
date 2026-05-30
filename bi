#!/usr/bin/python3

import requests

base_url = "http://192.168.57.68:8080/bijection"

flag = ""

for index in range(100):
    response = requests.post(base_url, params={"index": index})
    char = response.text.strip()

    if not char:
        break

    flag += char
    print(flag)

    if char == "}":
        break

print("Final flag:", flag)
