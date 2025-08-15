proxmox_setup_storage
=========

Setup Proxmox storage. Currently only local folders are supported.

Role Variables
--------------

```yml
proxmox_setup_storage_type: default
proxmox_setup_storage_local_folder: /data
```

Requirements
------------

Static IP of the Debian vm

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - proxmox_setup_storage_type: default
  roles:
    - role: egandro.ansible_galaxy.proxmox_setup_storage
```
