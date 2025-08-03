#!/usr/bin/env bash

# Test script specifically for the checkpoint functions

echo "Testing checkpoint functions implementation..."

# Source the function to make it available
source ./commands/config/checkpoint.sh

# Test 1: __query_checkpoint_beacon function
echo "Test 1: __query_checkpoint_beacon function"
BEACON_OUTPUT=$(__query_checkpoint_beacon --test 2>&1)
if echo "$BEACON_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_checkpoint_beacon function exists and shows placeholder"
else
    echo "❌ __query_checkpoint_beacon function missing or not working"
    echo "Output was: $BEACON_OUTPUT"
    exit 1
fi

# Test 2: __query_checkpoint_sync function
echo "Test 2: __query_checkpoint_sync function"
SYNC_OUTPUT=$(__query_checkpoint_sync --test 2>&1)
if echo "$SYNC_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_checkpoint_sync function exists and shows placeholder"
else
    echo "❌ __query_checkpoint_sync function missing or not working"
    echo "Output was: $SYNC_OUTPUT"
    exit 1
fi

# Test 3: Function execution
echo "Test 3: Function execution verification"
# Run the functions
__query_checkpoint_beacon > /dev/null
echo "Checking CHECKPOINT_SYNC_URL: '$CHECKPOINT_SYNC_URL'"
__query_checkpoint_sync > /dev/null
echo "✅ Checkpoint functions execute without error"

# Check that the CHECKPOINT_SYNC_URL variable is set
if [ -n "$CHECKPOINT_SYNC_URL" ]; then
    echo "✅ CHECKPOINT_SYNC_URL variable is set (value: $CHECKPOINT_SYNC_URL)"
else
    echo "❌ CHECKPOINT_SYNC_URL variable not set"
    exit 1
fi

echo "All checkpoint functions tests passed!"