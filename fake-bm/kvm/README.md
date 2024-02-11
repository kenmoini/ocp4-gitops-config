# Fake Bare Metal Hosts for Sushi Tools

```bash
# Raza - sno-one
qemu-img create -f qcow2 /var/lib/libvirt/images/sno-one-boot.qcow2 130G
qemu-img create -f qcow2 /var/lib/libvirt/images/sno-one-data.qcow2 200G

virsh define --file raza-sno-one.xml

# Raza - sno-two
qemu-img create -f qcow2 /var/lib/libvirt/images/sno-two-boot.qcow2 130G
qemu-img create -f qcow2 /var/lib/libvirt/images/sno-two-data.qcow2 200G

virsh define --file raza-sno-two.xml

## List UUIDs
virsh list --uuid --name
```

```bash
rm /var/lib/libvirt/images/sno-one-boot.qcow2
rm /var/lib/libvirt/images/sno-two-boot.qcow2
```