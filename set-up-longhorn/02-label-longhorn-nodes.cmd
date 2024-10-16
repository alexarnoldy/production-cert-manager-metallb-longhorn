: "${LONGHORN_NODES:=$(grep -w HOSTNAME  /tmp/.longhorn-nodes | awk -FHOSTNAME '{print$2}')}"

for EACH in $(cat /tmp/.longhorn-nodes)
do
  TARGET_NODE=$(kubectl get nodes -o wide | grep "${EACH}" | awk '{print$1}')
  kubectl label node ${TARGET_NODE} longhorn="storage-node" --overwrite
done

echo ""

kubectl get nodes --show-labels | grep --color longhorn="storage-node"
