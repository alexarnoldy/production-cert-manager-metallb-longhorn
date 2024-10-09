source /tmp/variables && \
kubectl get svc -n default | grep -w nginx > /tmp/externalip
read -r a b c EXTERNAL_IP e f < /tmp/externalip

NODE_COUNT=$(kubectl get nodes --no-headers | wc -l)

COUNTER=-2

while [ $COUNTER -lt $NODE_COUNT ]; do
  COUNTER=$((COUNTER + 1))
  curl http://${EXTERNAL_IP}:8080 
#  curl http://${c}:8080 
  done

rm /tmp/externalip

echo ""
echo "Continue when each node running a pod has responded at least once."
