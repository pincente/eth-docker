#!/usr/bin/env bash
# Consensus client querying functions for ethd config command

__query_consensus_client() {
  # When called with --test, just print to stdout for testing
  if [ "${1:-}" = "--test" ]; then
    echo "TODO: Implement full __query_consensus_client function"
    echo "For now, using default consensus client for testing"
    echo "CONSENSUS_CLIENT=teku.yml"
    return 0
  fi
  
  # When sourced, this will run the actual function
  echo "TODO: Implement full __query_consensus_client function" >&2
  echo "For now, using default consensus client for testing" >&2
  
  # Set default consensus client for testing
  CONSENSUS_CLIENT="teku.yml"
  return 0
}

__query_consensus_only_client() {
  # When called with --test, just print to stdout for testing
  if [ "${1:-}" = "--test" ]; then
    echo "TODO: Implement full __query_consensus_only_client function"
    echo "For now, using default consensus-only client for testing"
    echo "CONSENSUS_CLIENT=teku-cl-only.yml"
    return 0
  fi
  
  # When sourced, this will run the actual function
  echo "TODO: Implement full __query_consensus_only_client function" >&2
  echo "For now, using default consensus-only client for testing" >&2
  
  # Set default consensus-only client for testing
  CONSENSUS_CLIENT="teku-cl-only.yml"
  return 0
}