#!/bin/bash

geth_dir="$HOME/apps/geth/geth_bin"

# Create a private 4-node ethereum network.
n_nodes=4
chain_name="cicada"
chain_dir="${HOME}/${chain_name}"
rm -rf "${chain_dir}"

for i in $(seq 1 $n_nodes)
  do
    node_dir="${chain_dir}/node_0$i"
    rm -rf "$node_dir"
    mkdir -p "$node_dir"
    yes "" | "${geth_dir}/geth" --verbosity 1 account new --datadir "$node_dir" | grep "Public address"
done

rm -rf "${HOME}/.puppeth"
rm -rf "${chain_dir}/puppeth"
mkdir -p "${chain_dir}/puppeth"
cd "${chain_dir}/puppeth" || return
"${geth_dir}/puppeth"
cp "${chain_dir}/puppeth/${chain_name}.json" "${chain_dir}/${chain_name}.json"

echo "Initialising the blockchain..."
for i in $(seq 1 $n_nodes)
  do
    node_dir="${chain_dir}/node_0$i"
    rm -rf "$node_dir"
    mkdir -p "$node_dir"
    echo "=> ${geth_dir}/geth" init "${chain_dir}/${chain_name}.json" --datadir "$node_dir"
    "${geth_dir}/geth" init "${chain_dir}/${chain_name}.json" --datadir "$node_dir"
done
echo "Initialisation complete."
