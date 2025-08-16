docker_service_wireguard
=========

Installs wireguard and wireguard ui. From here <https://github.com/ngoduykhanh/wireguard-ui>.

Role Variables
--------------

```yml
docker_service_wireguard_ui_bind_address: 0.0.0.0
docker_service_wireguard_ui_endpoint_address: "{{ ansible_host }}"
docker_service_wireguard_ui_interface_address: 10.252.1.0/24
docker_service_wireguard_ui_post_up_script: ""
docker_service_wireguard_ui_post_down_script: ""
docker_service_wireguard_ui_dns: 1.1.1.1
docker_service_wireguard_ui_port: 5000
docker_service_wireguard_ui_wireguard_port: 51820
#docker_service_wireguard_ui_admin_user: admin
#docker_service_wireguard_ui_admin_password: admin
```

Example Playbook
----------------

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.docker_service_wireguard
      become: true
```

Client Side
----------------

```bash
# create a new certificate
ssh -L 5000:127.0.0.1:5000 devops@hostname
```

```bash
# on the client
sudo apt-get install -y wireguard

# put the file to
# /etc/wireguard/wg0.conf

chmod 600 /etc/wireguard/wg0.conf
wg-quick up wg0
wg show
ping <ip of the server>


# enable to start after booting
systemctl enable wg-quick@wg0.service
systemctl start wg-quick@wg0.service
```
