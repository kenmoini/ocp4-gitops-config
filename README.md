# OpenShift 4 GitOps Configuration

This repository has a set of GitOps-based assets for managing clusters.

## Included Assets

### Configuration Examples

- etcd Defrag CronJob for Single Node OpenShift instances
- External Secrets Operator Configuration
- Helm installed ArgoCD Applications with Values from Git (Hashicorp Vault)
- MetalLB L2 Address Pools
- OAuth Identity Providers
- RBAC Definitions

### Operators

- External Secrets Operator
- Group Sync Operator
- Local Storage Operator
- LVM Operator
- MetalLB Operator
- NMState Operator
- OpenShift Data Foundations Operator
- OpenShift GitOps Operator
- OpenShift Virtualization Operator
- Portworx Certified Operator
- Web Terminal Operator

## Usage

First thing would be to create a [Fork of this Repo](https://github.com/kenmoini/ocp4-gitops-config/fork) and clone down to your terminal.

Copy the example cluster configuration for your intended cluster target:

```bash
cp -R clusters/cluster-poc/ clusters/<your-cluster-name>
```

From there you can modify the various YAML files that can install the cluster via the Agent Based Installer, the cluster configuration, and ArgoCD Applications.

### Bootstrapping a Cluster

This deployment model is intended to make configuration of a cluster as simple as possible.  To do that, we rely heavily on the ArgoCD/OpenShift GitOps Operator.

The first step is to bootstrap the OpenShift GitOps Operator:

```bash
oc apply -k clusters/<your-cluster-name>/bootstrap/
```

This will install the OpenShift GitOps Operator, however it will be in a default state.

### Setup the OpenShift GitOps Operator

To leverage things such as Kustomize, Helm, and PolicyGenerators via ArgoCD, or provide outbound proxy configuration - in addition to basic AppProjects, Repos, and AppOfApps, you can quickly provide the essentials to ArgoCD to bootstrap the rest of the cluster.

In the `clusters/<your-cluster-name>/gitops-setup` folder you'll find some basics that will instantiate these essentials.  Pay mind to the `kustomization.yml` file in this repository to see what it includes and references.

Once these manifests have been modified to fit to your environment, such as pointing the ArgoCD Repo to your Fork, you can run the following to configure the ArgoCD instance:

```bash
oc apply -k clusters/<your-cluster-name>/gitops-setup/
```

From there the rest of the cluster applications should provision things such as Operators and their instances as defined in the `clusters/<your-cluster-name>/gitops-apps/` folder.

### Cluster Configuration

Your cluster will need some other configuration that is not provided by Operators, such as Identity Providers, RBAC, and Secrets.  These things may not need to be synced via ArgoCD but can easily be done by enabling the `cluster-config` Application in the `clusters/<your-cluster-name>/gitops-apps/kustomization.yml` file.

Doing so will allow you to sync down things such as External Secrets Operator SecretStores, IdP configuration, RBAC, and additional configuration for Operators that may be tailored to each specific cluster.

To expand upon that, you could also make some of the configuration into a Helm Chart that would provide easier templating based on some input such as cluster-name or the target of some services such as an external Vault that the External Secrets Operator would leverage.
