FROM ubuntu:14.04.4

RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get -y install kvm qemu-kvm libvirt-bin bridge-utils libguestfs-tools

ADD entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh
