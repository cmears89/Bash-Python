cd /home/apprentice

file id_rsa
mv id_rsa attachment.pdf

strings attachment.pdf | grep -A5 -B5 -i 'OPENSSH\|PRIVATE KEY\|BEGIN\|OS{'
