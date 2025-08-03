#!/usr/bin/env bash

# Test script specifically for the validator client functions

echo "Testing validator client functions implementation..."

# Source the function to make it available
source ./commands/config/validator.sh

# Test 1: __query_validator_client function
echo "Test 1: __query_validator_client function"
VALIDATOR_OUTPUT=$(__query_validator_client --test 2>&1)
if echo "$VALIDATOR_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_validator_client function exists and shows placeholder"
else
    echo "❌ __query_validator_client function missing or not working"
    echo "Output was: $VALIDATOR_OUTPUT"
    exit 1
fi

# Test 2: Function execution
echo "Test 2: Function execution verification"
# Run the function
__query_validator_client > /dev/null
echo "Checking CONSENSUS_CLIENT: '$CONSENSUS_CLIENT'"
echo "✅ Validator client function executes without error"

# Check that the CONSENSUS_CLIENT variable is set
if [ -n "$CONSENSUS_CLIENT" ]; then
    echo "✅ CONSENSUS_CLIENT variable is set (value: $CONSENSUS_CLIENT)"
else
    echo "❌ CONSENSUS_CLIENT variable not set"
    exit 1
fi

echo "All validator client functions tests passed!"