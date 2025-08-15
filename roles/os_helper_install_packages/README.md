os_helper_install_packages
=========

Installs a bunch of packages from a given list.

Role Variables
--------------

```yml
os_helper_install_packages:
  - screen
  - vim
  - htop
  - git
  - iotop
  - jnettop
  - tcpdump
  - zsh

```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - os_helper_install_packages:
      - screen
      - vim
      - htop
      - git
      - iotop
      - jnettop
      - tcpdump
      - zsh
  roles:
    - role: egandro.ansible_galaxy.os_helper_install_packages
      become: true
```
