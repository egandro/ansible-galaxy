# os_helper_module_blacklist

Idea from here: <https://forum.proxmox.com/threads/proxmox-8-0-4-install-on-debian-12-hetzner-ax41-nvme-boot-error-freeze-at-boot-on-systemd-random-service-boot-failure-green-screen-bsod.134925/>

## Role Variables

```yml
# os_helper_module_blacklist_modules:
#   - i915
```

## Example Playbook

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.os_helper_module_blacklist
      become: true
```

## Random Crap from Hetzner

```txt
initrd=rescue/current-amd64/initramfs.cpio.zst nfsdir=[2a01:4ff:ff00::b007:1]:/nfs
RFILE=rescue-amd64-bookworm-v005.ext2 HASH=$5$pP2GWHGzJG97WGhz$FeIHeN7up/tHXaHBfXSxz3v4hM3iGPvl9Zt8oPNy214 net.ifnames=0
vga=0x317 lang=de quiet IP6=2a01:4f8:262:11af:: IP6MASK=64 IP6GW=fe80::1
config_url=https://admin-robot.your-server.de/admin/api/boot/rescue/4019810.ZTleyQ.jG_r1qPV7Usi0dPuT0UWoGB4nkCJz2p23zf7FX8xm9c
keyboard=us BOOT_IMAGE=rescue/current-amd64/vmlinuz BOOTIF=01-d8-5e-d3-2c-fd-e1

vga=0x317

gfxpayload=1024x768x16,1024x768



  8.768510] Console: switching to colour dummy device 80x25
[    8.768574] i915 0000:00:02.0: vgaarb: deactivate vga console
[    8.768633] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    8.769733] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    8.770100] i915 0000:00:02.0: firmware: failed to load i915/kbl_dmc_ver1_04.bin (-2)
[    8.770104] firmware_class: See https://wiki.debian.org/Firmware for information about missing firmware
[    8.770111] i915 0000:00:02.0: firmware: failed to load i915/kbl_dmc_ver1_04.bin (-2)


apt install firmware-misc-nonfree
```
