#!/bin/bash

# Raza - sno-one
rm -f /var/lib/libvirt/images/sno-one-boot.qcow2
rm -f /var/lib/libvirt/images/sno-one-data.qcow2

virsh destroy sno-one
virsh undefine --nvram sno-one

# Raza - sno-two
rm -f /var/lib/libvirt/images/sno-two-boot.qcow2
rm -f /var/lib/libvirt/images/sno-two-data.qcow2

virsh destroy sno-two
virsh undefine --nvram sno-two

# Raza - sno-three
rm -f /var/lib/libvirt/images/sno-three-boot.qcow2
rm -f /var/lib/libvirt/images/sno-three-data.qcow2

virsh destroy sno-three
virsh undefine --nvram sno-three