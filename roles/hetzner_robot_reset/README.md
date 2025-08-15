# hetzner_robot_reset

Resets the hetzner server.

## Role Variables

```yml
# hetzner_robot_reset:
#   id: 123456789
#   robot_admin_user: '#123456789+abcde' # send via mail after generating the admin pw
#   robot_admin_pw: 'very secret' # create with pwgen 32
#   ip4: 1.2.3.4
#   locked: true # optional - if set, don't allow reinstall
```

## Example Playbook

```yml
---
- hosts: localhost
  connection: local
  become: false
  # vars:
  #   - hetzner_robot_reset
  roles:
    - role: egandro.ansible_galaxy.hetzner_robot_reset
      become: true
```
