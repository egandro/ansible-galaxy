service_postfix_relay
=========

Installs postgres with relay e.g. via google emailer.

Some documentation:

- *** <https://www.howtoforge.com/tutorial/configure-postfix-to-use-gmail-as-a-mail-relay/>
- <https://computingforgeeks.com/configure-postfix-to-relay-emails-using-gmail-smtp/>
- <https://support.google.com/accounts/answer/185833?hl=de>

You need to enable 2FA. Then "App Passwords" is available in security.

Send a test mail:

```bash
mail -s "Test subject" recipient@domain.com
```

Role Variables
--------------

```yml
# service_postfix_mailname: "server.{{ domain_name }}"
# service_postfix_relay_server: smtp.gmail.com
# service_postfix_relay_port: 587
# service_postfix_relay_user: foobar@gmail.com
# service_postfix_relay_password: SecretPassword
```

Example Playbook
----------------

```yml
---
- hosts: debian
  roles:
    - role: egandro.ansible_galaxy.service_postfix_relay
      become: true
```
