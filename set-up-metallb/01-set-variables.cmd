vim .variables

egrep -v '^$|#' .variables > .variables-1

mv .variables-1 .variables

cp .variables /tmp/variables
