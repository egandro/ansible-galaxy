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
  echo "I will shutdown VM $i"
  qm shutdown $i
  echo "VM $i has been shutdown"
  echo ""
done

mapfile -t listct < $CT_LIST

for i in ${listct[@]};
do
  echo "I will shutdown CT $i"
  pct shutdown $i
  echo "CT $i has been shutdown"
  echo ""
done

# echo "We set the noout flag on CEPH Cluster:"
# ceph osd set noout

echo "End of script and deletion of VM / CT lists"
rm $VM_LIST
rm $CT_LIST

echo "We now can safely reboot the server"
reboot
