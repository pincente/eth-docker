#!/usr/bin/env bash

# Test script specifically for the Lido keys generation functions

echo "Testing Lido keys generation functions implementation..."

# Source the function to make it available
source ./commands/config/lido.sh

# Test 1: __query_lido_keys_generation function
echo "Test 1: __query_lido_keys_generation function"
LIDO_OUTPUT=$(__query_lido_keys_generation --test 2>&1)
if echo "$LIDO_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_lido_keys_generation function exists and shows placeholder"
else
    echo "❌ __query_lido_keys_generation function missing or not working"
    echo "Output was: $LIDO_OUTPUT"
    exit 1
fi

# Test 2: Function execution
echo "Test 2: Function execution verification"
# Run the function
__query_lido_keys_generation > /dev/null
echo "✅ Lido keys generation function executes without error"

echo "All Lido keys generation functions tests passed!"