helm repo add jetstack https://charts.jetstack.io

helm repo update

helm install   cert-manager jetstack/cert-manager   --namespace cert-manager   --create-namespace   --version v1.15.2     --set crds.enabled=true

source /tmp/variables && \
kubectl create namespace ${APPLICATION_NAMESPACE}
