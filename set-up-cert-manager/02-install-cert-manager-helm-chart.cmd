############
## From Application Collection
##
#read -p "Provide the Application Collection username: " APP_COLLECTION_USERNAME
#
#echo ""
#
#read -p "Provide the APP_COLLECTION_TOKEN: " APP_COLLECTION_TOKEN
#
#echo ""
#
#helm registry login dp.apps.rancher.io/charts -u ${APP_COLLECTION_USERNAME} -p ${APP_COLLECTION_TOKEN}
#
#helm install cert-manager oci://dp.apps.rancher.io/charts/cert-manager --namespace cert-manager --create-namespace --version 1.16.1
##
############

############
## From upstream
##
helm repo add jetstack https://charts.jetstack.io

helm repo update

helm install   cert-manager jetstack/cert-manager   --namespace cert-manager   --create-namespace   --version v1.15.2     --set crds.enabled=true
##
############

