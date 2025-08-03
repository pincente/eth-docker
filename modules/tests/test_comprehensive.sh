#!/usr/bin/env bash

# Comprehensive test script for modular ethd

echo "Running comprehensive tests for modular ethd..."

# Test 1: Verify help output contains expected commands
echo "Test 1: Help output verification"
HELP_OUTPUT=$(../ethd-modular --help)
if echo "$HELP_OUTPUT" | grep -q "configures Eth Docker with your choice of Ethereum clients"; then
    echo "✅ Help output contains config command description"
else
    echo "❌ Help output missing config command description"
    exit 1
fi

if echo "$HELP_OUTPUT" | grep -q "updates all client versions and Eth Docker itself"; then
    echo "✅ Help output contains update command description"
else
    echo "❌ Help output missing update command description"
    exit 1
fi

# Test 2: Verify config command output
echo "Test 2: Config command output verification"
CONFIG_OUTPUT=$(../ethd-modular config)
if echo "$CONFIG_OUTPUT" | grep -q "Config command - modular version"; then
    echo "✅ Config command outputs expected text"
else
    echo "❌ Config command output not as expected"
    exit 1
fi

# Test 3: Verify unknown command handling
echo "Test 3: Unknown command handling"
UNKNOWN_OUTPUT=$(../ethd-modular unknown-command 2>&1)
if echo "$UNKNOWN_OUTPUT" | grep -q "Unrecognized command"; then
    echo "✅ Unknown command properly handled"
else
    echo "❌ Unknown command not properly handled"
    exit 1
fi

echo "All comprehensive tests passed!"