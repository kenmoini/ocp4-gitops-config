#!/bin/bash

echo "===== Deploying Multicluster Engine..."
oc apply -k openshift/mce/instance/overlays/kitchen-sink/
echo "- Sleeping for 15s..." && sleep 15

echo "===== Deploying ACM..."
oc apply -k openshift/advanced-cluster-management/instance/base/
echo "- Sleeping for 15s..." && sleep 15

echo "===== Deploying MetalLB..."
oc apply -k openshift/metallb/instance/overlays/default/
echo "- Sleeping for 15s..." && sleep 15

echo "===== Deploying MetalLB Configuration..."
oc apply -k clusters/mega-sno.v60.lab.kemo.network/config/metallb/
echo "- Sleeping for 15s..." && sleep 15

echo "===== Deploying NFD..."
oc apply -k openshift/nfd/instance/overlays/default/
echo "- Sleeping for 15s..." && sleep 15

echo "===== Deploying RH SSO..."
oc apply -k openshift/rhsso/instance/overlays/default/
echo "- Sleeping for 15s..." && sleep 15

echo "===== Deploying NMState..."
oc apply -k openshift/nmstate/instance/
echo "- Sleeping for 15s..." && sleep 15

echo "===== Deploying OCP Virt..."
oc apply -k clusters/mega-sno.v60.lab.kemo.network/config/virt/setup
echo "- Sleeping for 15s..." && sleep 15

echo "===== Deploying MTV..."
oc apply -k clusters/mega-sno.v60.lab.kemo.network/config/virt/mtv
echo "- Sleeping for 15s..." && sleep 15

echo "===== Deploying Virt Networking Config..."
oc apply -k clusters/mega-sno.v60.lab.kemo.network/config/virt/networking
echo "- Sleeping for 15s..." && sleep 15

echo "===== Deploying Migration Glue..."
oc apply -k clusters/mega-sno.v60.lab.kemo.network/config/virt/migration-glue
echo "- Sleeping for 15s..." && sleep 15

echo "===== Deploying MCO..."
oc apply -k clusters/mega-sno.v60.lab.kemo.network/config/mco
echo "- Sleeping for 15s..." && sleep 15


  #- 100-ztp-sso.yml