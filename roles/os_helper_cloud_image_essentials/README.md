# os_helper_cloud_image_essentials

Essentials software of a cloud image.

## Role Variables

```yml
# man fallocate -
```

## Example Playbook

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.os_helper_cloud_image_essentials
      become: true
```
