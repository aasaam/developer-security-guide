#!/bin/bash
# Copyright (c) 2021 aasaam software development group

export TZ=UTC

INFRASTRUCTURE_NAME=aasaam

DARKGRAY='\033[1;30m'
RED='\033[0;31m'
LIGHTRED='\033[1;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
LIGHTPURPLE='\033[1;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
SET='\033[0m'

SCRIPT="$(readlink --canonicalize-existing "$0")"
PROJECT_PATH=`dirname $SCRIPT`
OUT_PATH=$PROJECT_PATH/output

function render_template() {
  eval "echo \"$(cat $1)\""
}

echo -e "${BLUE}$INFRASTRUCTURE_NAME developer security tool:${SET}"

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo "You must enter name, username and email. $SCRIPT 'John Smith' 'john' 'john@domain.tld'"
  exit 1
fi

CLIENT_NAME=$1
CLIENT_USER=$2
CLIENT_EMAIL=$3

FILENAME=$(echo $CLIENT_USER | sed -e 's/[^A-Za-z0-9._-]/_/g' | tr '[:upper:]' '[:lower:]')
CLIENT_DIR=$OUT_PATH/$FILENAME
CLIENT_HOME=$CLIENT_DIR/home

if [ -e "$OUT_PATH/$FILENAME.7z" ]; then
  echo -e "${RED}Archive exist. Try remove and recreat again.${SET}"
  exit
fi

echo -e "${CYAN}Enter sudo password:${SET}"

sudo apt-get install -y -qq gpg gpgv2 gnupg2 git openssh-client p7zip-full pwgen

echo -e "${YELLOW}Random password for usage ========================================= ${SET}"
pwgen -n 32 -s -1
pwgen -n 32 -s -1
pwgen -n 32 -s -1
pwgen -n 32 -s -1
echo -e "${YELLOW}=================================================================== ${SET}"

echo -e "${YELLOW}Enter SSH passphrase:${SET}"
read -s SSH_PASSWORD

echo -e "${YELLOW}Enter SSH passphrase again:${SET}"
read -s SSH_PASSWORD2

echo -e "${YELLOW}Enter PGP passphrase:${SET}"
read -s PGP_PASSWORD

echo -e "${YELLOW}Enter PGP passphrase again:${SET}"
read -s PGP_PASSWORD2

if [ "$SSH_PASSWORD" != "$SSH_PASSWORD2" ]; then
  echo "SSH passphrase did not matched."
  exit
fi

if [ "$PGP_PASSWORD" != "$PGP_PASSWORD2" ]; then
  echo "PGP passphrase did not matched."
  exit
fi

mkdir -p $CLIENT_HOME/.ssh

echo -e "${RED}SSH: ${SET}"
echo -e "${CYAN}Generating...${SET}"
ssh-keygen -t rsa -b 4096 -o -a 100 -C "$CLIENT_EMAIL" -q -N "$SSH_PASSWORD" -f $CLIENT_HOME/.ssh/id_rsa
ssh-keygen -t ed25519 -a 100 -C "$CLIENT_EMAIL" -q -N "$SSH_PASSWORD" -f $CLIENT_HOME/.ssh/id_ed25519
SSH_RSA_PUB=`cat $CLIENT_HOME/.ssh/id_rsa.pub`
SSH_ED25519_PUB=`cat $CLIENT_HOME/.ssh/id_ed25519.pub`
render_template $PROJECT_PATH/templates/config > $CLIENT_HOME/.ssh/config
chmod 600 $CLIENT_HOME/.ssh/config
echo -e "${GREEN}Done.${SET}"

echo -e "${RED}PGP: ${SET}"
echo -e "${CYAN}Generating...${SET}"
render_template $PROJECT_PATH/templates/gpg > $CLIENT_HOME/gnupg.conf
gpg2 --homedir $CLIENT_HOME/.gnupg/ --batch --gen-key $CLIENT_HOME/gnupg.conf
PGP_KEY_ID=`gpg2 --homedir $CLIENT_HOME/.gnupg/ --list-keys | egrep -o '[A-Z0-9]{40}'`
PGP_PUBLIC_KEY=`gpg2 --homedir $CLIENT_HOME/.gnupg/ --armor --export`
rm $CLIENT_HOME/gnupg.conf
PGP_KEY_ID=`gpg2 --homedir $CLIENT_HOME/.gnupg/ --list-keys | egrep -o '[A-Z0-9]{40}'`
PGP_PUBLIC_KEY=`gpg2 --homedir $CLIENT_HOME/.gnupg/ --armor --export`
echo -e "${GREEN}Done.${SET}"

render_template $PROJECT_PATH/templates/.gitconfig > $CLIENT_HOME/.gitconfig

Z7Z_PASS=`pwgen -n 32 -s -1`

render_template $PROJECT_PATH/templates/README.md > $CLIENT_DIR/README.md
cp $PROJECT_PATH/templates/.czrc > $CLIENT_HOME/.czrc

cd $OUT_PATH
tar -czf $FILENAME.tar $FILENAME
7z a -t7z -m0=lzma2 -mx=9 -mfb=64 -md=32m -ms=on -mhe=on -p"$Z7Z_PASS" $FILENAME.7z $FILENAME.tar
rm -rf $FILENAME.tar $FILENAME

echo -e "${CYAN}Your archive file(${YELLOW}$FILENAME.7z${CYAN}) password is ${RED}$Z7Z_PASS${SET}"
