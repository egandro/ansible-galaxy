# docker_service_gitlab_runner

Installs a gitlab runner to a Gitlab installed by docker_service_gitlab

- <https://github.com/sameersbn/docker-gitlab/tree/master>
- <https://github.com/projectcalico/calico/issues/4434>
- <https://about.gitlab.com/blog/2020/10/30/mitigating-the-impact-of-docker-hub-pull-requests-limits/>
- <https://gitlab.com/gitlab-org/gitlab-runner/-/issues/27171>
- <https://github.com/docker-library/docker/issues/38>
- <https://stackoverflow.com/questions/50325932/gitlab-runner-docker-could-not-resolve-host>
- <https://docs.ansible.com/ansible/latest/collections/community/general/gitlab_runner_module.html#ansible-collections-community-general-gitlab-runner-module>

## Role Variables

TODO: deal with tags

```yml
#docker_service_gitlab_runner_api_username: root
#docker_service_gitlab_runner_api_password: Secret!123
#docker_service_gitlab_runner_gitlab_url: https://gitlab.example.com
docker_service_gitlab_runner_name: default-runner
docker_service_gitlab_runner_privileged: false
docker_service_gitlab_runner_concurrency: 0
docker_service_gitlab_runner_request_concurrency: 0
docker_service_gitlab_runner_docker_image: docker:27-dind
docker_service_gitlab_runner_delete_config_dir: false
#docker_service_gitlab_runner_registry_cache_url: http://registry-cache.example.com
```

## Example Playbook

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.docker_service_gitlab_runner
      become: true
```

## Test

```bash

```
