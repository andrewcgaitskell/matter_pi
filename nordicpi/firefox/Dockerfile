FROM ubuntu:latest
RUN whereis python
RUN whereis python3
RUN apt-get update && apt-get install -y apt-utils && apt-get install -y software-properties-common && apt-get install -y sudo
RUN apt-get update
RUN apt install -y xauth
RUN xauth add raspberrypi/unix:0  MIT-MAGIC-COOKIE-1  18b1866ab7a5bb44dd77b6228974a27c
RUN add-apt-repository ppa:mozillateam/ppa
RUN echo 'Package: * Pin: release o=LP-PPA-mozillateam Pin-Priority: 1001' && tee /etc/apt/preferences.d/mozilla-firefox
RUN echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
RUN apt-get install -y firefox-esr
RUN whereis python3
RUN whereis firefox-esr
CMD firefox-esr
