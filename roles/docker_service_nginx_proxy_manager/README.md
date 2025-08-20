# docker_service_nginx_proxy_manager

Installs Nginx Proxy Manager docker image

- <https://nginxproxymanager.com/setup/#running-the-app>
- <https://www.youtube.com/watch?v=sRI4Xhyedw4>

## Role Variables

```yml
# bind the 81 port only to 172.17.0.1
#  forward with:
#    ssh -L 8008:172.17.0.1:81 ansible@dockerserver
#      -N not execute command
#      -f go in background
# set this to empty if you want relaxed security
docker_service_nginx_proxy_manager_bind_addr: 172.17.0.1
```

## Example Playbook

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.docker_service_nginx_proxy_manager
      become: true
```
