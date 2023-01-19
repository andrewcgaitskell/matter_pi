

https://gunthervd.github.io/connect-ESP32-with-linux.html


# Docker Image


docker pull espressif/idf:release-v4.4

docker pull espressif/esp-matter:chip

# Dccker Create Container

## interactive sessions

try the following

docker run -t -i --device=/dev/ttyUSB0 ubuntu bash

### idf

docker run -t -i --device=/dev/ttyUSB0 espressif/idf:release-v4.4 bash




## matter


docker run -t -i --device=/dev/ttyUSB0 espressif/esp-matter:chip bash
