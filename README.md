# Key Points

## Boot Nodes
A node connects to the network using one of the predefined bootnodes. Through these bootnodes a node can join the network and find other nodes. Our private network will have 4 nodes, two of which are bootnodes. 

## Network ID
Ethereum networks have network IDs. We'll give our private network the network ID 3333. There's a community-run registry of Ethereum networks at https://chainid.network. Incidentally, main network's network ID is 1. 

## Consensus Algorithm
The main network uses proof-of-work consensus algorithm, but we'll go with proof-of-authority algorithm. It is much less resource-intensive than proof-of-work. Also, it avoids the 51% attack problem. 

## Genesis Block
Every blockchain starts with the first block - called the genesis block. Genesis block is created using the genesis.json file where we configure a few parameters. 


# Build and Run the Blockchain

## Directory Structure
```
  + geth
      |
      |---- cicada
      |       |
      |        ---- genesis.json
      |---- node_01
      |
      |---- node_02
      |
      |---- node_03
      |
       ---- node_04
```
## Node Creation

## Account Creation

## Start the Nodes
