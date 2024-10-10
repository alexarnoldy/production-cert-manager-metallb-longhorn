## Gather the secret token:

read -p "Provide the AWS_SECRET_ACCESS_KEY for the account that can update AWS Route53 records: " AWS_SECRET_ACCESS_KEY



## Create the secret that holds the token:

source /tmp/variables && \
kubectl create -n ${APPLICATION_NAMESPACE} secret generic route53-credentials-secret --from-literal=secret-access-key=${AWS_SECRET_ACCESS_KEY}



## Verify that value is correct in the secret:

source /tmp/variables && \
echo -ne "\033[35;4msecret-access-key=\033[0m"
kubectl get -n ${APPLICATION_NAMESPACE} secret route53-credentials-secret -o jsonpath={.data.secret-access-key} | base64 -d; echo ""

echo ""

read -n1 -p "Is the secret key correct? (y/n) " YESNO

echo ""
echo ""

[ ${YESNO} != y ] && { echo "Please check the /tmp/variables file, then repeat this step."; echo ""; exit; }

echo "You may continue with the deployment."
