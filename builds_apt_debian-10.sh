#!/bin/bash
#preparando ambiente debian-10 para o Odoo

#reparando erros gpg NO_PUBLIC_KEY
sudo apt -y install gpg
sudo apt update 2>&1 1>/dev/null | sed -ne 's/.*NO_PUBKEY //p' | while read key; do if ! [[ ${keys[*]} =~ "$key" ]]; then sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys "$key"; keys+=("$key"); fi; done

#Instalando Postgresql-12
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update
sudo apt -y upgrade
sudo apt -y install postgresql-12

#dependencias apt-build
sudo apt install -y git virtualenv xz-utils xfonts-75dpi gitg gcc build-essential python-dev python3-dev \

#v12
sudo apt install -y libpq-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev \
                     libzip-dev libssl-dev libevent-dev nodejs npm
                     
#v14
sudo apt install -y libtiff5-dev libopenjp2-7-dev zlib1g-dev libfreetype6-dev \
                    liblcms2-dev libwebp-dev libharfbuzz-dev libfribidi-dev libxcb1-dev\
                    libjpeg-dev libjpeg62-turbo-dev libffi-dev\
                    fontconfig libfreetype6 libx11-6 libxext6 libxrender1 libxmlsec1-dev\
                    python3-openssl python3-cffi gsfonts
sudo npm install -g less

wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-rc/wkhtmltox_0.12.6-0.20200605.30.rc.faa06fa.buster_amd64.deb
sudo apt install ./wkhtmltox_0.12.6-0.20200605.30.rc.faa06fa.buster_amd64.deb


wget https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore
mv Python.gitignore .gitignore




