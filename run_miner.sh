#!/bin/bash
# run_miner.sh
# This script activates the virtual environment and runs the bittensor miner on the test network.

echo "Activating Bittensor virtual environment..."
# Update this path if your virtual environment is located elsewhere
if [ -f ~/bittensor-env/bin/activate ]; then
    source ~/bittensor-env/bin/activate
elif [ -f ~/bittensor-env/Scripts/activate ]; then
    source ~/bittensor-env/Scripts/activate
else
    echo "Warning: Virtual environment not found at ~/bittensor-env. Proceeding with global environment..."
fi

echo "Navigating to the bittensor-subnet-template directory..."
# This ensures we run the script from the directory where the script is located
cd "$(dirname "$0")"

echo "Starting the miner on testnet (NetUID 1)..."
# You can pass your wallet and hotkey names as arguments:
# bash run_miner.sh <wallet_name> <hotkey_name>
WALLET_NAME=${1:-default_wallet}
HOTKEY_NAME=${2:-default_hotkey}

python neurons/miner.py --netuid 1 --wallet.name "$WALLET_NAME" --wallet.hotkey "$HOTKEY_NAME" --subtensor.network test --logging.debug
