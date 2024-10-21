export LONGHORN_NODE_COUNT=$(grep -w HOST  /tmp/.longhorn-nodes | wc -l)

if [[ "${LONGHORN_NODE_COUNT}" -gt 3 ]]; then
    LONGHORN_NODE_COUNT=3
fi

kubectl apply -f <<EOF
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: longhorn-node-focused
  annotations:
    storageclass.kubernetes.io/is-default-class: "true" 
provisioner: driver.longhorn.io
allowVolumeExpansion: true
reclaimPolicy: "Delete"
volumeBindingMode: Immediate
parameters:
  numberOfReplicas: "${LONGHORN_NODE_COUNT}"
  staleReplicaTimeout: "480" 
  nodeSelector: "storage"
EOF
