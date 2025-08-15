proxmox_vm_reboot
=========

Stop a VM. If an IP is provided, wait until ssh is available.

Role Variables
--------------

```yml
proxmox_vm_vmid: 1000
#proxmox_vm_ip4: 1.2.3.4
```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - proxmox_vm_vmid: 1000
  roles:
    - role: egandro.ansible_galaxy.proxmox_vm_reboot
```
