#!/usr/bin/env bash

# Test script specifically for the network functions

echo "Testing network functions implementation..."

# Source the network module directly to test its functions
source ./commands/config/network.sh

# Test 1: __query_network function
echo "Test 1: __query_network function"
NETWORK_OUTPUT=$(__query_network --test 2>&1)
if echo "$NETWORK_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_network function exists and shows placeholder"
else
    echo "❌ __query_network function missing or not working"
    exit 1
fi

# Test 2: __query_deployment function
echo "Test 2: __query_deployment function"
DEPLOYMENT_OUTPUT=$(__query_deployment --test 2>&1)
if echo "$DEPLOYMENT_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_deployment function exists and shows placeholder"
else
    echo "❌ __query_deployment function missing or not working"
    exit 1
fi

# Test 3: __query_consensus_client function
echo "Test 3: __query_consensus_client function"
CONSENSUS_OUTPUT=$(__query_consensus_client --test 2>&1)
if echo "$CONSENSUS_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_consensus_client function exists and shows placeholder"
else
    echo "❌ __query_consensus_client function missing or not working"
    exit 1
fi

# Test 4: Verify functions can be called
echo "Test 4: Function execution verification"
# Source the functions to test variable setting
source ./commands/config/network.sh

# Run the functions to set the variables
__query_network > /dev/null
echo "Checking NETWORK: '$NETWORK'"
__query_deployment > /dev/null
echo "Checking __deployment: '$__deployment'"
__query_consensus_client > /dev/null
echo "Checking CONSENSUS_CLIENT: '$CONSENSUS_CLIENT'"

# Check that the variables are set (any non-empty value is fine for now)
if [ -n "$NETWORK" ]; then
    echo "✅ NETWORK variable is set (value: $NETWORK)"
else
    echo "❌ NETWORK variable not set"
    exit 1
fi

if [ -n "$__deployment" ]; then
    echo "✅ __deployment variable is set (value: $__deployment)"
else
    echo "❌ __deployment variable not set"
    echo "Value is: '$__deployment'"
    exit 1
fi

if [ -n "$CONSENSUS_CLIENT" ]; then
    echo "✅ CONSENSUS_CLIENT variable is set (value: $CONSENSUS_CLIENT)"
else
    echo "❌ CONSENSUS_CLIENT variable not set"
    exit 1
fi

echo "All network functions tests passed!"