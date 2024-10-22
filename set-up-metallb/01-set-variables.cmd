cp .variables /tmp/variables
vim /tmp/variables

egrep -v '^$|#' /tmp/variables > /tmp/variables-1

mv /tmp/variables-1 /tmp/variables

