ansible_helper_server_ssh_keys
=========

Creates a new pair of ssh keys for a server (if not present).

It stores the keys in an ansible vault so that you can check them in to a git repo.

If the fault exists, the ssh keys are recreated as file.

Role Variables
--------------

```yml
# ansible_helper_server_ssh_keys_ssh_key_file:
# ansible_helper_server_ssh_keys_ssh_key_file_pub:
# ansible_helper_server_ssh_keys_ssh_ansible_vault_file:
# ansible_helper_server_ssh_keys_ssh_secrets_enc_file:
```

Example Playbook
----------------

```yml
---
- hosts: localhost
  connection: local
  become: false
  vars:
    - ansible_helper_server_ssh_keys_ssh_key_file: inventory/foobar/server_id_rsa
    - ansible_helper_server_ssh_keys_ssh_key_file_pub: inventory/foobar/server_id_rsa.pub
    - ansible_helper_server_ssh_keys_ssh_secrets_enc_file: inventory/foobar/ssh_secrets.enc
  roles:
    - role: egandro.common_ansible.ansible_helper_server_ssh_keys
      become: true
```
