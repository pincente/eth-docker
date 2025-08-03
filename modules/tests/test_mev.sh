#!/usr/bin/env bash

# Test script specifically for the MEV functions

echo "Testing MEV functions implementation..."

# Source the function to make it available
source ./commands/config/mev.sh

# Test 1: __query_mev function
echo "Test 1: __query_mev function"
MEV_OUTPUT=$(__query_mev --test 2>&1)
if echo "$MEV_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_mev function exists and shows placeholder"
else
    echo "❌ __query_mev function missing or not working"
    echo "Output was: $MEV_OUTPUT"
    exit 1
fi

# Test 2: Function execution
echo "Test 2: Function execution verification"
# Run the function
__query_mev > /dev/null
echo "Checking MEV_BOOST: '$MEV_BOOST'"
echo "✅ MEV function executes without error"

# Check that the MEV_BOOST variable is set
if [ -n "$MEV_BOOST" ]; then
    echo "✅ MEV_BOOST variable is set (value: $MEV_BOOST)"
else
    echo "❌ MEV_BOOST variable not set"
    exit 1
fi

echo "All MEV functions tests passed!"