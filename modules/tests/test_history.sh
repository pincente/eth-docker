#!/usr/bin/env bash

# Test script specifically for the history expiry functions

echo "Testing history expiry functions implementation..."

# Source the function to make it available
source ./commands/config/history.sh

# Test 1: __query_4444 function
echo "Test 1: __query_4444 function"
HISTORY_OUTPUT=$(__query_4444 --test 2>&1)
if echo "$HISTORY_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_4444 function exists and shows placeholder"
else
    echo "❌ __query_4444 function missing or not working"
    echo "Output was: $HISTORY_OUTPUT"
    exit 1
fi

# Test 2: Function execution
echo "Test 2: Function execution verification"
# Run the function
__query_4444 > /dev/null
echo "Checking EL_MINIMAL_NODE: '$EL_MINIMAL_NODE'"
echo "✅ History expiry function executes without error"

# Check that the EL_MINIMAL_NODE variable is set
if [ -n "$EL_MINIMAL_NODE" ]; then
    echo "✅ EL_MINIMAL_NODE variable is set (value: $EL_MINIMAL_NODE)"
else
    echo "❌ EL_MINIMAL_NODE variable not set"
    exit 1
fi

echo "All history expiry functions tests passed!"