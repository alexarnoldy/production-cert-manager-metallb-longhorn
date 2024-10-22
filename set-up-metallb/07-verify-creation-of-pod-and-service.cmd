source /tmp/variables && \
kubectl -n ${APPLICATION_NAMESPACE} get pod,svc

echo ""
echo -e "\033[35;4mUse Ctrl+c to continue when the pods are running and the LoadBalancer service has an external IP address.\033[0m"
echo ""

kubectl -n ${APPLICATION_NAMESPACE} get pod -w

