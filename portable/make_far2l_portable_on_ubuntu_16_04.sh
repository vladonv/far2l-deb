#!/bin/bash
mkdir ~
cd ~
rm -rf far2l
mkdir far2l
cd far2l
apt-get update
apt-get install -y libspdlog-dev patchelf wget gawk m4 libx11-dev libxi-dev libxerces-c-dev libuchardet-dev libssh-dev libssl-dev libnfs-dev libneon27-dev libarchive-dev libpcre3-dev cmake g++ git
git clone https://github.com/elfmz/far2l
cd far2l
wget https://raw.githubusercontent.com/unxed/far2l-deb/master/portable/tty_tweaks.patch
git apply tty_tweaks.patch
mkdir build
cd build
cmake -DUSEWX=no -DLEGACY=no -DCMAKE_BUILD_TYPE=Release ..
make -j$(nproc --all)
cd install
wget https://github.com/unxed/far2l-deb/raw/master/portable/autonomizer.sh
chmod +x autonomizer.sh
./autonomizer.sh
rm lib/libc.so.6
rm lib/libdl.so.2
rm lib/libgcc_s.so.1
rm lib/libm.so.6
rm lib/libpthread.so.0
rm lib/libstdc++.so.6
rm lib/libresolv.so.2
rm lib/librt.so.1
cd ..
mv install far2l_portable
git clone https://github.com/megastep/makeself.git
makeself/makeself.sh far2l_portable far2l_portable.run far2l ./far2l
