#!/usr/bin/python3

import requests
import time

url = "http://192.168.57.68:8080/bijection/"

flag = ""
index = 0

while True:
    response = requests.post(url, data={"index": index})
    text = response.text.strip()

    print(f"index {index}: {repr(text)}")

    # Only accept responses that are a single character
    if len(text) == 1:
        flag += text
        print("Current flag:", flag)

        if text == "}":
            break
    else:
        print("Did not get a single character. Retrying...")
        time.sleep(1)
        continue

    index += 1

print("\nFinal flag:", flag)
