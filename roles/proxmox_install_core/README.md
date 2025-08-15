# proxmox_install_core

Installs Proxmox Core for on a Debian 12 image.

## Role Variables

```yml
proxmox_install_core_postfix_mailname: proxmox.example.com
proxmox_install_core_reboot_force: false
proxmox_install_core_debug_fail_before_proxmox_ve_installer: false
```

## Requirements

Static IP of the Debian vm

## Example Playbook

```yml
---
- hosts: debian
  vars:
    - proxmox_install_core_postfix_mailname: proxmox.example.com
  roles:
    - role: egandro.ansible_galaxy.proxmox_install_core
```
