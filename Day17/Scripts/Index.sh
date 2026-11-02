
#!/bin/bash

## Author : Badhon Biswas
## Description: Website backup script

echo "================================"
echo "Website Backup Started"
echo "Date: $(date)"
echo "================================"


SRC="/usr/share/nginx/html/index.html"
DEST="/home/ec2-user/backups"

EDTB=$(date '+%b_%d_%Y_%H_%M')

# Create backup directory if it doesn't exist
[[ -d "$DEST" ]] || mkdir -p "$DEST"

# Create backup
tar -czvpf "$DEST/my_website.com_bkup.${EDTB}.tar.gz" "$SRC"

echo "Backup completed successfully!"
