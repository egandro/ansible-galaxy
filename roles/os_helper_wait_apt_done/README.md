os_helper_wait_apt_done
=========

Wait until apt is done (e.g. new cloud image VMs)


Example Playbook
----------------

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.os_helper_wait_apt_done
      become: true
```
