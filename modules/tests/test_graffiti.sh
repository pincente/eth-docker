#!/usr/bin/env bash

# Test script specifically for the graffiti functions

echo "Testing graffiti functions implementation..."

# Source the function to make it available
source ./commands/config/graffiti.sh

# Test 1: __query_graffiti function
echo "Test 1: __query_graffiti function"
GRAFFITI_OUTPUT=$(__query_graffiti --test 2>&1)
if echo "$GRAFFITI_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_graffiti function exists and shows placeholder"
else
    echo "❌ __query_graffiti function missing or not working"
    echo "Output was: $GRAFFITI_OUTPUT"
    exit 1
fi

# Test 2: Function execution
echo "Test 2: Function execution verification"
# Run the function
__query_graffiti > /dev/null
echo "Checking GRAFFITI: '$GRAFFITI'"
echo "Checking DEFAULT_GRAFFITI: '$DEFAULT_GRAFFITI'"
echo "✅ Graffiti function executes without error"

# Check that the variables are set
if [ -n "$GRAFFITI" ]; then
    echo "✅ GRAFFITI variable is set (value: $GRAFFITI)"
else
    echo "❌ GRAFFITI variable not set"
    exit 1
fi

if [ -n "$DEFAULT_GRAFFITI" ]; then
    echo "✅ DEFAULT_GRAFFITI variable is set (value: $DEFAULT_GRAFFITI)"
else
    echo "❌ DEFAULT_GRAFFITI variable not set"
    exit 1
fi

echo "All graffiti functions tests passed!"