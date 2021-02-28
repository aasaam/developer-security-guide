# Ubuntu installation guide

This is guide to how to install and configuration your Ubuntu desktop for development.

## Partitioning

For partitioning better to add `/data` for mount persist data instead of using `/home/username`.

Leave `/home` for temporary linux data and wipe after reinstall your Ubuntu.

### Example

Here some example.

| Number | Path    | File System | Recommended sizes                      | Description    |
| ------ | ------- | ----------- | -------------------------------------- | -------------- |
| 1      |         | `fat32`     | **256** MB to **512** MB               | EFI partition  |
| 2      | `/boot` | `ext4`      | **2048** MB to **4096** MB             | boot partition |
| 3      |         | `swap`      | **16384** MB to **32768** MB           | swap           |
| 4      | `/`     | `ext4`      | **65536** MB to **131072** MB          | root partition |
| 5      | `/home` | `ext4`      | **131072** MB to **262144** MB         | home partition |
| 6      | `/data` | `ext4`      | Rest of your space                     | data partition |
| 7      | `/fast` | `ext4`      | Rest of your space on high speed disks | fast partition |

1. Required if your BIOS is set up in EFI mode
2. Much space help you to keep older version of kernel for backward compatibility.
3. Put into your SSD/NVMe hdd if you have, Increase your swap but after installation you will set swappiness to 0.
4. Put into your SSD/NVMe hdd if you have.
5. User space data partition generally speed doesn't matter.
6. You actual portion for store project and data, keep it safe.
7. Optional when you have high speed storage like SSD/NVMe. You actual portion for store tmp data need to be fast like Virtual Machines, Docker vars and etc...

#### Note

Use max size if you have enough space.

## Installation

* During installation check **Minimal** with **Install 3rd party software**.
* Select your country and set the password and select required during login.
* Set machine/host name as regular all lowercase one like `john-laptop` instead of `john-lenovo-2020-Laptop`

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

## Repositories

Do not add repositories unless you know the source and privacy aspect of application.

## Generic packages and applications

```bash
sudo apt install build-essential curl git gnupg2 gpg gpgv2 htop iotop lm-sensors openssh-client p7zip-full pwgen ufw vnstat wget \
  keepassxc vlc pidgin docker.io unzip unrar proxychains tor \
  virtualbox virtualbox-guest-additions-iso virt-manager
```

Via snap craft:

```bash
# recommended
sudo snap install skype
sudo snap install chromium
sudo snap install telegram-desktop

# optionals
sudo snap install robo3t-snap # mongo gui for desktop
sudo snap install beekeeper-studio # sql gui for desktop
sudo snap install redis-desktop-manager # redis gui for desktop
sudo snap install opera
sudo snap install brave
sudo snap install signal-desktop
sudo snap install rocketchat-desktop
```

### Freeware application

Do not install freeware application as you can.

Here list of known repositories you can use but careful with those.

* [VSCode](https://code.visualstudio.com/download)

## Configure firewall

```bash
sudo ufw default deny incoming
sudo ufw allow 80   # http
sudo ufw allow 443  # https
sudo ufw allow 8080-8090  # http/proxy
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

## Development Stuff

Using **Generate secrets and identity** will generate all you need.
