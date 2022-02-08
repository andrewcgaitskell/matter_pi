# python and bullseye

python is already 3.9.2

pip also already installed - 20.3.4

git also already version - 2.30.2

# install system libraries

sudo apt install flac

sudo apt install llvm

# pipenv

pip install --user pipenv

export PATH=/home/pi/.local/bin:$PATH

edit Pipfile and make sure it has latest version of Python

# remove the virtial environment

pipenv -rm

# recreate the virtual environment

pipenv install

# install python packages

pipenv shell

pip install pandas

pip install pyaudio

pip install jupyter

pip install pocketsphinx

pip install SpeechRecognition

pip install librosa

# exit virtual environment

exit


# original before upgrade to bullseye

please note it was a mistake to try and upgrade to bullseye by editing apt path

sudo apt install python-software-properties

sudo apt install software-properties-common

sudo apt install python3
sudo apt install python3-dev
sudo apt install libpq-dev

sudo apt install python3-pip

sudo apt install python3-venv

sudo apt-get install libatlas-base-dev
