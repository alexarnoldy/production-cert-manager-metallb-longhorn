echo ""

read -n1 -p "Are you sure you want to delete the secret, knowing this will prevent cert-manager from automatically updating the TLS certificate before it expires? (y/n) " YESNO

echo ""

[ ${YESNO} != y ] && { echo "Exiting without deleting the secret."; echo ""; exit; }

source /tmp/variables && \
kubectl delete -n ${APPLICATION_NAMESPACE} secret route53-credentials-secret 


