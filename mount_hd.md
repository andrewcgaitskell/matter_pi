sing Rasperry Pi 3

https://www.raspberrypi.org/downloads/noobs/

NOOBS_lite_v2_8.zip

https://www.raspberrypi.org/documentation/configuration/raspi-config.md

    sudo raspi-config
      auto login
      enable ssh
      setup wifi


https://www.raspberrypi.org/documentation/raspbian/updating.md

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get dist-upgrade

Connecting External HDD to Pi and making it automatic  
https://www.raspberrypi.org/documentation/configuration/external-storage.md


Mounting a Storage Device

You can mount your storage device at a specific folder location. It is conventional to do this within the /mnt folder, for example /mnt/mydisk. Note that the folder must be empty.

    Plug the storage device into a USB port on the Raspberry Pi.

    List all the disk partitions on the Pi using the following command:

     sudo lsblk -o UUID,NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL

    The Raspberry Pi uses mount points / and /boot. Your storage device will show up in this list, along with any other connected storage.

    Use the SIZE, LABEL, and MODEL columns to identify the name of the disk partition that points to your storage device. For example, sda1.

    The FSTYPE column contains the filesystem type. If your storage device uses an exFAT file system, install the exFAT driver:

     sudo apt update
     sudo apt install exfat-fuse

    If your storage device uses an NTFS file system, you will have read-only access to it. If you want to write to the device, you can install the ntfs-3g driver:

     sudo apt update
     sudo apt install ntfs-3g

    Run the following command to get the location of the disk partition:

     sudo blkid

    For example, /dev/sda1.

    Create a target folder to be the mount point of the storage device. The mount point name used in this case is mydisk. You can specify a name of your choice:

     sudo mkdir /mnt/mydisk

    Mount the storage device at the mount point you created:

     sudo mount /dev/sda1 /mnt/mydisk

    Verify that the storage device is mounted successfully by listing the contents:

     ls /mnt/mydisk


# Setting up Automatic Mounting

You can modify the fstab file to define the location where the storage device will be automatically mounted when the Raspberry Pi starts up. In the fstab file, the disk partition is identified by the universally unique identifier (UUID).

    Get the UUID of the disk partition:

     sudo blkid

    Find the disk partition from the list and note the UUID. For example, 5C24-1453.
    
    UUID="59F4-5DFC"

    Open the fstab file using a command line editor such as nano:

     sudo nano /etc/fstab

    Add the following line in the fstab file:

     UUID=59F4-5DFC /mnt/mydisk fstype defaults,auto,users,rw,nofail 0 0
     
     UUID=59F4-5DFC /mnt/mydisk exfat defaults,auto,users,rw,nofail,umask=000 0 0
     
     
     diagnosing
     
     sudo mount -o uid=1000,gid=1000,noatime,umask=007 --uuid 780C18A30C185E86 /External
     
     sudo mount UUID=59F4-5DFC ntfs defaults,auto,users,rw,nofail,umask=000 0 0 /mnt/mydisk
     

    Replace fstype with the type of your file system, which you found in step 2 of 'Mounting a storage device' above, for example: ntfs.

    If the filesystem type is FAT or NTFS, add ,umask=000 immediately after nofail - this will allow all users full read/write access to every file on the storage device.

Now that you have set an entry in fstab, you can start up your Raspberry Pi with or without the storage device attached. Before you unplug the device you must either shut down the Pi, or manually unmount it using the steps in 'Unmounting a storage device' below.
Note
	if you do not have the storage device attached when the Pi starts, the Pi will take an extra 90 seconds to start up. You can shorten this by adding ,x-systemd.device-timeout=30 immediately after nofail in step 4. This will change the timeout to 30 seconds, meaning the system will only wait 30 seconds before giving up trying to mount the disk.

For more information on each Linux command, refer to the specific manual page using the man command. For example, man fstab.



# Fixing the IP address of the Pi

https://www.raspberrypi.org/documentation/remote-access/ip-address.md

# Finding MAC Address of Pi

https://www.raspberrypi-spy.co.uk/2012/06/finding-the-mac-address-of-a-raspberry-pi/

# Setting Up NAS

https://eltechs.com/raspberry-pi-nas-guide/

Needed to add Pi as user and restart


https://elinux.org/R-Pi_NAS


# Renaming Media Files and Adding Tags from Original File Locations

Needed Pip3 Installed

    sudo apt-get install python3-pip

Useful Diagram to get from Epoc Seconds to ISO Date & Time

https://wiki.python.org/moin/WorkingWithTime

https://packages.debian.org/jessie/python-pyexiv2

sudo apt-get install python-pyexiv2

# Installing Postgres

https://opensource.com/article/17/10/set-postgres-database-your-raspberry-pi

sudo apt install postgresql libpq-dev postgresql-client postgresql-client-common -y
