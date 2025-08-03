#!/usr/bin/env bash
# Execution client querying functions for ethd config command

__query_execution_client() {
  # When called with --test, just print to stdout for testing
  if [ "${1:-}" = "--test" ]; then
    echo "TODO: Implement full __query_execution_client function"
    echo "For now, using default execution client for testing"
    echo "EXECUTION_CLIENT=geth.yml"
    return 0
  fi
  
  # When sourced, this will run the actual function
  echo "TODO: Implement full __query_execution_client function" >&2
  echo "For now, using default execution client for testing" >&2
  
  # Set a default execution client for testing
  EXECUTION_CLIENT="geth.yml"
  return 0
}

__query_custom_execution_client() {
  # When called with --test, just print to stdout for testing
  if [ "${1:-}" = "--test" ]; then
    echo "TODO: Implement full __query_custom_execution_client function"
    echo "For now, skipping custom execution client for testing"
    return 0
  fi
  
  # When sourced, this will run the actual function
  echo "TODO: Implement full __query_custom_execution_client function" >&2
  echo "For now, skipping custom execution client for testing" >&2
  
  # For now, we'll just return successfully
  return 0
}