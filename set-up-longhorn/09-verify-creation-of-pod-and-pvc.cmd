kubectl -n default get pod,pvc

echo ""
echo -e "\033[35;4mUse Ctrl+c to continue when the pod is running\033[0m"
echo ""

kubectl -n default get pod -w

