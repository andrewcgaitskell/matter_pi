
# used the following approach to find out where esp32 plugged in

https://gunthervd.github.io/connect-ESP32-with-linux.html

# Docker image frn unbuntu

docker pull ubuntu:20.04 --platform linux/arm64/v8

docker run -t -i --device=/dev/ttyUSB0 ubuntu:20.04 bash

update and upgrade

install python

https://computingforgeeks.com/how-to-install-python-on-ubuntu-linux-system/

        sudo apt update
        sudo apt install build-essential zlib1g-dev libncurses5-dev \
        libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

        wget https://www.python.org/ftp/python/3.10.9/Python-3.10.9.tgz

        tar -xf Python-3.10.*.tgz

        cd Python-3.10.*/

        ./configure --enable-optimizations
        
        make -j $(nproc)
        
        sudo make install

# Prerequistes for idf

        https://docs.espressif.com/projects/esp-idf/en/v4.4.2/esp32/get-started/index.html#step-1-install-prerequisites

        apt-get install git wget flex bison gperf python3-pip python3-setuptools cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0

# install esp-idf

        mkdir -p /opt/esp
        cd /opt/esp
        git clone -b v4.4.2 --recursive https://github.com/espressif/esp-idf.git

        cd /opt/esp/esp-idf
        ./install.sh esp32 esp32s2

# set up environment

        cd /opt/esp/esp-idf/
        source export.sh

# prerequisistes for matter sdk

https://github.com/project-chip/connectedhomeip/blob/master/docs/guides/BUILDING.md#prerequisites

        apt-get install git gcc g++ pkg-config libssl-dev libdbus-1-dev \
             libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
             python3-pip unzip libgirepository1.0-dev libcairo2-dev libreadline-dev

# install matter sdk

        git clone --depth 1 https://github.com/espressif/esp-matter.git
        cd esp-matter
        git submodule update --init --depth 1
        ./connectedhomeip/connectedhomeip/scripts/checkout_submodules.py --platform esp32 --shallow
        ./install.sh
        cd ..

# configure envs

cd /opt/esp/esp-idf; . ./export.sh; cd ..
cd /opt/esp/esp-matter; . ./export.sh; cd ..

# Docker Image



# Dockerfile Notes

create a user



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

note chip did not work

docker run -t -i --device=/dev/ttyUSB0 espressif/esp-matter:chip bash


docker run -t -i --device=/dev/ttyUSB0 espressif/esp-matter:latest bash

--platform linux/arm64/v8

docker pull espressif/esp-matter:latest --platform linux/arm64/v8

docker run -t -i --device=/dev/ttyUSB0 --platform linux/arm64/v8 espressif/esp-matter:latest bash


# moving away from pi




trying this

https://docs.espressif.com/projects/esp-matter/en/main/esp32/developing.html

2.1.3 Configuring the Environment

This should be done each time a new terminal is opened

cd /media/andrewcgaitskell/ACG34Plex/esp/esp-idf/; . ./export.sh;
cd /media/andrewcgaitskell/ACG34Plex/esp/esp-matter/; . ./export.sh;
cd /media/andrewcgaitskell/ACG34Plex/esp/esp-matter/connectedhomeip/connectedhomeip/examples/all-clusters-app/esp32/

idf.py menuconfig
idf.py -p /dev/ttyACM0 erase_flash
idf.py -p /dev/ttyACM0 flash monitor

idf.py -D 'SDKCONFIG_DEFAULTS=sdkconfig_m5stack.defaults' build



will try this for just esp32 support

git clone --depth 1 https://github.com/espressif/esp-matter.git
cd esp-matter
git submodule update --init --depth 1
./connectedhomeip/connectedhomeip/scripts/checkout_submodules.py --platform esp32 --shallow
./install.sh
cd ..

Checking the environment:

20230118 13:00:55 INF Environment passes all checks!

Environment looks good, you are ready to go!

To reactivate this environment in the future, run this in your 
terminal:

  source ./activate.sh

To deactivate this environment, run this:

  deactivate



cd /home/andrewcgaitskell/esp/esp-matter/connectedhomeip/connectedhomeip/examples/all-clusters-app/esp32

esp32-s3

git clone -b v4.4.3 --recursive https://github.com/espressif/esp-idf.git esp-idf-v4.4.3



A1.6 Onboard LED not working

The LED on my devkit is not working:

    Make sure you have selected the proper device. You can explicitly do that by exporting the ESP_MATTER_DEVICE_PATH to the correct path.

    Check the version of your board, and if it has the LED connected to a different pin. If it is different, you can change the led_driver_config_t accordingly in the device.c file.

    If you are still facing issues, reproduce it on the default example for the device and then raise it here. Make sure to share these:

        The complete device logs taken over UART.

        The esp-matter and esp-idf branch you are using.

        The devkit and its version that you are using.

# light example refers to esp32s2

https://docs.espressif.com/projects/esp-matter/en/main/esp32/developing.html



