geth="$HOME/apps/geth/geth_bin/geth"
n_nodes=4
chain_name="cicada"
chain_dir="${HOME}/${chain_name}"

for i in $(seq 1 $n_nodes)
  do
    node_dir="${chain_dir}/node_0$i"
    echo "$geth --nodiscover --datadir $node_dir --mine --miner.threads 1 --port "33${i}1" --http.port "33${i}2" &"
    $geth --nodiscover --datadir $node_dir --mine --miner.threads 1 --port "33${i}1" --http.port "33${i}2" &
done
