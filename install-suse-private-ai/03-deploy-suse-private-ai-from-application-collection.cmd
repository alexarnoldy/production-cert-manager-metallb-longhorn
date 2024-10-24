## Gather the secret token:

read -p "Provide the Application Collection username: " APP_COLLECTION_USERNAME

echo ""

read -p "Provide the APP_COLLECTION_TOKEN: " APP_COLLECTION_TOKEN

echo ""

## Create the imagePUllSecret:

kubectl get namespaces -o name | awk -F\/ '{print$2}

echo "" 

read -p "In which namespace would you like to deploy Application Collection apps? " NAMESPACE

kubectl create namespace ${NAMESPACE}

kubectl -n ${NAMESPACE} create secret docker-registry application-collection --docker-server=dp.apps.rancher.io --docker-username="${APP_COLLECTION_USERNAME}" --docker-password="${APP_COLLECTION_TOKEN}"

## Log in to the Application Collection and deploy the chart:

git clone git@github.com:SUSE/private-ai-charts.git && cd private-ai-charts

helm registry login dp.apps.rancher.io/charts -u ${APP_COLLECTION_USERNAME} -p ${APP_COLLECTION_TOKEN}

helm upgrade --install \
  suse-private-ai  . \
  --namespace suse-private-ai \
  --values /tmp/custom-overrides.yaml

## Update the service accounts with the imagePullSecret:

for EACH in $(kubectl -n ${NAMESPACE} get serviceaccounts -o name)
do
  kubectl -n ${NAMESPACE} patch ${EACH} -p '{"imagePullSecrets": [{"name": "application-collection"}]}'
done

