echo ""

read -n1 -p "Are you sure you want to delete the secret, knowing this will prevent cert-manager from automatically updating the TLS certificate before it expires? (y/n) " YESNO

echo ""

[ ${YESNO} != y ] && { echo -e "\033[35;4mExiting without deleting the secret.\033[0m"; echo ""; exit; }

source /tmp/variables && \
kubectl delete -n ${APPLICATION_NAMESPACE} secret route53-credentials-secret 


