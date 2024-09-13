# bootstrap

This bootstrap folder houses everything we need to bootstrap the absolute basics of the cluster - namely the installation of the OpenShift GitOps (ArgoCD) Operator.

Once it's installed, the operator instance and configuration is applied with the `gitops-setup` folder.

To perform bootstrapping, run the `oc apply -k clusters/cluster-poc/bootstrap` command.