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
    acc_number=$(yes "" | "${geth_dir}/geth" --verbosity 1 account new --datadir "$node_dir" | grep "Public address" | cut -d":" -f2 | xargs) # xargs is for trimming
    acc_number="${acc_number:2}" # remove "0x" prefix
    accounts[i]="$acc_number"
    echo "$acc_number"
done

echo $accounts

rm -rf "${HOME}/.puppeth"
rm -rf "${chain_dir}/puppeth"
mkdir -p "${chain_dir}/puppeth"
src_dir=$(pwd)
cd "${chain_dir}/puppeth" || return
"${geth_dir}/puppeth" <<EOF
cicada
2
1
1
${accounts[1]}
${accounts[2]}
${accounts[3]}
${accounts[4]}

yes
3333
2
2

EOF

cp "${chain_dir}/puppeth/${chain_name}.json" "${chain_dir}/${chain_name}.json"

echo "Initialising the blockchain..."
for i in $(seq 1 $n_nodes)
  do
    node_dir="${chain_dir}/node_0$i"
    echo "=> ${geth_dir}/geth" init "${chain_dir}/${chain_name}.json" --datadir "$node_dir"
    "${geth_dir}/geth" init "${chain_dir}/${chain_name}.json" --datadir "$node_dir"
done
echo "Initialisation complete."
