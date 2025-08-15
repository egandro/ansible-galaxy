# Ansible Collection

Ideas from

- <https://docs.ansible.com/ansible/latest/dev_guide/developing_collections_creating.html>
- <https://blog.ruanbekker.com/blog/2022/04/19/publish-and-use-your-ansible-role-from-git/>
- <https://github.com/kpma1985/ansible_proxmox_hetzner>


## Ansible / Python setup

```bash
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt install python3-venv -y
sudo apt install python-is-python3 -y
sudo apt autoremove

sudo apt install sshpass -y # not really needed - only vanilla debian from iso needs this

mkdir -p .python-venv
python3 -m venv .python-venv
. .python-venv/bin/activate
python3 -m pip install --quiet --upgrade pip
pip install --quiet -r requirements.**txt**
```

from here on just use `. .python-venv/bin/activate`

## new role

```bash
ansible-galaxy init --init-path roles roleXXX
# add roleXXX in meta/main.yml
```

## use the roles in your projects

- create a `collections/requirements.yml` file

```yml
#  ansible-galaxy install -r collections/requirements.yml --force
---
collections:
  - name: https://github.com/egandro/common-ansible.git
    type: git
    version: main
```
