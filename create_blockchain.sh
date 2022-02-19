#!/bin/bash

geth_dir="$HOME/apps/geth/geth_bin"

# Create a private 4-node ethereum network.
n_nodes=4
chain_name="cicada"
chain_dir="${HOME}/${chain_name}"
rm -rf "${chain_dir}/${chain_name}.json"

for i in $(seq 1 $n_nodes)
  do
    node_dir="${chain_dir}/node_0$i"
    rm -rf "$node_dir"
    mkdir -p "$node_dir"
    yes "" | ${geth_dir}/geth --verbosity 1 account new --datadir "$node_dir" | grep "Public address"
done

${geth_dir}/puppeth # copy the generated json to $chain_dir

for i in $(seq 1 $n_nodes)
  do
    node_dir="${chain_dir}/node_0$i"
    rm -rf "$node_dir"
    mkdir -p "$node_dir"
    yes "" | ${geth_dir}/geth --verbosity 2 init ${chain_dir}/${chain_name}.json --datadir "$node_dir" | grep "Public address"
done
