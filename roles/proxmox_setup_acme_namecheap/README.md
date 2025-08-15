proxmox_setup_acme_namecheap
=========

Creates an acme account and queries a certificate if wanted.

- you only need to provide the token + name
- whitelist your IP in namecheap


!!! You need to provide your public IP e.g. https://ifconfig.co/ip. !!!

- <https://www.reddit.com/r/Proxmox/comments/q45f85/acme_certs_in_proxmox_v7/>

Role Variables
--------------

```yml
# proxmox_setup_acme_namecheap_command: pvenode # change this to proxmox-backup-manager ob pbs
# proxmox_setup_acme_namecheap_proxmox_host: proxmox
# proxmox_setup_acme_namecheap_domain: example.com
# proxmox_setup_acme_namecheap_username: TheUser
# proxmox_setup_acme_namecheap_api_key: SecretToken
# proxmox_setup_acme_namecheap_public_ip: 1.2.3.4
proxmox_setup_acme_namecheap_production: false # acme account is production - use "false" to use the lets encrypt staging account
proxmox_setup_acme_namecheap_order_cert: false # you need enable this to place the order (careful or lets encrypt might block you 1 week)
```

Example Playbook
----------------

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.proxmox_setup_acme_namecheap
      become: true
```
