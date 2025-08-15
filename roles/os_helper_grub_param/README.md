# os_helper_grub_param

Hetzner rootserver quirk. Add "reboot=bios" kernel parameter.

Types:

- <https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html>
- <https://android.googlesource.com/kernel/msm/+/7be7585393d311866653564fbcd10a3232773c0b/arch/x86/kernel/reboot.c>

```txt
       reboot=         [KNL]
                        Format (x86 or x86_64):
                                [w[arm] | c[old] | h[ard] | s[oft] | g[pio]] | d[efault] \
                                [[,]s[mp]#### \
                                [[,]b[ios] | a[cpi] | k[bd] | t[riple] | e[fi] | p[ci]] \
                                [[,]f[orce]
```

## Role Variables

```yml
#os_helper_grub_param_string: 'vga=0x317'
```

## Example Playbook

```yml
---
roles:
  - role: egandro.ansible_galaxy.os_helper_grub_param
    become: true
```
