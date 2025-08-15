proxmox_setup_cloud_vm_templates
=========

Installs templates for vm from cloud images.

idea from - <https://www.apalrd.net/posts/2023/pve_cloud/>
<https://pve.proxmox.com/wiki/VM_Templates_and_Clones>
<https://pve.proxmox.com/pve-docs/qm.1.html>

Role Variables
--------------

```yml
proxmox_setup_cloud_vm_templates_proxmox_storage: local
proxmox_setup_cloud_vm_templates_img_cache: /var/lib/image_cache
# proxmox_setup_cloud_vm_templates_list:
#   - name: template-debian-bookworm-12
#     vmid: 902
#     url: https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2
#   - name: template-ubuntu-mantic-current
#     vmid: 903
#     url: https://cloud-images.ubuntu.com/mantic/current/mantic-server-cloudimg-amd64.img
#   - name: template-kali-2023.3
#     vmid: 915
#     url: https://cdimage.kali.org/kali-2023.3/kali-linux-2023.3-qemu-amd64.7z
#     display: vga # no serial console
```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - proxmox_setup_cloud_vm_templates_list:
        - name: template-debian-bookworm-12
          vmid: 902
          url: https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2
        - name: template-ubuntu-mantic-current
          vmid: 903
          url: https://cloud-images.ubuntu.com/mantic/current/mantic-server-cloudimg-amd64.img
  roles:
    - role: egandro.ansible_galaxy.proxmox_setup_cloud_vm_templates
```
