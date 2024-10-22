source /tmp/variables && \
kubectl -n ${APPLICATION_NAMESPACE} delete ds nginx 
kubectl -n ${APPLICATION_NAMESPACE} delete service nginx 
