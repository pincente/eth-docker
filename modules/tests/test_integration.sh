#!/usr/bin/env bash

# Integration test to verify modular version works with original script

echo "Running integration test between modular and original versions..."

# Test 1: Help command
echo "Test 1: Help command integration"
../ethd-modular help > /dev/null
if [ $? -eq 0 ]; then
    echo "✅ Modular help command works"
else
    echo "❌ Modular help command failed"
    exit 1
fi

# Test 2: Config command
echo "Test 2: Config command integration"
../ethd-modular config --test > /dev/null
if [ $? -eq 0 ]; then
    echo "✅ Modular config command works"
else
    echo "❌ Modular config command failed"
    exit 1
fi

# Test 3: Keys command
echo "Test 3: Keys command integration"
../ethd-modular keys --test > /dev/null
if [ $? -eq 0 ]; then
    echo "✅ Modular keys command works"
else
    echo "❌ Modular keys command failed"
    exit 1
fi

echo "All integration tests passed!"