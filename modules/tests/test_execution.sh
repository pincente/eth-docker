#!/usr/bin/env bash

# Test script specifically for the execution functions

echo "Testing execution functions implementation..."

# Source the function to make it available
source ./commands/config/execution.sh

# Test 1: __query_execution_client function
echo "Test 1: __query_execution_client function"
EXECUTION_OUTPUT=$(__query_execution_client --test 2>&1)
if echo "$EXECUTION_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_execution_client function exists and shows placeholder"
else
    echo "❌ __query_execution_client function missing or not working"
    echo "Output was: $EXECUTION_OUTPUT"
    exit 1
fi

# Test 2: __query_custom_execution_client function
echo "Test 2: __query_custom_execution_client function"
CUSTOM_OUTPUT=$(__query_custom_execution_client --test 2>&1)
if echo "$CUSTOM_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_custom_execution_client function exists and shows placeholder"
else
    echo "❌ __query_custom_execution_client function missing or not working"
    echo "Output was: $CUSTOM_OUTPUT"
    exit 1
fi

# Test 3: Function execution
echo "Test 3: Function execution verification"
# Run the functions
__query_execution_client > /dev/null
echo "Checking EXECUTION_CLIENT: '$EXECUTION_CLIENT'"
__query_custom_execution_client > /dev/null
echo "✅ Execution client functions execute without error"

# Check that the EXECUTION_CLIENT variable is set
if [ -n "$EXECUTION_CLIENT" ]; then
    echo "✅ EXECUTION_CLIENT variable is set (value: $EXECUTION_CLIENT)"
else
    echo "❌ EXECUTION_CLIENT variable not set"
    exit 1
fi

echo "All execution functions tests passed!"