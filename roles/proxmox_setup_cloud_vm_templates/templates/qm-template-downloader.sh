#!/bin/bash

USER_NAME=$1
STORAGE=$2

if [ -z "${USER_NAME}" ]
then
    echo "error: username is empty"
    exit 1
fi

if [ -z "${STORAGE}" ]
then
    echo "error: storage is empty"
    exit 1
fi


# idea from - https://www.apalrd.net/posts/2023/pve_cloud/
# https://pve.proxmox.com/wiki/VM_Templates_and_Clones
# https://pve.proxmox.com/pve-docs/qm.1.html
# https://www.youtube.com/watch?v=shiIi38cJe4

#Create template
#args:
# vm_id
# vm_name
# file name in the current directory
function create_template() {
    #Print all of the configuration
    echo "Creating template $2 ($1)"

    #Delete existing machines
    qm destroy $1 --destroy-unreferenced-disks 1 --purge 1 || true

    #Create new VM
    #Feel free to change any of these to your liking
    # enable the agent https://www.snel.com/support/nstall-qemu-guest-agent-for-debian-ubuntu/
    #                  https://pve.proxmox.com/pve-docs/qm.1.html
    qm create $1 --name $2 --ostype l26 --agent=1
    #Set networking to default bridge
    qm set $1 --net0 virtio,bridge=vmbr0
    #Set display to serial
    qm set $1 --serial0 socket --vga serial0
    #Set memory, cpu, type defaults
    #https://qemu-project.gitlab.io/qemu/system/qemu-cpu-models.html
    qm set $1 --memory 1024 --cores 4 --cpu host
    #Set boot device to new file
    qm set $1 --scsi0 ${storage}:0,import-from="$(pwd)/$3",discard=on,ssd=1
    #Set scsi hardware as default boot disk using virtio scsi single
    qm set $1 --boot order=scsi0 --scsihw virtio-scsi-single
    #Enable Qemu guest agent in case the guest has it available
    qm set $1 --agent enabled=1,fstrim_cloned_disks=1
    #Add cloud-init device
    qm set $1 --ide2 ${storage}:cloudinit
    #Set CI ip config
    #IP6 = auto means SLAAC (a reliable default with no bad effects on non-IPv6 networks)
    #IP = DHCP means what it says, so leave that out entirely on non-IPv4 networks to avoid DHCP delays
    qm set $1 --ipconfig0 "ip6=auto,ip=dhcp"
    #Import the ssh keyfile
    qm set $1 --sshkeys ${ssh_keyfile}
    #If you want to do password-based auth instaed
    #Then use this option and comment out the line above
    #qm set $1 --cipassword password
    #Add the user
    qm set $1 --ciuser ${username}

    # we do the resizing later

    #Resize the disk to 8G, a reasonable minimum. You can expand it more later.
    #If the disk is already bigger than 8G, this will fail, and that is okay.
    #qm disk resize $1 scsi0 8G || true

    #Make it a template
    qm template $1

    #Remove file when done
    rm $3
}


#
# we still need to install the devops users to all machines
#

#Path to your ssh authorized_keys file
#Alternatively, use /etc/pve/priv/authorized_keys if you are already authorized
#on the Proxmox system
export ssh_keyfile=/root/.ssh/authorized_keys

#Username to create on VM template
export username=${USER_NAME}


#Name of your storage
#export storage=local-zfs
export storage=${STORAGE}

#The images that I've found premade
#Feel free to add your own

## Debian
# #Buster (10)
# wget -q "https://cloud.debian.org/images/cloud/buster/latest/debian-10-genericcloud-amd64.qcow2"
# create_template 900 "template-debian-10" "debian-10-genericcloud-amd64.qcow2"
#Bullseye (11)
#wget -q "https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2"
#create_template 901 "template-debian-11" "debian-11-genericcloud-amd64.qcow2"
#Bookworm (12)
#wget -q "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
#create_template 902 "template-debian-12" "debian-12-genericcloud-amd64.qcow2"

#trixie (13)
wget -q "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-genericcloud-amd64.qcow2"
create_template 902 "template-debian-13" "debian-13-genericcloud-amd64.qcow2"

# #Bookworm (12 dailies - not yet released)
# wget -q "https://cloud.debian.org/images/cloud/bookworm/daily/latest/debian-12-genericcloud-amd64-daily.qcow2"
# create_template 902 "template-debian-12-daily" "debian-12-genericcloud-amd64-daily.qcow2"


# ## Ubuntu
# #20.04 (Focal Fossa)
# wget -q "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
# create_template 910 "template-ubuntu-20-04" "ubuntu-20.04-server-cloudimg-amd64.img"
# #22.04 (Jammy Jellyfish)
# wget -q "https://cloud-images.ubuntu.com/releases/22.04/release/ubuntu-22.04-server-cloudimg-amd64.img"
# create_template 911 "template-ubuntu-22-04" "ubuntu-22.04-server-cloudimg-amd64.img"
# # #23.04 (Lunar Lobster) - daily builds
# wget -q "https://cloud-images.ubuntu.com/lunar/current/lunar-server-cloudimg-amd64.img"
# create_template 912 "template-ubuntu-23-04-daily" "lunar-server-cloudimg-amd64.img"

# ## Fedora 37
# #Image is compressed, so need to uncompress first
# wget https://download.fedoraproject.org/pub/fedora/linux/releases/37/Cloud/x86_64/images/Fedora-Cloud-Base-37-1.7.x86_64.raw.xz
# xz -d -v Fedora-Cloud-Base-37-1.7.x86_64.raw.xz
# create_template 920 "template-fedora-37" "Fedora-Cloud-Base-37-1.7.x86_64.raw"

# ## CentOS Stream
# #Stream 8
# wget https://cloud.centos.org/centos/8-stream/x86_64/images/CentOS-Stream-GenericCloud-8-20220913.0.x86_64.qcow2
# create_template 930 "template-centos-8-stream" "CentOS-Stream-GenericCloud-8-20220913.0.x86_64.qcow2"
# #Stream 9 (daily) - they don't have a 'latest' link?
# wget https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-20230123.0.x86_64.qcow2
# create_template 931 "template-centos-9-stream-daily" "CentOS-Stream-GenericCloud-9-20230123.0.x86_64.qcow2"
