#!/bin/bash
#https://forum.proxmox.com/threads/shutting-down-all-vm-ct-in-parallel.112519/

VM_LIST=/tmp/list_VM.list
CT_LIST=/tmp/list_CT.list

# We catch the VM & CT from each server
qm list | awk 'NR>1{ print $1 }' > $VM_LIST
pct list | awk 'NR>1{ print $1 }' > $CT_LIST

mapfile -t listvm < $VM_LIST

for i in ${listvm[@]};
do
  qm start $i &
done


mapfile -t listct < $CT_LIST

for i in ${listct[@]};
do
  pct start $i &
done

rm $VM_LIST
rm $CT_LIST
