os_helper_reboot
=========

Reboots the current host and wait until ssh is available

Example Playbook
----------------

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.os_helper_reboot
      become: true
```
