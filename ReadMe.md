Introduction

# Created a Pi with a Lite Image

## Installed Docker

https://docs.docker.com/engine/install/ubuntu/

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

## Get Raspian Image

try to download the root file from this location

wget https://downloads.raspberrypi.org/raspbian_lite/root.tar.xz

may try:

      https://downloads.raspberrypi.org/raspios_lite_arm64/root.tar.xz

## Unzip Raspian Image

unxz root.tar.xz

## Current Operating System

root@pi64:/home/pi64/code/docker# lsb_release -a
No LSB modules are available.
Distributor ID:	Debian
Description:	Debian GNU/Linux 11 (bullseye)
Release:	11
Codename:	bullseye



Easier approach to extracting the root filesystem and not the boot system

https://www.computerhope.com/unix/losetup.htm

Very straightforward way of creating a Docker image

https://www.boulderes.com/resource-library/building-raspberry-pi-disk-images-with-docker-a-case-study-in-software-automation

# Get root.tar file for latest bullseye
      
      wget https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2022-09-26/2022-09-22-raspios-bullseye-arm64-lite.img.xz
      unxz 2022-09-22-raspios-bullseye-arm64-lite.img.xz
      cp 2022-09-22-raspios-bullseye-arm64-lite.img raspian.img
      sudo su
      
      losetup -Pf raspian.img 
      losetup -j raspian.img 
      mount /dev/loop0p2 /mnt
      tar cf root.tar -C /mnt .
      umount /mnt

# Create Dockerfile

nano Dockerfile

      from scratch
      user root
      add root.tar /
      RUN apt-get update & apt-get -y upgrade
      RUN mkdir /home/python310
      RUN cd /home/python310
      RUN wget https://www.python.org/ftp/python/3.10.9/Python-3.10.9.tgz
      RUN tar -zxvf Python-3.10.9.tgz
      RUN cd Python-3.10.9 && ./configure && make altinstall
      RUN whereis python
      CMD ["/bin/bash"]

##

# Podman Pull

podman login docker.io

podman push


# Create Image

docker build -t raspi-base .

# Run Container

docker run --name mycontainer -d -i -t alpine /bin/sh

docker run --name mypicont -d -i -t raspi-base:latest /bin/sh

docker run --name cont_raspi-python310 -d -i -t raspi-python310:latest /bin/sh

# Connect to Container

docker exec -it mycontainer sh

docker exec -it mypicont sh

docker exec -it cont_raspi-python310 sh

# List Containers

docker ps

find container id

copy and paste into command below

# Commit changes

docker commit c2bb6383ff6e raspi-base:v1

# Push Image to docker.io

      docker login

      docker image tag raspi-python310 andrewcgaitskell/raspi-python310:latest

      docker push andrewcgaitskell/raspi-python310:latest


# Logout of docker io and exit su

      docker logout
      
      exit

# Pull Image from docker.io in podman

      podman login docker.io

      podman pull docker.io/andrewcgaitskell/raspi-python310:latest

# Create Container in Podman



# Links found

https://stackoverflow.com/questions/67838895/docker-access-to-raspberry-pi-gpio-pins-privileged-does-not-work

https://stackoverflow.com/questions/30059784/docker-access-to-raspberry-pi-gpio-pins

https://wiki.metacentrum.cz/wiki/Creating_Docker_Image_from_.iso_File

https://www.raspberrypi.com/software/operating-systems/

https://docs.podman.io/en/latest/markdown/podman-import.1.html

https://docs.oracle.com/en/learn/intro_podman/index.html#run-the-oracle-linux-8-slim-image

trying

podman import --change CMD=/bin/bash --change ENTRYPOINT=/bin/sh 2022-09-22-raspios-bullseye-arm64-lite.img.xz

alternatives

https://bleepcoder.com/podman/516849778/podman-import-from-a-tarball-doesn-t-preserve-metadata


Pi is stuck on storing signatures

https://github.com/containers/podman/issues/3323

hope to upload image to docker.io

https://stackoverflow.com/questions/55322347/docker-how-to-get-docker-image-to-github
