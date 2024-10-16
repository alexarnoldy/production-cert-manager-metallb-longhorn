## Gather the secret token:

read -p "Provide the Application Collectoin username: " APP_COLLECTION_USERNAME

echo ""

read -p "Provide the APP_COLLECTION_TOKEN: " APP_COLLECTION_TOKEN

echo ""

kubectl get namespaces -o name

echo "" 

read -p "In which namespace would you like to deploy Application Collection apps? " NAMESPACE

kubectl -n ${NAMESPACE} create secret docker-registry application-collection --docker-server=dp.apps.rancher.io --docker-username="${APP_COLLECTION_USERNAME}" --docker-password="${APP_COLLECTION_TOKEN}"

for EACH in $(kubectl -n ${NAMESPACE} get serviceaccounts -o name)
do
  kubectl -n ${NAMESPACE} patch ${EACH} -p '{"imagePullSecrets": [{"name": "application-collection"}]}'
done

