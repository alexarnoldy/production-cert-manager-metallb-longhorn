echo ""
echo -e "\033[35;4mUse Ctrl+c to continue when the certificate READY status becomes True\033[0m"
echo ""
source /tmp/variables && \
kubectl get -w -n ${APPLICATION_NAMESPACE} certificate
