vim .cluster-nodes

egrep -v '^$|#' .cluster-nodes > .cluster-nodes-1

mv .cluster-nodes-1 .cluster-nodes

