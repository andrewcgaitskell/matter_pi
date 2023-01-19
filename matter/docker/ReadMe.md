
# used the following approach to find out where esp32 plugged in

https://gunthervd.github.io/connect-ESP32-with-linux.html


# Docker Image


docker pull espressif/idf:release-v4.4

docker pull espressif/esp-matter:chip

# Dccker Create Container

## interactive sessions

try the following

all docker must be done as sudo

sudo su

docker run -t -i --device=/dev/ttyUSB0 ubuntu bash

### idf

as normal mode failed

as root?

sudo su

docker run -t -i --device=/dev/ttyUSB0 espressif/idf:release-v4.4 bash

saved and using local & changed version

docker run -t -i --device=/dev/ttyUSB0 localhost/esp32s2v1:latest

## not tried

docker run -t -i --privileged -v /dev/bus/usb:/dev/bus/usb ubuntu bash

docker run -t -i --privileged -v /dev/ttyUSB0:/dev/ttyUSB0 idf:latest bash

## inside container

cd /opt/esp/idf/examples/get-started/blink

idf.py set-target esp32s2

idf.py menuconfig

set gpio 18

idf.py -p /dev/ttyUSB0 flash monitor

'control ]' to exit interactive session

'exit' to exit container

## after interactive session

'docker ps -a' - list running containers

find id of the running container and create suitable name for the image version

    docker commit f8bc671b47d7 esp32s2v2:latest

'docker images' show images on system

sudo and pi user have different images

## matter


docker run -t -i --device=/dev/ttyUSB0 espressif/esp-matter:chip bash

docker run -t -i --device=/dev/ttyUSB0 espressif/esp-matter:chip bash
