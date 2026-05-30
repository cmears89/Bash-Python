#!/usr/bin/python3

import requests
import re

host = "http://192.168.57.68:8080"

def clean(text):
    text = text.strip()

    # If it is the normal help page, mark it clearly
    if "I accept integer data provided to my index parameter" in text:
        return "[HELP PAGE]"

    # Remove HTML tags if any response includes HTML around the answer
    text = re.sub(r"<[^>]+>", "", text).strip()

    return text

tests = [
    ("query no slash", lambda x: requests.post(f"{host}/bijection?index={x}", allow_redirects=False)),
    ("query slash", lambda x: requests.post(f"{host}/bijection/?index={x}", allow_redirects=False)),
    ("form no slash", lambda x: requests.post(f"{host}/bijection", data={"index": x}, allow_redirects=False)),
    ("form slash", lambda x: requests.post(f"{host}/bijection/", data={"index": x}, allow_redirects=False)),
    ("params no slash", lambda x: requests.post(f"{host}/bijection", params={"index": x}, allow_redirects=False)),
    ("params slash", lambda x: requests.post(f"{host}/bijection/", params={"index": x}, allow_redirects=False)),
]

for name, func in tests:
    print(f"\n=== Testing {name} ===")
    output = ""

    for x in range(31):
        r = func(x)
        result = clean(r.text)

        print(f"{x}: status={r.status_code} url={r.url} result={repr(result)}")

        if result not in ["[HELP PAGE]", ""]:
            output += result

    print("Collected:", output)
