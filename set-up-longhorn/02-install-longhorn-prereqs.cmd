for EACH in $(cat .cluster-nodes); do scp .configure-cluster-nodes-for-longhorn.sh ${EACH}:~; done

for EACH in $(cat .cluster-nodes); do ssh ${EACH} sudo bash .configure-cluster-nodes-for-longhorn.sh; done
