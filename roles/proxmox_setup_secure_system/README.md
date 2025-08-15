proxmox_setup_secure_system
=========

Secures proxmox by disabling some services - e.g. when running on the internet.

Role Variables
--------------

```yml
#if set, secure the listen address of the pve proxy
#proxmox_setup_secure_system_pveproxy_listen_ip: 10.2.1.3
```

Example Playbook
----------------

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.proxmox_setup_secure_system
```
