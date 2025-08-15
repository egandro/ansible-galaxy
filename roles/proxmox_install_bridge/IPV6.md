# IPV6

## It works!

sig!

<https://blogs.infoblox.com/ipv6-coe/you-thought-there-was-no-nat-for-ipv6-but-nat-still-exists/>

This did the trick - add this to the bridge interface on proxmox

```
# ipv6 nat
  ip6tables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
  ip6tables -A FORWARD -i eno1 -o vmbr0 -m state -–state RELATED,ESTABLISHED -j ACCEPT
  ip6tables -A FORWARD -i vmbr0 -o eno1 -j ACCEPT
```

## k3s

https://github.com/k3s-io/k3s/issues/5766

This did the trick - add this to k3s_ansible

```yaml
extra_server_args: >-
  --disable-network-policy
  --cluster-cidr=10.42.0.0/16,2001:cafe:42:0::/56
  --service-cidr=10.43.0.0/16,2001:cafe:42:1::/112
  --flannel-ipv6-masq
```

## test

```bash
kubectl run my-shell --rm -i --tty --image-pull-policy Always --image ubuntu -- bash
apt-get update && apt-get install -y iputils-ping
ping6 dl-cdn.alpinelinux.org
root@my-shell:/# ping6 dl-cdn.alpinelinux.org
PING dl-cdn.alpinelinux.org(2a04:4e42:8e::645 (2a04:4e42:8e::645)) 56 data bytes
64 bytes from 2a04:4e42:8e::645 (2a04:4e42:8e::645): icmp_seq=1 ttl=58 time=5.00 m
```

## Random docs


kubectl run my-shell --rm -i --tty --image-pull-policy Always --image ubuntu -- bash
apt-get update
apt-get install -y wget  net-tools traceroute dnsutils iputils-ping telnet
/sbin/route -A inet6
wget -6 https://dl-cdn.alpinelinux.org/alpine/v3.17/main/x86_64/APKINDEX.tar.gz

rm -f APKINDEX.tar.gz && wget -4  https://dl-cdn.alpinelinux.org/alpine/v3.17/main/x86_64/APKINDEX.tar.gz

ping6 2a04:4e42:8e::645


kubectl run my-shell --rm -i --tty --image-pull-policy Always --image node:18-alpine -- sh
wget https://dl-cdn.alpinelinux.org/alpine/v3.17/main/x86_64/APKINDEX.tar.gz

https://mirrors.alpinelinux.org/

https://mirrors.alpinelinux.org/
 /etc/apk/repositories


https://www.adyxax.org/blog/2021/07/27/making-dual-stack-ipv6-work-with-k3s/
https://www.adyxax.org/blog/2022/01/23/calico-and-outgoing-ipv6-traffic-on-k3s/

kubectl run my-shell --rm -i --tty --image-pull-policy Always --image debian -- bash

AAAA
https://github.com/k3s-io/k3s/issues/5984
https://jbn1233.medium.com/disable-coredns-aaaa-ipv6-query-response-a99ce9bc6dec

template ANY AAAA {
rcode NXDOMAIN
}

s/loadbalance/rewrite stop type AAAA A/

https://docs.digitalocean.com/products/kubernetes/how-to/customize-coredns/

kubectl -n kube-system get configmap -n kube-system coredns -o yaml
kubectl -n kube-system edit configmap -n kube-system coredns -o yaml
kubectl -n kube-system logs -f -l k8s-app=kube-dns




https://docs.digitalocean.com/products/kubernetes/how-to/customize-coredns/


https://forum.netcup.de/administration-eines-server-vserver/vserver-server-kvm-server/13620-bitte-um-hilfe-bei-ipv6-in-proxmox-containern/

https://www.sugar-camp.com/anleitung-proxmox-mit-ipv6-einrichten/

https://github.com/ariadata/proxmox-hetzner

https://www.internex.at/de/toolbox/ipv6

https://simpledns.plus/private-ipv6

Combined/CID:	  fd3c:ba45:c3ea:26e5::/64
IPv6 addresses:	  fd3c:ba45:c3ea:26e5:xxxx:xxxx:xxxx:xxxx

ipv6 nat - https://blogs.infoblox.com/ipv6-coe/you-thought-there-was-no-nat-for-ipv6-but-nat-still-exists/

ip6tables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
ip6tables -A FORWARD -i eno1 -o vmbr0 -m state -–state RELATED,ESTABLISHED -j ACCEPT
ip6tables -A FORWARD -i vmbr0 -o eno1 -j ACCEPT






## Docker Debian
https://docs.docker.com/engine/install/debian/
sudo docker run -ti --rm ubuntu /bin/bash
https://docs.docker.com/config/daemon/ipv6/

###

https://docs.docker.com/config/daemon/ipv6/


Edit /etc/docker/daemon.json
{
  "ipv6": true,
  "fixed-cidr-v6": "2001:db8:1::/64"
}

systemctl reload docker

# https://serverfault.com/questions/782920/no-ipv6-connectivity-from-docker-container

echo "net.ipv6.conf.all.disable_ipv6 = 0" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 0" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.forwarding=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.forwarding = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.eth0.proxy_ndp=1" >> /etc/sysctl.conf

apt-get install ndppd

sysctl -p

sudo docker run -ti --rm ubuntu /bin/bash

DISABLE AAAA Lookups
# https://gist.github.com/noseka1/6b7cbeca199db9c4823324bc31214bb2

https://jbn1233.medium.com/disable-coredns-aaaa-ipv6-query-response-a99ce9bc6dec