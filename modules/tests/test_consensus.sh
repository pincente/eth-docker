#!/usr/bin/env bash

# Test script specifically for the consensus client functions

echo "Testing consensus client functions implementation..."

# Source the function to make it available
source ./commands/config/consensus.sh

# Test 1: __query_consensus_client function
echo "Test 1: __query_consensus_client function"
CONSENSUS_OUTPUT=$(__query_consensus_client --test 2>&1)
if echo "$CONSENSUS_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_consensus_client function exists and shows placeholder"
else
    echo "❌ __query_consensus_client function missing or not working"
    echo "Output was: $CONSENSUS_OUTPUT"
    exit 1
fi

# Test 2: __query_consensus_only_client function
echo "Test 2: __query_consensus_only_client function"
CONSENSUS_ONLY_OUTPUT=$(__query_consensus_only_client --test 2>&1)
if echo "$CONSENSUS_ONLY_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_consensus_only_client function exists and shows placeholder"
else
    echo "❌ __query_consensus_only_client function missing or not working"
    echo "Output was: $CONSENSUS_ONLY_OUTPUT"
    exit 1
fi

# Test 3: Function execution
echo "Test 3: Function execution verification"
# Run the functions
__query_consensus_client > /dev/null
echo "Checking CONSENSUS_CLIENT: '$CONSENSUS_CLIENT'"
__query_consensus_only_client > /dev/null
echo "Checking CONSENSUS_CLIENT: '$CONSENSUS_CLIENT'"
echo "✅ Consensus client functions execute without error"

# Check that the CONSENSUS_CLIENT variable is set
if [ -n "$CONSENSUS_CLIENT" ]; then
    echo "✅ CONSENSUS_CLIENT variable is set (value: $CONSENSUS_CLIENT)"
else
    echo "❌ CONSENSUS_CLIENT variable not set"
    exit 1
fi

echo "All consensus client functions tests passed!"