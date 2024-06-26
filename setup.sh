#! /bin/bash
set -e
sh -c 'echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian bookworm main" > /etc/apt/sources.list'
# used by apt-build
# sh -c 'echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/debian bookworm main" >> /etc/apt/sources.list'

apt-get update
apt install -y g++  ninja-build git sudo build-essential git cmake curl unzip tar zip wget ca-certificates  python3-pip

mkdir -p /usr/local/share/ca-certificates
cp watt/SteamTools.Certificate.cer  /usr/local/share/ca-certificates/SteamTools.Certificate.crt
sudo update-ca-certificates

python3 -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
python3 -m pip install cmake-init --break-system-packages
