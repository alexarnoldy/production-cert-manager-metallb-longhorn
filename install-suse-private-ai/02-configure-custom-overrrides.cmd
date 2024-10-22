cp .custom-overrides.yaml /tmp/custom-overrides.yaml
vim /tmp/custom-overrides.yaml

egrep -v '^$|#' /tmp/custom-overrides.yaml > /tmp/custom-overrides.yaml-1

source /tmp/variables \\
envsubst < /tmp/custom-overrides.yaml-1 > /tmp/custom-overrides.yaml

rm /tmp/custom-overrides.yaml-1

