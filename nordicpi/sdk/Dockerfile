
apt-get update
apt-get install vim vifm ssh sshd iproute2 iputils-ping sshfs build-essential dos2unix git usbutils
adduser mydevuser
/etc/init.d/ssh start
ip a

    // As mydevuser user in the docker container:
- Download and unzip gcc compilers from ARM (gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2)
- Download and unzip nRF5SDK (nRF5SDK160098a08e2.zip)
- Download and unzip soft device (s113nrf52701.zip)
- Download and unzip command line tools (nRF-Command-Line-Tools_10_4_1_Linux-amd64.tar.gz)
    // Configure for our compiler, here is my updated GNU_INSTALL_ROOT
~/nRF5SDK/components/toolchain/gcc ..) head Makefile.posix
            GNU_INSTALL_ROOT ?= /home/mydevuser/gcc/gcc-arm-none-eabi-8-2019-q3-update/bin/
    // Now lets compile some examples
~/nRF5SDK/external/micro-ecc/nrf52hf_armgcc/armgcc ..) make
~/nRF5SDK/examples/dfu/secure_bootloader/pca10100_s113_ble_debug/armgcc ..) make
~/nRF5SDK/examples/peripheral/spi/pca10056/blank/armgcc ..) make

    // As root in the docker container:
mv /home/mydevuser/cli_nrf/mergehex /opt/
mv /home/mydevuser/cli_nrf/nrfjprog/ /opt/
ln -s /opt/nrfjprog/nrfjprog /usr/local/bin/nrfjprog
ln -s /opt/mergehex/mergehex /usr/local/bin/mergehex
cp -pv /home/mydevuser/cli_nrf/JLink_Linux_V650b_x86_64/libjlinkarm* /lib/x86_64-linux-gnu/

    // As root in the docker container:
    // Load the firmware over USB to the dev board:
nrfjprog -f NRF52 --program nrf52840_xxaa.hex --chiperase --log
