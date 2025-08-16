service_docker
=========

Installs docker.

Role Variables
--------------

```yml
## TESTED (!) there is no chicken / egg issue, if you install the registry cache later on this same docker instance
#service_docker_registry_cache_url: https://registry-cache.example.com:5000
```

Example Playbook
----------------

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.service_docker
      become: true
```
