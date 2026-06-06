searchsploit -u

awk -F, '$4 ~ /^2020-05-/ && $6 == "webapps" {count++} END {print count}' /usr/share/exploitdb/files_exploits.csv
