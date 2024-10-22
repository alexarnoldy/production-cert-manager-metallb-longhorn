source /tmp/variables && \
kubectl -n ${APPLICATION_NAMESPACE} delete secret ${APPLICATION_TLS_SECRET}
kubectl -n ${APPLICATION_NAMESPACE} delete certificate ${APPLICATION_NAME}-staging-certificate
