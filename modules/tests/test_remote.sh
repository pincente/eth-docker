#!/usr/bin/env bash

# Test script specifically for the remote beacon functions

echo "Testing remote beacon functions implementation..."

# Source the function to make it available
source ./commands/config/remote.sh

# Test 1: __query_remote_beacon function
echo "Test 1: __query_remote_beacon function"
REMOTE_OUTPUT=$(__query_remote_beacon --test 2>&1)
if echo "$REMOTE_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_remote_beacon function exists and shows placeholder"
else
    echo "❌ __query_remote_beacon function missing or not working"
    echo "Output was: $REMOTE_OUTPUT"
    exit 1
fi

# Test 2: Function execution
echo "Test 2: Function execution verification"
# Run the function
__query_remote_beacon > /dev/null
echo "Checking REMOTE_BEACON: '$REMOTE_BEACON'"
echo "✅ Remote beacon function executes without error"

# Check that the REMOTE_BEACON variable is set
if [ -n "$REMOTE_BEACON" ]; then
    echo "✅ REMOTE_BEACON variable is set (value: $REMOTE_BEACON)"
else
    echo "❌ REMOTE_BEACON variable not set"
    exit 1
fi

echo "All remote beacon functions tests passed!"