for EACH in $(grep -w HOST  /tmp/.longhorn-nodes | awk -FHOST '{print$2}'); do scp -F /tmp/.longhorn-nodes .configure-nodes-for-longhorn.sh ${EACH}:~; done

for EACH in $(grep -w HOST  /tmp/.longhorn-nodes | awk -FHOST '{print$2}'); do ssh -F /tmp/.longhorn-nodes ${EACH} sudo bash .configure-nodes-for-longhorn.sh; done

for EACH in $(grep -w HOST  /tmp/.longhorn-nodes | awk -FHOST '{print$2}'); do ssh -F /tmp/.longhorn-nodes ${EACH} sudo rm .configure-nodes-for-longhorn.sh; done
