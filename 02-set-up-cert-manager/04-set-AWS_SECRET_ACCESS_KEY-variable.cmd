## IMPORTANT: Copty this file to /tmp before editing it!!!

read -p "Provide the AWS_SECRET_ACCESS_KEY for the account that can update AWS Route53 records: " AWS_SECRET_ACCESS_KEY

echo export AWS_SECRET_ACCESS_KEY="\"${AWS_SECRET_ACCESS_KEY}\"" > /tmp/.dns-cred
