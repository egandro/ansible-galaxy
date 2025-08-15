# proxmox_setup_acme_hetzner

Creates an acme account and queries a certificate if wanted.

- you only need to provide the token

## Role Variables

```yml
# proxmox_setup_acme_hetzner_command: pvenode # change this to proxmox-backup-manager on pbs
# proxmox_setup_acme_hetzner_proxmox_host: proxmox
# proxmox_setup_acme_hetzner_domain: example.com
# proxmox_setup_acme_hetzner_api_token: SecretToken
proxmox_setup_acme_hetzner_production: false # acme account is production - use "false" to use the lets encrypt staging account
proxmox_setup_acme_hetzner_order_cert: false # you need enable this to place the order (careful or lets encrypt might block you 1 week)
```

## Example Playbook

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.proxmox_setup_acme_hetzner
      become: true
```
