#!/usr/bin/python3

import requests

base_url = "http://192.168.57.68:8080/bijection"

flag = ""

for x in range(31):
    url = f"{base_url}?index={x}"

    response = requests.post(url)
    character = response.text.strip()

    print(f"index={x} returned: {character}")

    flag += character

print("\nFlag:")
print(flag)
