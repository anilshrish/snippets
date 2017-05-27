#!/bin/bash

# Always follow coding standards and follow best practices: https://www.shellcheck.net/

FILE_NAME="all_db-\"$(data +%Y%m%d%H%M)\".sql.gz"
SAVE_DIR="/backup"
S3_BUCKET="bucket_name"


#Get MYSQL_USER and MYSQL_PASSWORD, keeping it away from the script file because of security reasons.
source /home/sysop/.env

mysqldump -u "${MYSQL_USER}" -p"${MYSQL_PASSWORD}" --all-databases --single-transaction --events --routines --triggers | gzip > "${SAVE_DIR}/${FILE_NAME}"

if [ -e "${SAVE_DIR}"/"${FILE_NAME}" ]; then

# Upload to AWS
aws s3 cp "${SAVE_DIR}"/"${FILE_NAME}" s3://"${S3_BUCKET}"/"${FILE_NAME}"

#Test result of last command run
if [ "$?" -ne 0 ]; then
  echo "AWS upload has failed"
  exit 1
fi

# Remove backup file, also making sure SAVE_DIR and FILE_NAME is not set to null. you will end up with rm -rf /*  :D
rm -rf "${SAVE_DIR:?}"/"${FILE_NAME:?}"

#Exit with no error
exit 0
fi

# Exit with error if we reach this point
echo "Backup file not created"
exit 1
