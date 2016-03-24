#!/bin/bash
set -e

# Create the kvm node (required --privileged)
if [ ! -e /dev/kvm ]; then
   mknod /dev/kvm c 10 $(grep '\<kvm\>' /proc/misc | cut -f 1 -d' ')   
fi

# If we have a BRIDGE_IF set, add it to /etc/qemu/bridge.conf
if [ -n "$BRIDGE_IF" ]; then
   echo "allow $BRIDGE_IF" >/etc/qemu/bridge.conf

   # Make sure we have the tun device node
   if [ ! -e /dev/net/tun ]; then
      mkdir -p /dev/net
      mknod /dev/net/tun c 10 $(grep '\<tun\>' /proc/misc | cut -f 1 -d' ')
   fi
fi

#PORT EXPOSE FORMAT
#-net user,hostfwd=tcp::3389-:3389 -redir tcp:3022::22

if [[ -z $RAM_SIZE ]] || [[ -z $IMAGE_PATH ]]; then
	echo "Please define $RAM_SIZE and $IMAGE_PATH to launch the kvm"
	exit
fi

qemu-system-x86_64 -net nic,model=rtl8139 $PORTMAP -m $RAM_SIZE -localtime -smp 2 -k en-us -hda $IMAGE_PATH  -nographic
