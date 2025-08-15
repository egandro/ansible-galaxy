#/bin/bash
VMID=$1

if [[ -z "${VMID}" ]]; then
echo "usage: $0 vmid"
exit 0
fi

VMPID=$(qm list | grep '^\s*'${VMID} | awk '{print $6}')
if [[ ${VMPID} != "0" ]]; then
    echo "try shutdown vm"
    qm shutdown ${VMID} && exit 0
    echo "try stopping vm"
    qm stop ${VMID} && exit 0
    echo "killing vm"
    kill -9 ${VMPID}
else
    echo "VM not found or not running"
fi
