export LONGHORN_NODES=($(grep -w HOSTNAME  /tmp/.longhorn-nodes | awk -FHOSTNAME '{print$2}'))

for EACH in "${LONGHORN_NODES[@]}"
do
  TARGET_NODE=$(kubectl get nodes -o wide | grep "${EACH}" | awk '{print$1}')
#  kubectl label node ${TARGET_NODE} "node.longhorn.io/create-default-disk=true" --overwrite
  kubectl annotate node ${TARGET_NODE} node.longhorn.io/default-node-tags='["storage"]'
done

echo ""

#kubectl get nodes --show-labels | grep --color "node.longhorn.io/create-default-disk=true"


