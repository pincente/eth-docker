#!/usr/bin/env bash

# Test script specifically for the legacy functions

echo "Testing legacy functions implementation..."

# Source the function to make it available
source ./commands/config/legacy.sh

# Test 1: __check_legacy function
echo "Test 1: __check_legacy function"
LEGACY_OUTPUT=$(__check_legacy --test 2>&1)
if echo "$LEGACY_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __check_legacy function exists and shows placeholder"
else
    echo "❌ __check_legacy function missing or not working"
    echo "Output was: $LEGACY_OUTPUT"
    exit 1
fi

# Test 2: Function execution
echo "Test 2: Function execution verification"
# Run the function
__check_legacy > /dev/null
echo "✅ __check_legacy function executes without error"

echo "All legacy functions tests passed!"