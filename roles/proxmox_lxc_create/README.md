proxmox_lxc_create
=========

Create a proxmox lxc container based on a given template.

- <https://forum.proxmox.com/threads/ubuntu-snaps-inside-lxc-container-on-proxmox.36463/#post-230060>
- <https://pve.proxmox.com/pve-docs/pct.1.html>

Role Variables
--------------

```yml
proxmox_lxc_start_after_creation: false
proxmox_lxc_storage: local
proxmox_lxc_onboot: true
#proxmox_lxc_hostname: new-lxc
#proxmox_lxc_vmid: 102
# must be downloaded before
proxmox_lxc_template: debian-12-standard_12.2-1_amd64.tar.zst
proxmox_lxc_ostype: debian
proxmox_lxc_swap_size: 512mb
#proxmox_lxc_tags: foo,bar
#proxmox_lxc_description: "# Server URL%0A### https://www.example.com" # %0A is newline
proxmox_lxc_disk_size: 1
#proxmox_lxc_memory: 2048
#proxmox_lxc_cores: 2
# proxmox_lxc_mp:
#   - id: 0
#     host_path: /data
#     container_mp: /data
# proxmox_lxc_net:
#   - id: 0
#     data: name=eth0,bridge=vmbr0,firewall=1,ip=192.168.189.1/24,gw=192.168.189.10,type=veth
```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - proxmox_lxc_start_after_creation: false
    - proxmox_lxc_storage: local
    - proxmox_lxc_onboot: true
    - proxmox_lxc_hostname: new-lxc
    - proxmox_lxc_vmid: 102
    - proxmox_lxc_template: debian-12-standard_12.2-1_amd64.tar.zst
    - proxmox_lxc_ostype: debian
  roles:
    - role: egandro.ansible_galaxy.proxmox_lxc_create
```
