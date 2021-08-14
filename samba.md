Step 2: Install Samba on our Raspberry Pi

    After your Raspbian operating system is up to date, now we will have to install the Samba software on the Raspberry Pi.
    To install the Samba packages, key in the following command: 

sudo apt-get install samba samba-common-bin

Step 3: Creating a Shared Folder

    Now, we will have to create a place where you can store and share all of your stuff
    This folder can be located anywhere, it is completely up to you. It can even on a mounted external hard drive.
    For this tutorial, we will be creating a public and private folder that will be accessible on the NAS:

mkdir /home/pi/shared

Step 4: Sharing folder using Samba

    Next, we will be sharing the above folder using Samba. To do this, you will have to modify the Samba configuration file.
    Key in the following command to edit the file:

sudo nano /etc/samba/smb.conf

    In addition, just below the authentication section of the file, paste this following line: 

security = user

Step 5: Define Sharing Parameters

    Within this file, add the following to the bottom. This text defines various details of share. 

[seeedstudioshare]
path = /home/pi/shared
writeable=Yes
create mask=0777
directory mask=0777
public=no

[seeedstudioshare]: This defines the address and other configurations of the shared folder. For example, the shared folder will be created at the following address: \\raspberrypi\seeedstudioshare. You can rename it to whatever you like as well.

path: This option contains the address of the directory that is going to be shared. If you wish to store the shared folder on an external drive, just change to path option here to point it towards your external drive.

writeable: If this option is set to yes, the folder will be writable.

create mask & directory mask: This option defines the permissions for the folder and the files it contains. By setting it to 0777, it will allow users to read, write and execute.

public: This option is used to give permission to either give any user access to the folder or restricted access. With the option set to “no”, the Raspberry Pi needs a valid user to grant access to shared folders.

Step 6: Save Changes

    Now that we are done with the changes made to the file, we will now save it by pressing CTRL + X then Y and hit ENTER.

Step 7: Make a User for Samba on the Raspberry Pi

    Next, we will make a user for our Samba server on the Raspberry Pi in order for us to make a connection to the shared network drive.
    We will run a command to create a Samba user called “Pi”:

sudo smbpasswd -a pi

    After running this command, you will be prompted to set a password that is up to you.
    With this user “Pi” you can access and manage the Samba folder from Windows, macOS, or other Raspberry Pi devices
    If you wish to create additional users, key in the following commands: 

sudo adduser username
sudo smbpasswd -a username

    Replace “username” with your choice of username. 

Step 8: Retrieve Raspberry Pi local IP address

    Lastly, we will have to retrieve our Raspberry Pi’s local IP address when connecting to Samba.
    This is in the event the connection fails on your home network where we can still use the IP address to connect to the Samba Share
    For this, make sure that you are connected to a network by either an ethernet cable or Wifi.
    Key in the following command to get your Pi local IP address: 

hostname -I
