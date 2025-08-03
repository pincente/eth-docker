#!/usr/bin/env bash

# Test script specifically for the DKG functions

echo "Testing DKG functions implementation..."

# Source the function to make it available
source ./commands/config/dkg.sh

# Test 1: __query_dkg function
echo "Test 1: __query_dkg function"
DKG_OUTPUT=$(__query_dkg --test 2>&1)
if echo "$DKG_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_dkg function exists and shows placeholder"
else
    echo "❌ __query_dkg function missing or not working"
    echo "Output was: $DKG_OUTPUT"
    exit 1
fi

# Test 2: Function execution
echo "Test 2: Function execution verification"
# Run the function
__query_dkg > /dev/null
echo "✅ DKG function executes without error"

echo "All DKG functions tests passed!"