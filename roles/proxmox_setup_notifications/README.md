# proxmox_setup_notifications

- <https://pve.proxmox.com/pve-docs/chapter-notifications.html>

Installs notifications for proxmox using sendmail.

## Role Variables

```yml
#proxmox_setup_notifications_email: your@example.com
proxmox_setup_notifications_mode: default ## or errors-only
proxmox_setup_notifications_type: pve # or pbs
```

## Example Playbook

```yml
---
- hosts: debian
  vars:
    - proxmox_setup_notifications_email: your@example.com
  roles:
    - role: egandro.ansible_galaxy.proxmox_setup_notifications
      become: true
```
