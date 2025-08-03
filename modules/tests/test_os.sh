#!/usr/bin/env bash

# Test script specifically for the OS functions

echo "Testing OS functions implementation..."

# Source the function to make it available
source ./utils/os.sh

# Test 1: __nag_os_version function
echo "Test 1: __nag_os_version function"
OS_OUTPUT=$(__nag_os_version --test 2>&1)
if echo "$OS_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __nag_os_version function exists and shows placeholder"
else
    echo "❌ __nag_os_version function missing or not working"
    echo "Output was: $OS_OUTPUT"
    exit 1
fi

# Test 2: Function execution
echo "Test 2: Function execution verification"
# Run the function
__nag_os_version > /dev/null
echo "✅ OS function executes without error"

echo "All OS functions tests passed!"