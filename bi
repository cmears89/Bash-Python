import requests
from bs4 import BeautifulSoup

url = "http://192.168.57.68:8080/bijection/"
flag = ""

for i in range(200):
    r = requests.post(url, params={"index": i})
    body = r.text.strip()

    soup = BeautifulSoup(body, "html.parser")
    text = soup.get_text(strip=True)

    print(i, repr(text))

    if len(text) == 1:
        flag += text
        if text == "}":
            break
    elif flag:
        break

print("FLAG:", flag)
