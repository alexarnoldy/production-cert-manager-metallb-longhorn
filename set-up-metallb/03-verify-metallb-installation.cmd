kubectl -n metallb-system get all 

echo ""

echo -e "\033[35;4mUse Ctrl+c to continue when all of the pods are running\033[0m"

echo ""

kubectl -n metallb-system get pods -w
