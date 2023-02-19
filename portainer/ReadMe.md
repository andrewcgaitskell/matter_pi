# Reference & Thanks

https://pimylifeup.com/raspberry-pi-portainer/

# Assumptions

## SSH setup
## Docker installed
## Remote access works


# Steps

## Update pi

    sudo su
    apt-get update
    apt-get upgrade

## Pull portainer image

    docker pull portainer/portainer-ce:latest
    
## Create and run container

    docker run -d -p 9000:9000 --name=portainer --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data \
    portainer/portainer-ce:latest
    
    
## Using Docker Compose instead

### name docker-compose.yml

### YML file

      version: '3.0'

      services:
        portainer:
          container_name: portainer
          image: portainer/portainer-ce
          restart: always
          ports:
            - "9000:9000/tcp"
          environment:
            - TZ=Europe/London
          volumes:
            - /var/run/docker.sock:/var/run/docker.sock
            - /opt/portainer:/data

### command

        docker-compose up -d
        
        docker compose up -d
        
# Home Assistant Container

## using docker

### pull image

        docker pull ghcr.io/home-assistant/home-assistant:stable

        docker run -d -p 9000:9000 --name=portainer --restart=always \
            -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data \
            portainer/portainer-ce:latest

        -v /opt/homeassistant/config:/config \

        docker run -d -p 8123:8123 --name=homeassistant --restart=always \
            -v /etc/localtime:/etc/localtime:ro \
            --network host \
            --privileged \
            ghcr.io/home-assistant/home-assistant:stable


## using yml

        container_name: homeassistant
            image: "ghcr.io/home-assistant/home-assistant:stable"
            volumes:
              - /opt/homeassistant/config:/config
              - /etc/localtime:/etc/localtime:ro
            restart: unless-stopped
            privileged: true
            network_mode: host
