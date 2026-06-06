cd /home/apprentice

sed -n '/filename="id_rsa"/,/^--/p' /var/mail/apprentice \
| sed '1,/^$/d;/^--/,$d' \
| tr -d '\r' > id_rsa.b64

base64 -d id_rsa.b64 > id_rsa
chmod 600 id_rsa

head -n 1 id_rsa
