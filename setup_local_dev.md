# Setup local dev

## start docker container

```bash

docker run -dt -v D:/code:/root/code  -v D:/vcpkg:/root/vcpkg -p 8080:8080 d145df98260e

docker exec -it d0f1f0c402a5 bash

```

## setup dev

```bash

sh -c 'echo "deb http://mirrors.tuna.tsinghua.edu.cn/debian bookworm main" > /etc/apt/sources.list'
# used by apt-build
# sh -c 'echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/debian bookworm main" >> /etc/apt/sources.list'

apt-get update
apt install -y g++  ninja-build git sudo build-essential git cmake curl unzip tar zip wget ca-certificates python3-pip

```

## setup cmake-init

python3 -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
python3 -m pip install cmake-init --break-system-packages

## network issues

```bash
git config --global http.sslVerify false
curl -LOk https://github.com/open-source-parsers/jsoncpp/archive/1.9.5.tar.gz


mkdir -p /usr/local/share/ca-certificates

# # In WattToolKit : Network routing -> Open enclosing folder of certificate
cp watt/SteamTools.Certificate.cer  /usr/local/share/ca-certificates/SteamTools.Certificate.crt
sudo update-ca-certificates

```

Then cp the content of hosts file and replace 127.0.0.1 with the host ip from the host machine to /etct/hosts

```hosts
# Steam++ Start
192.168.50.107 fonts.gstatic.com
192.168.50.107 gravatar.com
192.168.50.107 secure.gravatar.com
192.168.50.107 www.gravatar.com
192.168.50.107 themes.googleusercontent.com
192.168.50.107 ajax.googleapis.com
192.168.50.107 fonts.googleapis.com
192.168.50.107 maxcdn.bootstrapcdn.com
192.168.50.107 api.github.com
192.168.50.107 gist.github.com
192.168.50.107 raw.github.com
192.168.50.107 githubusercontent.com
192.168.50.107 raw.githubusercontent.com
192.168.50.107 camo.githubusercontent.com
192.168.50.107 cloud.githubusercontent.com
192.168.50.107 avatars.githubusercontent.com
192.168.50.107 avatars0.githubusercontent.com
192.168.50.107 avatars1.githubusercontent.com
192.168.50.107 avatars2.githubusercontent.com
192.168.50.107 avatars3.githubusercontent.com
192.168.50.107 user-images.githubusercontent.com
192.168.50.107 objects.githubusercontent.com
192.168.50.107 private-user-images.githubusercontent.com
192.168.50.107 github.com
192.168.50.107 pages.github.com
192.168.50.107 githubapp.com
192.168.50.107 github.io
192.168.50.107 www.github.io
# Steam++ End
```

## start

docker run --dt -v ./hosts/hosts:/etc/hosts registry.cn-shanghai.aliyuncs.com/liangtie/cpp-dev /bin/zsh
