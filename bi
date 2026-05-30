import requests

base = "http://192.168.57.68:8080/bijection/"
flag = ""

for i in range(100):
    r = requests.post(base, params={"index": i}, allow_redirects=False)
    text = r.text.strip()

    print(i, repr(text))

    if len(text) == 1:
        flag += text
        if text == "}":
            break
    else:
        print("Unexpected response at index", i)
        break

print("FLAG:", flag)
