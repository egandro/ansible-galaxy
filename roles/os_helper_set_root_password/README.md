os_helper_set_root_password
=========

Set the root password and disable ssh by password login.

Role Variables
--------------

```yml
os_helper_root_password: SecretPassword
```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - os_helper_root_password: SecretPassword
  roles:
    - role: egandro.ansible_galaxy.os_helper_set_root_password
      become: true
```
