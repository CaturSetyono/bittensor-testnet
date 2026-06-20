#!/bin/bash
# run_miner.sh
# This script activates the virtual environment and runs the bittensor miner on the test network.

echo "Activating Bittensor virtual environment..."
# Update this path if your virtual environment is located elsewhere
source ~/bittensor-env/bin/activate

echo "Navigating to the bittensor-subnet-template directory..."
# This ensures we run the script from the directory where the script is located
cd "$(dirname "$0")"

echo "Starting the miner on testnet (NetUID 1)..."
# Replace <your_wallet_name> and <your_hotkey_name> with your actual wallet details
python neurons/miner.py --netuid 1 --wallet.name <your_wallet_name> --wallet.hotkey <your_hotkey_name> --subtensor.network test --logging.debug
