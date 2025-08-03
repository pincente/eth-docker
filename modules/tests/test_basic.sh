#!/usr/bin/env bash

# Test script for modular ethd

echo "Testing modular ethd..."

# Test 1: Help command
echo "Test 1: Help command"
../ethd-modular --help > /dev/null
if [ $? -eq 0 ]; then
    echo "✅ Help command works"
else
    echo "❌ Help command failed"
    exit 1
fi

# Test 2: Basic execution
echo "Test 2: Basic execution"
../ethd-modular > /dev/null
if [ $? -eq 0 ]; then
    echo "✅ Basic execution works"
else
    echo "❌ Basic execution failed"
    exit 1
fi

# Test 3: Config command
echo "Test 3: Config command"
../ethd-modular config > /dev/null
if [ $? -eq 0 ]; then
    echo "✅ Config command works"
else
    echo "❌ Config command failed"
    exit 1
fi

echo "All tests passed!"