#!/bin/bash

# Set the node home directory
NODE_HOME="/path/to/your/node/home"

# Check if pool.cert file exists
POOL_CERT="$NODE_HOME/pool.cert"
if [ ! -f "$POOL_CERT" ]; then
    echo "Error: $POOL_CERT not found. Make sure the pool.cert file exists."
    exit 1
fi

# Extract relay information from pool.cert
RELAY_ADDRESSES=()
RELAY_PORTS=()

while read -r line; do
    if [[ $line == *"--single-host-pool-relay"* || $line == *"--multi-host-pool-relay"* || $line == *"--pool-relay-ipv4"* ]]; then
        read -r -a tokens <<< "$line"
        for i in "${!tokens[@]}"; do
            if [[ "${tokens[i]}" == "--single-host-pool-relay" || "${tokens[i]}" == "--multi-host-pool-relay" || "${tokens[i]}" == "--pool-relay-ipv4" ]]; then
                RELAY_ADDRESSES+=("${tokens[i + 1]}")
                RELAY_PORTS+=("${tokens[i + 3]}")
            fi
        done
    fi
done < "$POOL_CERT"

# Check if topology.json file exists
TOPOLOGY_JSON="https://explorer.mainnet.cardano.org/relays/topology.json"

if ! command -v jq &> /dev/null; then
    echo "Error: jq command not found. Install jq to run this script."
    exit 1
fi

# Fetch relay information from topology.json
TOPOLOGY_RELAYS=()

if [[ $(curl -s -o /dev/null -w "%{http_code}" "$TOPOLOGY_JSON") -eq 200 ]]; then
    TOPOLOGY_RELAYS=($(curl -s "$TOPOLOGY_JSON" | jq -r '.[] | "\(.addr):\(.port)"'))
else
    echo "Error: Unable to fetch data from $TOPOLOGY_JSON. Check the URL or try again later."
    exit 1
fi

# Compare relay information
for ((i = 0; i < ${#RELAY_ADDRESSES[@]}; i++)); do
    RELAY="${RELAY_ADDRESSES[i]}:${RELAY_PORTS[i]}"
    if [[ ! " ${TOPOLOGY_RELAYS[@]} " =~ " $RELAY " ]]; then
        echo "Error: Relay $RELAY not found in $TOPOLOGY_JSON."
    else
        echo "Relay $RELAY is present in $TOPOLOGY_JSON."
    fi
done

echo "Script completed."
