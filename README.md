# docker-kvm
Run qemu/kvm vm's inside a docker container

If you want need full fledged kvm working under docker, please check rancheros. This is a simple implementation of kvm/qemu inside docker, but functional. The ports that need to be exposed from the VM can be exposed like docker's -p, which can be exposed to the host with -p of the docker command. 

To run container, 

docker run --privileged -p 3022:3022 -e PORTMAP="-net user,hostfwd=tcp::3389-:3389 -redir tcp:3022::22" -e RAM_SIZE=2048 -e IMAGE_PATH=/ubuntu.img -v /home/siva/ubuntu.img:/ubuntu.img sivaramsk/docker-kvm:0.1
