# cluster-poc

## `agent-install`

This folder houses the Agent Based Installer YAML Manifests.

## `bootstrap`

This folder has the cluster GitOps bootstrap resources, namely just the installation of the OpenShift GitOps Operator.

## `gitops-setup`

This folder houses the configuration of what is used to set up the OpenShift GitOps operator.  It configures the ArgoCD instance and provides the bootstrapping of the AppOfApps and supporting configuration.

## `gitops-apps`

This folder will house the various ArgoCD Applications that sync down individual ArgoCD applications pointing to various folders with Kustomization/PolicyGenertors/Helm charts.
