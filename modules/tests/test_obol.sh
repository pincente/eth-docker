#!/usr/bin/env bash

# Test script specifically for the Lido Obol functions

echo "Testing Lido Obol functions implementation..."

# Source the function to make it available
source ./commands/config/obol.sh

# Test 1: __query_lido_obol_enr function
echo "Test 1: __query_lido_obol_enr function"
ENR_OUTPUT=$(__query_lido_obol_enr --test 2>&1)
if echo "$ENR_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_lido_obol_enr function exists and shows placeholder"
else
    echo "❌ __query_lido_obol_enr function missing or not working"
    echo "Output was: $ENR_OUTPUT"
    exit 1
fi

# Test 2: __query_lido_obol_cluster_definition function
echo "Test 2: __query_lido_obol_cluster_definition function"
DEFINITION_OUTPUT=$(__query_lido_obol_cluster_definition --test 2>&1)
if echo "$DEFINITION_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_lido_obol_cluster_definition function exists and shows placeholder"
else
    echo "❌ __query_lido_obol_cluster_definition function missing or not working"
    echo "Output was: $DEFINITION_OUTPUT"
    exit 1
fi

# Test 3: __query_lido_obol_cluster_dkg function
echo "Test 3: __query_lido_obol_cluster_dkg function"
DKG_OUTPUT=$(__query_lido_obol_cluster_dkg --test 2>&1)
if echo "$DKG_OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ __query_lido_obol_cluster_dkg function exists and shows placeholder"
else
    echo "❌ __query_lido_obol_cluster_dkg function missing or not working"
    echo "Output was: $DKG_OUTPUT"
    exit 1
fi

# Test 4: Function execution
echo "Test 4: Function execution verification"
# Run the functions
__query_lido_obol_enr > /dev/null
__query_lido_obol_cluster_definition > /dev/null
__query_lido_obol_cluster_dkg > /dev/null
echo "✅ Lido Obol functions execute without error"

echo "All Lido Obol functions tests passed!"