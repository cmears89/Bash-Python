#!/usr/bin/python3

import requests
from bs4 import BeautifulSoup

url = "http://192.168.57.68:8080/bijection"

flag = ""

for i in range(100):
    r = requests.post(url, data={"index": i})

    # Print raw response first so you can see what changes
    print(f"\n--- index {i} ---")
    print(r.text)

    text = r.text.strip()

    if len(text) == 1:
        char = text
    else:
        # fallback: grab visible text from HTML
        soup = BeautifulSoup(r.text, "html.parser")
        char = soup.get_text(strip=True)[-1]

    flag += char

    if char == "}":
        break

print("\nFlag:", flag)
