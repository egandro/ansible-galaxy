os_helper_wireguard_create_tunnel
=========

Creates a wireguard tunnel by using the web ui of wireguard ui <https://github.com/ngoduykhanh/wireguard-ui>.

Role Variables
--------------

```yml
# os_helper_wireguard_create_tunnel_url: http://192.168.1.1:5000
# os_helper_wireguard_create_tunnel_user: admin
# os_helper_wireguard_create_tunnel_password: admin
# os_helper_wireguard_create_tunnel_profile: john
# os_helper_wireguard_create_tunnel_email: john@example.com
# os_helper_wireguard_create_tunnel_allowed_ips: '["10.201.18.0/24","10.100.17.0/24"]'
# os_helper_wireguard_create_tunnel_output_file: john.cfg
```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - os_helper_wireguard_create_tunnel_url: http://192.168.1.1:5000
    - os_helper_wireguard_create_tunnel_user: admin
    - os_helper_wireguard_create_tunnel_password: admin
    - os_helper_wireguard_create_tunnel_profile: john
    - os_helper_wireguard_create_tunnel_email: john@example.com
    - os_helper_wireguard_create_tunnel_allowed_ips: '["10.201.18.0/24","10.100.17.0/24"]'
    - os_helper_wireguard_create_tunnel_output_file: john.cfg
  roles:
    - role: egandro.ansible_galaxy.os_helper_wireguard_create_tunnel
      become: true
```
