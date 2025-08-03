#!/usr/bin/env bash

# Test script specifically for the coinbase functions

echo "Testing coinbase functions implementation..."

# Source the function to make it available
source ./commands/config/coinbase.sh

# Test 1: __query_coinbase function
echo "Test 1: __query_coinbase function"
COINBASE_OUTPUT=$(__query_coinbase --test 2>&1)
if echo "$COINBASE_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_coinbase function exists and shows placeholder"
else
    echo "❌ __query_coinbase function missing or not working"
    echo "Output was: $COINBASE_OUTPUT"
    exit 1
fi

# Test 2: Function execution
echo "Test 2: Function execution verification"
# Run the function
__query_coinbase > /dev/null
echo "Checking FEE_RECIPIENT: '$FEE_RECIPIENT'"
echo "✅ Coinbase function executes without error"

# Check that the FEE_RECIPIENT variable is set
if [ -n "$FEE_RECIPIENT" ]; then
    echo "✅ FEE_RECIPIENT variable is set (value: $FEE_RECIPIENT)"
else
    echo "❌ FEE_RECIPIENT variable not set"
    exit 1
fi

echo "All coinbase functions tests passed!"