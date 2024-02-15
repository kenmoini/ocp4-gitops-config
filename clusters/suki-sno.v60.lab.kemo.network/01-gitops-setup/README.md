# gitops-setup

This `gitops-setup` folder provides OpenShift GitOps the configuration it needs to configure the instance and sync down all the needed Applications in an AppOfApps pattern.

To apply the configuration run `oc apply -k clusters/cluster-poc/gitops-setup`