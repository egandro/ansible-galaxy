proxmox_setup_smartmontools
=========

- <https://linuxman.co/linux-server/staying-up-to-date-with-your-hard-drive-with-smartmon-tools/>

Setup Proxmox smartd emails in case of an error.

Role Variables
--------------

```yml
#proxmox_setup_smartmontools_email: your@example.com
```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - proxmox_setup_smartmontools_email: your@gmail.com
  roles:
    - role: egandro.ansible_galaxy.proxmox_setup_smartmontools
      become: true
```
