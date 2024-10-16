## Gather the secret token:

read -p "Provide the Application Collectoin username: " APP_COLLECTION_USERNAME

echo ""

read -p "Provide the APP_COLLECTION_TOKEN: " APP_COLLECTION_TOKEN



## Login with Helm:
helm registry login dp.apps.rancher.io/charts -u ${APP_COLLECTION_USERNAME} -p ${APP_COLLECTION_TOKEN} 



