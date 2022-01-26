#!/bin/bash

qm destroy 9000
# create a new VM
# TODO create automatic way of inputting name
qm create 9000 --name focal-2004-cloudinit --memory 512 --net0 virtio,bridge=vmbr0

# import the downloaded disk to local-lvm storage
# TODO create automatic way of inputting path and img
qm importdisk 9000 /mnt/pve/truenas-isos/template/iso/focal-server-cloudimg-amd64.qcow2 local-main

# finally attach the new disk to the VM as scsi drive
qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-main:vm-9000-disk-0

# create the cloudinit drive
qm set 9000 --ide2 local-main:cloudinit

# set boot
qm set 9000 --boot c --bootdisk scsi0

#create template from vm
qm template 9000