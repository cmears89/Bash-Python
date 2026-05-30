cat > bijection.py <<'EOF'
#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup

url="http://192.168.57.68:8080/bijection"
flag="OS{"

for i in range(3,100):
    r=requests.post(url,data={"index":str(i)})
    text=BeautifulSoup(r.text,"html.parser").get_text("\n",strip=True)
    lines=[x.strip() for x in text.splitlines() if x.strip()]

    c=lines[-1]

    print(i,repr(c))

    flag+=c

    if c=="}":
        break

print("FLAG:",flag)
EOF

python3 bijection.py
