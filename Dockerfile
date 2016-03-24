FROM ubuntu:trusty

RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get -y install kvm qemu-kvm libvirt-bin bridge-utils libguestfs-tools aria2 unzip dos2unix unrar-free wget git

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD /entrypoint.sh
