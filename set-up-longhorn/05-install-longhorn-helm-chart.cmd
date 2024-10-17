export LONGHORN_NODE_COUNT=$(grep -w HOST  /tmp/.longhorn-nodes | wc -l)

## Need to add a directory in this repo to cover the pre and post work for the AI Helm installation, e.g. add the imagepullsecret to the SAs, and use the custom-values.yaml file.


helm repo add longhorn https://charts.longhorn.io
helm repo update

helm upgrade longhorn longhorn/longhorn \
--install \
--namespace longhorn-system \
--create-namespace \
--version 1.7.1 \
--set replicaSoftAntiAffinity=enabled \
--set defaultClassReplicaCount=${LONGHORN_NODE_COUNT} \
--set defaultReplicaCount=${LONGHORN_NODE_COUNT} \
--set createDefaultDiskLabeledNodes=true

