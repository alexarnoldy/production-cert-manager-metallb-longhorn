cp .longhorn-nodes /tmp/.longhorn-nodes
vim /tmp/.longhorn-nodes

egrep -v '^$|#' /tmp/.longhorn-nodes > /tmp/.longhorn-nodes-1

mv /tmp/.longhorn-nodes-1 /tmp/.longhorn-nodes

