export PATH=${PATH}:/var/lib/rancher/rke2/bin/

## Verify that we are connected to the correct K8s cluster:

echo "Cluster name: $(kubectl config current-context)"

echo ""

kubectl get nodes -o wide

echo ""

read -n1 -p "Is this the cluster to be check for Longhorn prerequisites? (y/n) " YESNO

echo ""

[ ${YESNO} != y ] && { echo "Exiting."; echo ""; exit; }

echo "Continuing..."

sudo bash -c "curl -sSfL https://raw.githubusercontent.com/longhorn/longhorn/v1.7.1/scripts/environment_check.sh | bash"

