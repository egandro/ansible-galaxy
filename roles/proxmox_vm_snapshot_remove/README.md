proxmox_vm_snapshot_remove
=========

Removes an existing snapshot

Role Variables
--------------

```yml
proxmox_vm_vmid: 1000
proxmox_vm_snapshot_name: snapshot

```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - proxmox_vm_vmid: 1000
    - proxmox_vm_snapshot_name: my_snapshot
  roles:
    - role: egandro.ansible_galaxy.proxmox_vm_snapshot_remove
```
