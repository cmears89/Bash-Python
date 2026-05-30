cat > bij_final.py <<'EOF'
#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup

url="http://192.168.57.68:8080/bijection"
flag=""

for i in range(100):
    r=requests.post(url,data={"index":str(i)})
    text=BeautifulSoup(r.text,"html.parser").get_text("\n",strip=True)

    lines=[x.strip() for x in text.splitlines() if x.strip()]
    chars=[x for x in lines if len(x)==1]

    if not chars:
        print("No character found at",i)
        print(text[-500:])
        break

    c=chars[-1]
    flag+=c
    print(i,c,flag)

    if c=="}":
        break

print("FLAG:",flag)
EOF

python3 bij_final.py
