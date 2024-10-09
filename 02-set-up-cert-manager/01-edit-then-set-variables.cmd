# Set these variables then run this file

#export APPLICATION_EXTERNAL_IP="192.168.150.175"
#export FQDN="suse-private-ai.susealliances.com"

echo '

export APPLICATION_EXTERNAL_IP="172.16.240.88"
export APPLICATION_NAME="suse-private-ai"
export APPLICATION_NAMESPACE="suse-private-ai"
export AWS_ACCESS_KEY_ID="AKIA36U5DH36DUBJQO45"
export AWS_REGION="us-west-2"
export DEFAULT_IP_RANGE_START=""
export DEFAULT_IP_RANGE_END=""
export DNSZONE="susealliances.com"
export EMAIL_ADDR="alex.arnoldy@suse.com"
export FQDN="suse-private-ai-demo.susealliances.com"

' > /tmp/variables

grep -v ^$ /tmp/variables > /tmp/variables-1

mv /tmp/variables-1 /tmp/variables
