#!/usr/bin/env bash
# Lido Obol querying functions for ethd config command

__query_lido_obol_enr() {
  # When called with --test, just print to stdout for testing
  if [ "${1:-}" = "--test" ]; then
    echo "TODO: Implement full __query_lido_obol_enr function"
    echo "For now, skipping Lido Obol ENR for testing"
    return 0
  fi
  
  # When sourced, this will run the actual function
  echo "TODO: Implement full __query_lido_obol_enr function" >&2
  echo "For now, skipping Lido Obol ENR for testing" >&2
  
  # For now, we'll just return successfully
  return 0
}

__query_lido_obol_cluster_definition() {
  # When called with --test, just print to stdout for testing
  if [ "${1:-}" = "--test" ]; then
    echo "TODO: Implement full __query_lido_obol_cluster_definition function"
    echo "For now, skipping Lido Obol cluster definition for testing"
    return 0
  fi
  
  # When sourced, this will run the actual function
  echo "TODO: Implement full __query_lido_obol_cluster_definition function" >&2
  echo "For now, skipping Lido Obol cluster definition for testing" >&2
  
  # For now, we'll just return successfully
  return 0
}

__query_lido_obol_cluster_dkg() {
  # When called with --test, just print to stdout for testing
  if [ "${1:-}" = "--test" ]; then
    echo "TODO: Implement full __query_lido_obol_cluster_dkg function"
    echo "For now, skipping Lido Obol cluster DKG for testing"
    return 0
  fi
  
  # When sourced, this will run the actual function
  echo "TODO: Implement full __query_lido_obol_cluster_dkg function" >&2
  echo "For now, skipping Lido Obol cluster DKG for testing" >&2
  
  # For now, we'll just return successfully
  return 0
}