: "${LONGHORN_NODES:=$(cat /tmp/.longhorn-nodes)}"

for EACH in $(awk -F@ '{print$2}' /tmp/.longhorn-nodes)
do
  TARGET_NODE=$(kubectl get nodes -o wide | grep "${EACH}" | awk '{print$1}')
  kubectl label node ${TARGET_NODE} longhornNode=true --overwrite
done

echo ""

kubectl get nodes --show-labels | grep --color "longhornNode=true"
