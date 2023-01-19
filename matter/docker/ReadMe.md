

https://gunthervd.github.io/connect-ESP32-with-linux.html


# Docker Image


docker pull espressif/idf:release-v4.4

docker pull espressif/esp-matter:chip

# Dccker Create Container

## interactive sessions

try the following

docker run -t -i --device=/dev/ttyUSB0 ubuntu bash

### idf

as normal mode failed

as root?

docker run -t -i --device=/dev/ttyUSB0 espressif/idf:release-v4.4 bash

docker run -t -i --privileged -v /dev/bus/usb:/dev/bus/usb ubuntu bash

docker run -t -i --privileged -v /dev/ttyUSB0:/dev/ttyUSB0 idf:latest bash

## inside container

cd /opt/esp/idf/examples/get-started/blink

idf.py set-target esp32s2

idf.py menuconfig

set gpio 8

idf.py -p /dev/ttyUSB0 flash monitor


## matter


docker run -t -i --device=/dev/ttyUSB0 espressif/esp-matter:chip bash
