#!/usr/bin/python3

import requests

urls = [
    "http://192.168.57.68:8080/bijection?index=0",
    "http://192.168.57.68:8080/bijection/?index=0",
]

for url in urls:
    print(f"\nTesting: {url}")

    r = requests.post(url, allow_redirects=False)

    print("Status:", r.status_code)
    print("Location:", r.headers.get("Location"))
    print("Final URL:", r.url)
    print("Body preview:", repr(r.text[:200]))
