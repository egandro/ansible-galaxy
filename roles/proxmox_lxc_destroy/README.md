proxmox_lxc_destroy
=========

Destroys a proxmox lxy - no questions asked

Role Variables
--------------

```yml
#proxmox_lxc_vmid: 102
```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - proxmox_lxc_vmid: 1000
  roles:
    - role: egandro.ansible_galaxy.proxmox_lxc_destroy

```
