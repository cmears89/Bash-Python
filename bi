cd /home/apprentice

awk '
/Content-Transfer-Encoding: base64/ {grab=1; next}
grab && /^[A-Za-z0-9+\/=]+$/ {print}
grab && /^--/ {grab=0}
' /var/mail/apprentice > id_rsa.b64

base64 -d id_rsa.b64 > id_rsa
chmod 600 id_rsa

ls -l id_rsa
head -n 1 id_rsa
