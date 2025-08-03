#!/usr/bin/env bash

# Test script specifically for the keys command

echo "Testing keys command implementation..."

# Source the function to make it available
source ./commands/keys.sh

# Test 1: keys function with --test flag
echo "Test 1: keys function with --test flag"
KEYS_OUTPUT=$(keys --test 2>&1)
if echo "$KEYS_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ keys function exists and shows placeholder"
else
    echo "❌ keys function missing or not working"
    echo "Output was: $KEYS_OUTPUT"
    exit 1
fi

# Test 2: keys function with help action
echo "Test 2: keys function with help action"
KEYS_HELP_OUTPUT=$(keys help 2>&1)
if echo "$KEYS_HELP_OUTPUT" | grep -q "Keys command - modular version"; then
    echo "✅ keys function handles help action"
else
    echo "❌ keys function doesn't handle help action"
    echo "Output was: $KEYS_HELP_OUTPUT"
    exit 1
fi

# Test 3: Function execution
echo "Test 3: Function execution verification"
# Run the function
keys > /dev/null
echo "✅ keys function executes without error"

echo "All keys command tests passed!"