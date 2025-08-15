proxmox_vm_destroy
=========

Destroys a proxmox vm - no questions asked

Role Variables
--------------

```yml
proxmox_vm_vmid: 1000
```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - proxmox_vm_vmid: 1000
  roles:
    - role: egandro.ansible_galaxy.proxmox_vm_destroy
```
