#!/bin/bash

send_email_with_attachment() {
    local attachment_path=$1
    local SMTP_SERVER="smtp-us.ser.proofpoint.com"
    local SMTP_PORT=587
    local FROM="noreply@cencora.com"
    local TO=$2
    local SMTP_USERNAME=$3
    local SMTP_PASSWORD=$4
    local subject=$5
    local body="Please find the attached file."

    if [ -f "$attachment_path" ]; then
      echo "$attachment_path"
      FILE_CONTENT=$(base64 "$attachment_path")
      FILE_NAME=$(basename "$attachment_path")
      EMAIL_MESSAGE=$(echo -e "From: $FROM\r\nTo: $TO\r\nSubject: $subject\r\nContent-Type: multipart/mixed; boundary=boundary123\r\n\r\n--boundary123\r\n--boundary123\r\nContent-Type: application/octet-stream; name=\"$FILE_NAME\"\r\nContent-Disposition: attachment; filename=\"$FILE_NAME\"\r\nContent-Transfer-Encoding: base64\r\n\r\n$FILE_CONTENT\r\n--boundary123--")
      # Send the email with attachment and inline body using curl command over SMTPS (SMTP with SSL/TLS)
      curl --url "smtp://$SMTP_SERVER:$SMTP_PORT" --ssl-reqd \
        --mail-from "$FROM" --mail-rcpt "$TO" \
        --user "$SMTP_USERNAME:$SMTP_PASSWORD" \
        --upload-file - <<<$(echo -e "$EMAIL_MESSAGE")
      echo "Email sent with attachment: $attachment_path"
    else
      echo "Error: Attachment file not found at $attachment_path"
    fi
    }