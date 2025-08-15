# hetzner_robot_server_reinstall

Reinstalls the given operating system on a hetzner server.

How do I find out the Linux dist "magic string"?

`curl -u hetzner_robot_user>:<hetzner_robot_password> https://robot-ws.your-server.de/boot/<rootserver_id>/linux`

## Role Variables

```yml
# hetzner_robot_server_reinstall:
#   id: 123456789
#   robot_admin_user: '#123456789+abcde' # send via mail after generating the admin pw
#   robot_admin_pw: 'very secret' # create with pwgen 32
#   ssh_key_file_pub: ' ~/.ssh/id_rsa.pub'
#   ip4: 1.2.3.4
#   distribution: 'Debian 12 base'
#   locked: true # optional - if set, don't allow reinstall
```

## Example Playbook

```yml
---
- hosts: localhost
  connection: local
  become: false
  # vars:
  #   - hetzner_robot_server_reinstall
  roles:
    - role: egandro.ansible_galaxy.hetzner_robot_server_reinstall
      become: true
```
