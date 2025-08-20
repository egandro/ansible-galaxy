os_helper_swap_file
=========

Creates a swap filet.

Role Variables
--------------

```yml
# man fallocate -
os_helper_swap_file_size: 500mb
```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - os_helper_swap_file_size: 500mb
  roles:
    - role: egandro.ansible_galaxy.os_helper_swap_file
      become: true
```
