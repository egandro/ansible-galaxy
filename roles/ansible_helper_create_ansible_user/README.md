ansible_helper_create_ansible_user
=========

Create an ansible user on top of an existing installation. Can be a manual installed debian (or semi auto as on Hetzner) or a lxc or cloud image.

This resolves a chicken/egg issue in case where you have to start with an image without an ansible user. It also installs sudo and makes the ansible user a sudo'er.

Requirements
------------

You need SSH pass if you have installed debian from an iso, and don't have an `authorized_keys` file, yet.

```bash
sudo apt install sshpass -y
```

Role Variables
--------------

```yml
# same as ansible_user - solves chicken/egg problem when we create a remote user
ansible_helper_ansible_new_user: "{{ ansible_helper_ansible_user }}"

#### use from homedir
ansible_helper_ssh_key_file_pub: ~/.ssh/id_rsa.pub
```

Example Playbook
----------------

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.ansible_helper_create_ansible_user
      become: true
```

Pitfalls
------------------

If you installed debian from iso, and don't have a `authorized_key`, yet go with this

```bash
ansible-playbook -i ./inventory playbook.yml --extra-vars="@./secrets.yml" \
  --ask-become-pass --become-method=su
```
