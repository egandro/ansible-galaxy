#!/bin/bash

MACHINE_ID=$1
MACHINE_NAME=$2
TEMPLATE_ID=902
DISK_SIZE=200
MEMORY=32768
CORES=4

qm stop ${MACHINE_ID} --skiplock 1 || true
qm destroy ${MACHINE_ID} --destroy-unreferenced-disks 1 --purge 1 || true

qm clone ${TEMPLATE_ID} ${MACHINE_ID} --name "${MACHINE_NAME}" --full 1 --format qcow2
qm disk resize ${MACHINE_ID} scsi0 "${DISK_SIZE}G"
qm set ${MACHINE_ID} --memory ${MEMORY} --cores ${CORES}
qm set ${MACHINE_ID} --onboot 1

echo qm set ${MACHINE_ID} --net0 virtio,bridge=vmbr0

echo qm set ${MACHINE_ID} --ipconfig0 ip=192.168.178.87/24,gw=192.168.178.1

echo qm start ${MACHINE_ID}

echo qm set ${MACHINE_ID} --delete ide2
