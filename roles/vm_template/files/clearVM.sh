#!/bin/bash
    hostnamectl set-hostname localhost.localdomain
    rm -rf /etc/udev/rules.d/*
    chmod 777 /etc/machine-id
    > /etc/machine-id
    chmod 444 /etc/machine-id
    touch /.unconfigured
    systemctl enable initial-setup.service
    subscription-manager unregister
    subscription-manager remove --all
    subscription-manager clean
    rm -rf /etc/yum.repos.d/*
    sed -i '/^UUID=.*/d' /etc/sysconfig/network-scripts/ifcfg-*
    sed -i '/^NETWORK=.*/d' /etc/sysconfig/network-scripts/ifcfg-*
    sed -i '/^NETMASK=.*/d' /etc/sysconfig/network-scripts/ifcfg-*
    sed -i '/^PREFIX=.*/d' /etc/sysconfig/network-scripts/ifcfg-*
    sed -i '/^IPADDR=.*/d' /etc/sysconfig/network-scripts/ifcfg-*
    sed -i '/^HWADDR=.*/d' /etc/sysconfig/network-scripts/ifcfg-*
    sed -i '/^GATEWAY=.*/d' /etc/sysconfig/network-scripts/ifcfg-*
    sed -i '/^DNS.*/d' /etc/sysconfig/network-scripts/ifcfg-*
    sed -i '/^USERCTL=no/d' /etc/sysconfig/network-scripts/ifcfg-*
    sed -i 's/^BOOTPROTO=.*/BOOTPROTO=dhcp/g' /etc/sysconfig/network-scripts/ifcfg-*
#    rm -rf /etc/ssh/ssh_host_*
#    yum history new
#    history -c

    exit 0
