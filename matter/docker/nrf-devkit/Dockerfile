FROM ubuntu:latest
RUN whereis python
RUN whereis python3
RUN apt-get update && apt-get install -y apt-utils
RUN apt-get install -y software-properties-common && apt-get install -y sudo && apt-get install unzip && apt-get install -y udev
RUN apt-get update
RUN mkdir /opt/downloads
COPY DeviceDownload.zip /opt/downloads
RUN unzip /opt/downloads/DeviceDownload.zip -d /opt/downloads
RUN unzip /opt/downloads/nRF5_SDK_17.1.0_ddde560.zip
RUN unzip /opt/downloads/s113nrf52720.zip
RUN unzip /opt/downloads/s140nrf52720.zip
COPY nrf-command-line-tools_10.19.0_arm64.deb /opt/downloads
COPY JLink_Linux_V784c_arm64.deb /opt/downloads
COPY JLink_Linux_V784c_arm64.deb.sig /opt/downloads
RUN dpkg -i  /opt/downloads/JLink_Linux_V784c_arm64.deb
RUN apt-get install -y /opt/downloads/nrf-command-line-tools_10.19.0_arm64.deb
