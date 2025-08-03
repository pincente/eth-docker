#!/usr/bin/env bash
# Coinbase/FEE_RECIPIENT querying functions for ethd config command

__query_coinbase() {
  # When called with --test, just print to stdout for testing
  if [ "${1:-}" = "--test" ]; then
    echo "TODO: Implement full __query_coinbase function"
    echo "For now, using default fee recipient for testing"
    echo "FEE_RECIPIENT=0xDccf8451070a86183eE70D330C4c43b686E9CF86"
    return 0
  fi
  
  # When sourced, this will run the actual function
  echo "TODO: Implement full __query_coinbase function" >&2
  echo "For now, using default fee recipient for testing" >&2
  
  # Set a default fee recipient for testing
  FEE_RECIPIENT="0xDccf8451070a86183eE70D330C4c43b686E9CF86"
  return 0
}