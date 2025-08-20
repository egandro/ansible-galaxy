# docker_service_gitlab

Installs Gitlab via docker compose

- <https://github.com/sameersbn/docker-gitlab/tree/master>

## Role Variables

```yml
#docker_service_gitlab_root_password: SecretPassWord
docker_service_gitlab_docker_image: sameersbn/gitlab:18.2.1
# postgres:16.2
docker_service_gitlab_postgres_image: kkimurak/sameersbn-postgresql:17.5-1
docker_service_gitlab_redis_image: redis:7
docker_service_gitlab_registry_image: registry:2

docker_service_gitlab_host: gitlab.example.com
docker_service_gitlab_ssh_host: gitlab.example.com

docker_service_gitlab_smtp_enabled: true
docker_service_gitlab_smtp_domain: www.example.com
docker_service_gitlab_smtp_user: invalid@gmail.com
docker_service_gitlab_smtp_pass: secret
docker_service_gitlab_smtp_port: 587
docker_service_gitlab_smtp_host: smtp.gmail.com
docker_service_gitlab_smtp_start_tls: true
docker_service_gitlab_smtp_authentication: login

docker_service_gitlab_registry_enabled: true
docker_service_gitlab_registry_host: registry.example.com

docker_service_gitlab_secrets_db_key_base: long-and-random-alphanumeric-string
docker_service_gitlab_secrets_secret_key_base: long-and-random-alphanumeric-string
docker_service_gitlab_secrets_otp_key_base: long-and-random-alphanumeric-string

docker_service_gitlab_internal_web_port: 10080
docker_service_gitlab_internal_registry_port: 10081
docker_service_gitlab_internal_ssh_port: 10022

docker_service_gitlab_ready_counter: 60

# 7 days
docker_service_gitlab_backup_expiry_in_seconds: 604800

docker_service_gitlab_env_vars:
  []
  # - key: foo
  #   value: bar
  # - key: foo2
  #   value: bar2
```

## Example Playbook

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.docker_service_gitlab
      become: true
```

## Test

```bash

# email
docker compose exec -it gitlab bin/rails console
Notify.test_email('youremail@example.com', 'Hello World', 'This is a test message').deliver_now

```

## TODO

- Theme Variable
- Docker Registry Cache

## Ideas

## Keycloak resource

<https://medium.com/@panda1100/gitlab-sso-using-keycloak-as-saml-2-0-idp-86b75abadaab>
<https://galexrt.moe/blog/2018/gitlab-keycloak-saml-2-0-omniauth-provider>
mappers moved: <https://github.com/keycloak/keycloak/issues/18297>
<https://docs.ansible.com/ansible/latest/collections/community/general/xml_module.html>
<https://github.com/sameersbn/docker-gitlab?tab=readme-ov-file#saml>
<https://forum.gitlab.com/t/omniauth-saml-fails-to-create-users-email-blank/78423>
<https://www.youtube.com/watch?v=CgOH0QLhe30>
<https://about.gitlab.com/blog/2023/09/14/the-ultimate-guide-to-enabling-saml/>

```bash
IDP_DESCRIPTOR_FILE="~/Downloads/descriptor"
(
    echo "-----BEGIN CERTIFICATE-----"
    grep -oP '<ds:X509Certificate>(.*)</ds:X509Certificate>' "$IDP_DESCRIPTOR_FILE" | sed -r -e 's~<[/]?ds:X509Certificate>~~g' | fold -w 64
    echo "-----END CERTIFICATE-----"
) | openssl x509 -noout -fingerprint -sha1
```

## Check this

- is there a wiki in the github repo?
- TZ variable (UTC or keep Berlin)
- configure `GITLAB_DEFAULT_THEME`
- check what is `GITLAB_REPOS_DIR, GITLAB_BACKUP_DIR, GITLAB_BUILDS_DIR, GITLAB_DOWNLOADS_DIR, GITLAB_SHARED_DIR`
- check git pages?

## Registry

- [x] works
- <https://github.com/sameersbn/docker-gitlab/issues/2638#issuecomment-1317616908>
- <https://github.com/sameersbn/docker-gitlab/issues/2302#issuecomment-774542380>
- <https://github.com/sameersbn/docker-gitlab/issues/890>

## Runner

- test ls -la /dev/kvm
- [x] works
- <https://docs.gitlab.com/runner/>
- <https://docs.gitlab.com/runner/install/docker.html>
- <https://forum.gitlab.com/t/example-gitlab-runner-docker-compose-configuration/67344>

## Shell Access

```bash
docker compose exec -it gitlab bash
docker compose exec -it registry sh
```
