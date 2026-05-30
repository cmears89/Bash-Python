#!/usr/bin/python3

import requests

url = "http://192.168.57.68:8080/bijection"

flag = ""

for index in range(100):
    response = requests.post(url, params={"index": index})
    character = response.text.strip()

    print(f"index {index}: {character}")

    flag += character

    if character == "}":
        break

print("\nFinal flag:", flag)
