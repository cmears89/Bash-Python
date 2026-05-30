#!/usr/bin/python3

import requests

url = "http://192.168.57.68:8080/bijection/"

flag = ""

for i in range(31):
    response = requests.post(f"{url}?index={i}")
    text = response.text.strip()

    print(f"{i}: {text}")

    flag += text

print("\nFlag attempt:")
print(flag)
