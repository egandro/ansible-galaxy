proxmox_vm_snapshot_create
=========

Creates a new snapshot.

<https://forum.proxmox.com/threads/snapshot-from-command-line-shell.43438/>

Role Variables
--------------

```yml
proxmox_vm_vmid: 1000
proxmox_vm_snapshot_name: snapshot
proxmox_vm_snapshot_include_ram: true

```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - proxmox_vm_vmid: 1000
    - proxmox_vm_snapshot_name: my_snapshot
    - proxmox_vm_snapshot_include_ram: true
  roles:
    - role: egandro.ansible_galaxy.proxmox_vm_snapshot_create
```
