#!/usr/bin/env bash

# Simple test for network functions

# Source the network module
source ./commands/config/network.sh

# Call the functions
echo "test" | __query_network
echo "test" | __query_deployment
echo "test" | __query_consensus_client

# Print the variables
echo "NETWORK=$NETWORK"
echo "__deployment=$__deployment"
echo "CONSENSUS_CLIENT=$CONSENSUS_CLIENT"