# sudo dnf install mariadb105
#!/bin/bash
SECRET_NAME="your-secret-name"
REGION="us-east-1"
DB_HOST="your-rds-endpoint"

SECRET_JSON=$(aws secretsmanager get-secret-value \
  --secret-id "$SECRET_NAME" \
  --region "$REGION" \
  --query SecretString \
  --output text)

DB_USER=$(echo "$SECRET_JSON" | jq -r .username)
DB_PASS=$(echo "$SECRET_JSON" | jq -r .password)

mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -P 3306