CHAIN=cicada
DATADIR="${HOME}/apps/geth/${CHAIN}"

geth --nodiscover --datadir $CHAIN --mine --miner.threads 1 --port 3311 --http.port 3312 &
geth --nodiscover --datadir $CHAIN --mine --miner.threads 1 --port 3321 --http.port 3322 &
geth --nodiscover --datadir $CHAIN --mine --miner.threads 1 --port 3331 --http.port 3332 &
geth --nodiscover --datadir $CHAIN --mine --miner.threads 1 --port 3341 --http.port 3342 &
