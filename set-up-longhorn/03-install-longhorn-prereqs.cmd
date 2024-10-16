for EACH in $(cat /tmp/.longhorn-nodes); do scp .configure-nodes-for-longhorn.sh ${EACH}:~; done

for EACH in $(cat /tmp/.longhorn-nodes); do ssh ${EACH} sudo bash .configure-nodes-for-longhorn.sh; done
