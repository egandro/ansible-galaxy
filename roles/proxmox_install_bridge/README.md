# proxmox_install_bridge

Installs a bridge on Proxmox.

## Role Variables

```yml
proxmox_install_bridge_type: default
proxmox_install_bridge_name: vmbr0
proxmox_install_bridge_vlan_aware: false
proxmox_install_bridge_ip4: 1.2.3.4
proxmox_install_bridge_netmask4: 255.255.255.0
proxmox_install_bridge_gateway4: 2.3.4.5
# proxmox_install_bridge_route4: 'up route add -net 167.235.1.128 netmask 255.255.255.192 gw 167.235.1.129 dev' '{{ ansible_default_ipv4.interface }} will be added'

# for type: nat
#proxmox_install_bridge_nat_ip4: 10.10.10.1
#proxmox_install_bridge_nat_netmask4: 255.255.255.0
#proxmox_install_bridge_nat_masq: 10.10.10.0/24

#proxmox_install_bridge_wifi_name: xxx
#proxmox_install_bridge_wifi_password: yyy
```

## Requirements

Static IP of the Debian vm

## Example Playbook

```yml
---
- hosts: debian
  vars:
    - proxmox_install_bridge: default
  roles:
    - role: egandro.ansible_galaxy.proxmox_install_bridge
```
