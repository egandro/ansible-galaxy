proxmox_setup_lxc_templates
=========

Installs a bunch of lxc images in proxmox to use as templates.

Idea from: <https://forum.proxmox.com/threads/is-it-possible-to-download-lxc-template-from-command-line.24854/>

Role Variables
--------------

```yml
proxmox_setup_lxc_templates_proxmox_storage: local
# check here what is available: http://download.proxmox.com/images/system/
# proxmox_setup_lxc_templates_images:
#   - debian-12-standard_12.2-1_amd64.tar.zst
#   - ubuntu-22.10-standard_22.10-1_amd64.tar.zst
```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - proxmox_setup_lxc_templates_images:
      - debian-12-standard_12.2-1_amd64.tar.zst
      - ubuntu-22.10-standard_22.10-1_amd64.tar.zst
  roles:
    - role: egandro.ansible_galaxy.proxmox_setup_lxc_templates
```
