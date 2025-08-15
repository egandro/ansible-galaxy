os_helper_vim
=========

Installs vim on debian and the mouse not suck patch

Example Playbook
----------------

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.os_helper_vim
      become: true
```
