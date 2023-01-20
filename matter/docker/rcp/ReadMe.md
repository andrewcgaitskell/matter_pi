
# main example for rcp

https://github.com/openthread/ot-nrf528xx


# copy from pi to host

https://www.industrialshields.com/blog/raspberry-pi-for-industry-26/post/how-to-use-scp-to-transfer-files-between-linux-and-raspberry-plc-326

# reset dongle before writing

https://infocenter.nordicsemi.com/index.jsp?topic=%2Fug_nrf52840_dongle%2FUG%2Fnrf52840_Dongle%2Fprogramming.html

# OTBR Docker

docker run --sysctl "net.ipv6.conf.all.disable_ipv6=0 net.ipv4.conf.all.forwarding=1 net.ipv6.conf.all.forwarding=1" -p 8080:80 --dns=127.0.0.1 -it --volume /dev/ttyACM0:/dev/ttyACM0 --privileged openthread/otbr --radio-url spinel+hdlc+uart:///dev/ttyACM0

