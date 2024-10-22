source /tmp/variables && \
kubectl apply -f - <<EOF
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: nginx
  namespace: ${APPLICATION_NAMESPACE}
spec:
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: docker.io/aarnoldy/nginx-node-reporter:1.6
        ports:
        - name: http
          containerPort: 80
        env:
        - name: NODE_NAME
          valueFrom:
            fieldRef:
              fieldPath: spec.nodeName

---

apiVersion: v1
kind: Service
metadata:
  name: nginx
  namespace: ${APPLICATION_NAMESPACE}
spec:
  ports:
  - name: http
    port: 8080
    protocol: TCP
    targetPort: 80
  selector:
    app: nginx
  type: LoadBalancer
  loadBalancerIP: ${APPLICATION_EXTERNAL_IP}
EOF
