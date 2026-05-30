cat > bijection.py <<'EOF'
#!/usr/bin/python3
import requests
from bs4 import BeautifulSoup

base="http://192.168.57.68:8080/bijection"
flag=""

for i in range(100):
    r=requests.post(base+"?index="+str(i))
    text=BeautifulSoup(r.text,"html.parser").get_text("\n",strip=True)

    # Get the last quoted character from the matching line
    marker="index="+str(i)+" will return the character '"
    if marker in text:
        c=text.split(marker,1)[1][0]
    else:
        print("Could not parse index",i)
        print(text[-500:])
        break

    flag+=c
    print(i,c,flag)

    if c=="}":
        break

print("FLAG:",flag)
EOF

python3 bijection.py
