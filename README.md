# Cardano Relay Check Script

# Overview

This script verifies whether one or more relays specified in the pool.cert file of a Cardano block producer are correctly registered in the Cardano relay topology. It compares relay addresses and ports from the pool.cert file with entries in the Cardano relay topology JSON file.

# Features

Checks relay registrations against the Cardano relay topology.
Supports multiple relay address and port formats.
Easy integration with Cardano block producer setups.

# Prerequisites

A running Cardano block producer node.
The presence of a pool.cert file in the Cardano node's NODE_HOME directory.
Installed Cardano binaries (cardano-cli, jq) in the system's PATH.
Properly configured NODE_HOME directory.
Usage

Clone the repository:
```console
git clone https://github.com/IndieStakeHub/CheckRelaysListed.git
cd CheckRelaysListed
```
Make the script executable:
```console
chmod +x check_relays.sh
```
Edit the script (if needed) with your specific configurations.

Run the script:
```console
./check_relays.sh
```

# Contributions

Contributions are welcome! Feel free to submit issues or pull requests.
