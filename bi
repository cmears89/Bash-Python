#!/usr/bin/python3

import requests

url = "http://192.168.57.68:8080/bijection"

flag = ""

for i in range(100):
    r = requests.post(f"{url}?index={i}")
    char = r.text.strip()

    print(f"{i}: {repr(char)}")

    if len(char) != 1:
        print("Server did not return a single flag character.")
        print("Response was:")
        print(r.text[:500])
        break

    flag += char

    if char == "}":
        break

print("\nFlag:", flag)
