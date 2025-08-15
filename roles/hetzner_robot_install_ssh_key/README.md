# hetzner_robot_install_ssh_key

Installs a public ssh key to a hetzner robot server.

## Role Variables

```yml
# hetzner_robot_install_ssh_key:
#   robot_admin_user: '#123456789+abcde' # send via mail after generating the admin pw
#   robot_admin_pw: 'very secret' # create with pwgen 32
#   ssh_key_file_pub: ' ~/.ssh/id_rsa.pub'
```

## Example Playbook

```yml
---
- hosts: localhost
  connection: local
  become: false
  # vars:
  #   - hetzner_robot_install_ssh_key
  roles:
    - role: egandro.ansible_galaxy.hetzner_robot_install_ssh_key
      become: true
```
