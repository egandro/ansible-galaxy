ansible_helper_install_ssh_files
=========

Installs SSH key files to a given user. (only specified key files are installed)


Role Variables
--------------

```yml
ansible_helper_ssh_key_for_user: "{{ ansible_user }}"

#### use from homedir
ansible_helper_ssh_key_file: ~/.ssh/id_rsa
ansible_helper_ssh_key_file_pub: ~/.ssh/id_rsa.pub
```

Example Playbook
----------------

```yml
---
- hosts: debian
  vars:
    - ansible_helper_ssh_key_for_user: "{{ ansible_user }}"
    - ansible_helper_ssh_key_file: ~/.ssh/id_rsa
    - ansible_helper_ssh_key_file_pub: ~/.ssh/id_rsa.pub
  roles:
    - role: egandro.ansible_galaxy.ansible_helper_install_ssh_files
      become: true
```

Pitfalls
------------------

If you installed debian from iso, and don't have a `authorized_key`, yet go with this

```bash
ansible-playbook -i ./inventory playbook.yml --extra-vars="@./secrets.yml" \
  --ask-become-pass --become-method=su
```
