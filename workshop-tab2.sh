#!/bin/bash
. demo-magic.sh
clear

pe "watch kp build list go-app"
clear
pe "watch 'kubectl get builds -o custom-columns=IMAGE:\"metadata.labels.image\.kpack\.io/image\",\"REASON\":\"metadata.annotations.image\.kpack\.io/reason\",STATUS:status.conditions[0].type,NAME:.metadata.name | grep STACK' "
clear