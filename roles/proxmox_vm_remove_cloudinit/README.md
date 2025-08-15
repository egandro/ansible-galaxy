proxmox_vm_remove_cloudinit
=========

Removes a cloud init from a proxmox vm. The Machine is rebooted.

Role Variables
--------------

```yml
proxmox_vm_api_host: proxmox
proxmox_vm_api_user: root@pam
proxmox_vm_api_password: SecretPassword
proxmox_vm_vmid: 1000
```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - proxmox_vm_api_host: proxmox
    - proxmox_vm_api_user: root@pam
    - proxmox_vm_api_password: SecretPassword
    - proxmox_vm_node: proxmox
    - proxmox_vm_vmid: 1000
  roles:
    - role: egandro.ansible_galaxy.proxmox_vm_remove_cloudinit
```
