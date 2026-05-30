#!/usr/bin/python3

import requests

url = "http://192.168.57.68:8080/bijection/"

flag = ""

for i in range(100):
    r = requests.post(url, data={"index": str(i)})
    text = r.text.strip()

    print(f"{i}: {repr(text)}")

    if len(text) != 1:
        print("Not getting a single character.")
        break

    flag += text

    if text == "}":
        break

print("\nFlag:", flag)
