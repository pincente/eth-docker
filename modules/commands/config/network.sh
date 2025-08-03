#!/usr/bin/env bash
# Network querying functions for ethd config command

__query_network() {
  # When sourced, this will set the variables in the calling shell
  if [ "$#" -eq 0 ]; then
    echo "TODO: Implement full __query_network function with whiptail UI" >&2
    echo "For now, using default network for testing" >&2
    NETWORK="mainnet"  # Default for testing
    __network_change=0
    return 0
  fi
  
  # When called with --test, just print to stdout for testing
  if [ "$1" = "--test" ]; then
    echo "TODO: Implement full __query_network function with whiptail UI"
    echo "For now, using default network for testing"
    echo "NETWORK=mainnet"
    echo "__network_change=0"
    return 0
  fi
}

__query_deployment() {
  # When sourced, this will set the variables in the calling shell
  if [ "$#" -eq 0 ]; then
    echo "TODO: Implement full __query_deployment function with whiptail UI" >&2
    echo "For now, using default deployment for testing" >&2
    __deployment="node"  # Default for testing
    return 0
  fi
  
  # When called with --test, just print to stdout for testing
  if [ "$1" = "--test" ]; then
    echo "TODO: Implement full __query_deployment function with whiptail UI"
    echo "For now, using default deployment for testing"
    echo "__deployment=node"
    return 0
  fi
}

__query_consensus_client() {
  # When sourced, this will set the variables in the calling shell
  if [ "$#" -eq 0 ]; then
    echo "TODO: Implement full __query_consensus_client function with whiptail UI" >&2
    echo "For now, using default consensus client for testing" >&2
    CONSENSUS_CLIENT="lighthouse.yml"  # Default for testing
    return 0
  fi
  
  # When called with --test, just print to stdout for testing
  if [ "$1" = "--test" ]; then
    echo "TODO: Implement full __query_consensus_client function with whiptail UI"
    echo "For now, using default consensus client for testing"
    echo "CONSENSUS_CLIENT=lighthouse.yml"
    return 0
  fi
}