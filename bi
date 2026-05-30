#!/usr/bin/python3

import requests

host = "http://192.168.57.68:8080"

flag = ""

for i in range(31):
    # First request: use the lab's exact URL format
    first_url = f"{host}/bijection?index={i}"
    r = requests.post(first_url, allow_redirects=False)

    # If server redirects to /bijection/?index=i, POST there manually
    if r.status_code in [301, 302, 303, 307, 308]:
        redirect_url = r.headers["Location"]

        # Location might be relative or absolute
        if redirect_url.startswith("/"):
            redirect_url = host + redirect_url

        r = requests.post(redirect_url, allow_redirects=False)

    text = r.text.strip()

    print(f"\n===== index {i} =====")
    print(repr(text[:200]))

    flag += text

print("\nFlag attempt:")
print(flag)
