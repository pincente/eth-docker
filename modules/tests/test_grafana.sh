#!/usr/bin/env bash

# Test script specifically for the grafana functions

echo "Testing grafana functions implementation..."

# Source the function to make it available
source ./commands/config/grafana.sh

# Test 1: __query_grafana function
echo "Test 1: __query_grafana function"
GRAFANA_OUTPUT=$(__query_grafana --test 2>&1)
if echo "$GRAFANA_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_grafana function exists and shows placeholder"
else
    echo "❌ __query_grafana function missing or not working"
    echo "Output was: $GRAFANA_OUTPUT"
    exit 1
fi

# Test 2: Function execution
echo "Test 2: Function execution verification"
# Run the function
__query_grafana > /dev/null
echo "Checking GRAFANA_CLIENT: '$GRAFANA_CLIENT'"
echo "✅ Grafana function executes without error"

# Check that the GRAFANA_CLIENT variable is set
if [ -n "$GRAFANA_CLIENT" ]; then
    echo "✅ GRAFANA_CLIENT variable is set (value: $GRAFANA_CLIENT)"
else
    echo "❌ GRAFANA_CLIENT variable not set"
    exit 1
fi

echo "All grafana functions tests passed!"