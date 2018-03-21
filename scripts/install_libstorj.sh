#!/bin/bash

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
libstorj_dir="$root_dir/libstorj"

if [ $# -gt 0 ]; then
  commit_ish=$1
fi

git clone https://github.com/storj/libstorj $libstorj_dir
if [ ! -z $commit_ish ]; then
  git checkout $commit_ish
fi
cd $libstorj_dir && \
./autogen.sh && \
./configure && \
make && \
if [ $(whoami) == "root" ]; then
    make install
    ldconfig
else
    sudo make install
    sudo ldconfig
fi

