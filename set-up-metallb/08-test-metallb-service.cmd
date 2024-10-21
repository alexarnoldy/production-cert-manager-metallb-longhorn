source /tmp/variables && \
kubectl get svc -n default | grep -w nginx > /tmp/externalip
read -r a b c EXTERNAL_IP e f < /tmp/externalip

#NODE_COUNT=$(kubectl get nodes --no-headers | wc -l)

#COUNTER=-${NODE_COUNT}

echo ""
echo -e "\033[35;4mContinue when each node running a pod has responded at least once.\033[0m"
echo ""

sleep 5

 while true; do
# while [ $COUNTER -lt $NODE_COUNT ]; do
#  COUNTER=$((COUNTER + 1))
  curl http://${EXTERNAL_IP}:8080 
#  curl http://${c}:8080    ## Use for testing when a load balanced, or other ExternalIP is not available
  sleep 2
  done

rm /tmp/externalip

