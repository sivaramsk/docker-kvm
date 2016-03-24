FROM ubuntu:trusty

RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get -y install kvm qemu-kvm libvirt-bin bridge-utils libguestfs-tools aria2 unzip dos2unix unrar-free wget git

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3389
EXPOSE 5900

VOLUME /etc/libvirt
VOLUME /var/lib/libvirt

CMD /entrypoint.sh
