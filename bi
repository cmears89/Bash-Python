#!/usr/bin/python3

import requests

base_url = "http://192.168.57.68:8080/bijection"

flag = ""

for i in range(100):
    url = f"{base_url}?index={i}"

    r = requests.post(url)
    text = r.text.strip()

    print(f"{i}: {repr(text)}")

    if len(text) != 1:
        print("Not getting a single character. Stopping.")
        break

    flag += text

    if text == "}":
        break

print("Flag:", flag)
