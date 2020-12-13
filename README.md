# TBS Walthrough

Go from a blank kubernetes cluster to an environment running Tanzu Build Service.

## Things you'll need

* A github or similar account
  * Public facing is assumed
  * A fork of spring-petclinic
* A docker hub or similar registry available
  * Assumes docker hub
* The kp cli
* a k8s cluster
  * with a default storage class configured

## Getting the repo ready

* Fill out the values for your instance by editing vars.json
  * Explain values here
* Run the templating script
* Profit

## Using the demos

Once you've run the templating script your repo will be approriately configured for use. Test out the install and demo scripts then get started.


## End2End demo

Use the `e2e-main.sh` script to follow demo steps leveraging the [tkg-lab-e2e-adaptation](https://github.com/jaimegag/tkg-lab-e2e-adaptation) setup of lab(s). This leverages TKG for k8s, Harbor for container registry, Concourse for the CICD pipelines, and spring-petclinic for the app.
