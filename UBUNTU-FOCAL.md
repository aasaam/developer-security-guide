# Ubuntu 20.04 (Focal)

This is guide to how to install and configuration your Ubuntu desktop for development.

## Installation

During installation check **Minimal** with **Install 3rd party software**.

For partitioning better to add `/data` for mount persist data instead of using `/home/username`.

## Update packages

Switch to `root` user then set your proxy server, update the repositories and upgrade packages:

```bash
sudo apt update
sudo apt upgrade
```

Update snap craft packages:

```bash
sudo snap refresh
```

Reboot.

## Install additional drivers

Open **Software & Updates** on tab **Additional Drivers** install install proprietary drivers, then reboot.

## Language settings

Open **Language support**, install missing packages. On Regional Formats select **English (United States)** and click **Apply System-Wide**.

Then on **Language** click on **Install / Remove Languages...** then select proper one and deselect invalid ones and wait for installation complete.

On **Setting** > **Region & Language** add your desire **Input Sources**.

## Generic packages and applications

```bash
sudo apt install build-essential curl git gnupg2 gpg gpgv2 htop iotop lm-sensors openssh-client p7zip-full pwgen ufw vnstat wget \
  keepassxc vlc pidgin docker.io unzip unrar proxychains tor \
  virtualbox virtualbox-guest-additions-iso virt-manager
```

Via snap craft:

```bash
# install
sudo snap install signal-desktop
sudo snap install beekeeper-studio
sudo snap install robo3t-snap
```

## Configure firewall

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
```

### Firefox Developer

```bash
mkdir -p $HOME/Applications \
  && rm -rf /tmp/firefox-dev-downloader \
  && mkdir -p /tmp/firefox-dev-downloader \
  && cd /tmp/firefox-dev-downloader \
  && wget 'https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US' -O firefox-dev.tgz \
  && tar -xf firefox-dev.tgz \
  && rm -rf firefox-dev.tgz \
  && mv `realpath firefox*` $HOME/Applications/
```

### Telegram Desktop

```bash
mkdir -p $HOME/Applications \
  && rm -rf /tmp/telegram-dev-downloader \
  && mkdir -p /tmp/telegram-dev-downloader \
  && cd /tmp/telegram-dev-downloader \
  && wget 'https://telegram.org/dl/desktop/linux' -O telegram-dev.tgz \
  && tar -xf telegram-dev.tgz \
  && rm -rf telegram-dev.tgz \
  && mv `realpath Telegra*` $HOME/Applications/
```

## Requirement softwares

Install the requirement packages and softwares:

### Python

Python is already install so we need to install pip and other stuff.

```bash
sudo apt install python3-distutils
cd /tmp
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo pip3 install virtualenv
```

#### docker

```bash
sudo apt install docker.io
sudo pip3 install docker-compose
```

### Node.JS

```bash
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm -g update
```

### Ansible (For system administrators)

```bash
sudo pip3 install ansible
```
