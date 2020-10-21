#!/bin/bash
. demo-magic.sh
clear

# kp image create go-app --tag rjmo/go-app --git https://github.com/techgnosis/tanzu-golang.git --git-revision master > /dev/null 2>&1 || true

kp image create go-app --tag harbor.59s.io/59s/go-app-1 --git https://github.com/jasonmorgan/go-hello-world --git-revision main > /dev/null 2>&1
p "kp image create go-app --tag harbor.59s.io/59s/go-app-1 --git https://github.com/jasonmorgan/go-hello-world --git-revision main"
# kp image create go-app --tag harbor.59s.io/59s/go-app-1 --git https://github.com/jasonmorgan/go-hello-world --git-revision main > /dev/null 2>&1
wait
echo ""
echo ""
echo ""

p "in the above command we created a new image object in tbs using the imperative kp command line."
echo ""
# clear

p "we named our image go-app, set the image tag for our image repository, provided the git url, and decided what branch or commit id to build. When using a branch name TBS will always build the latest commit from that branch."
clear

pe "kp build logs go-app -b 1"
wait
clear

pe "docker pull harbor.59s.io/59s/go-app-1"
pe "docker run -it --rm -p 8080:8080 harbor.59s.io/59s/go-app-1"
wait
clear


# pe "watch kp build list go-app"
# clear
p "watch for rebuilds"
pe "kp build logs go-app -b 2"
wait
clear

## STACK Update

pe "kp import -f .priv/descriptor-100.0.27.yaml"
wait 
clear

pe "kp build logs go-app -b 3"
wait 
clear

p "Here we can dive into the additional data provided by Cloud Native Buildpacks and TBS"
clear
pe "docker inspect alpine | bat -l json"
wait
clear
pe "docker inspect harbor.59s.io/59s/go-app-1 |  bat -l json"
wait
clear

pe "docker inspect harbor.59s.io/59s/go-app-1 | jq '.[].Config.Labels.\"io.buildpacks.project.metadata\" | fromjson'"
wait
clear

pe "docker inspect  harbor.59s.io/59s/go-app-1 | jq '.[].Config.Labels.\"io.buildpacks.build.metadata\" | fromjson'"
wait
clear
