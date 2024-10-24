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
#helm install metallb oci://dp.apps.rancher.io/charts/metallb --namespace metallb-system --create-namespace --version 0.14.8 --set crds.enabled=true
##
############

############
## From upstream
##
helm repo add metallb https://metallb.github.io/metallb

helm repo update

helm install metallb metallb/metallb --namespace metallb-system --create-namespace   --version 0.14.8 --set crds.enabled=true
##
############
