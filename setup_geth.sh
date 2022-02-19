#!/bin/bash

geth_install_dir="$HOME/apps/geth"
rm -rf "$geth_geth_install_dir"
mkdir -p "$geth_install_dir"
cd "$geth_install_dir"
gzip_f=

geth_store="https://gethstore.blob.core.windows.net/builds"
if [[ $OSTYPE =~ "linux" ]]; then
  gzip_f="geth-alltools-linux-386-1.10.16-20356e57"
elif [[ $OSTYPE =~ "darwin" ]]; then
  gzip_f="geth-alltools-darwin-amd64-1.10.16-20356e57"
else
  echo "Only supported on Linux or MacOS. " && exit 1;
fi

wget "${geth_store}/${gzip_f}.tar.gz" -q --show-progress

tar xvfz "${gzip_f}.tar.gz"
rm "${gzip_f}.tar.gz"
mv $gzip_f geth_bin
