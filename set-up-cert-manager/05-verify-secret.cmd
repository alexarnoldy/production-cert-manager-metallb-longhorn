## Verify that value is correct in the secret:
source /tmp/variables && \
kubectl get -n ${APPLICATION_NAMESPACE} secret route53-credentials-secret -o jsonpath={.data.secret-access-key} | base64 -d; echo ""

echo ""

read -n1 -p "Is the secret key correct? (y/n) " YESNO

echo ""

[ ${YESNO} != y ] && { echo "Please troubleshoot the creation of the secret, then repeat this step."; echo ""; exit; }

rm /tmp/.dns-cred
