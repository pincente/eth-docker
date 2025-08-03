#!/usr/bin/env bash
# Graffiti querying functions for ethd config command

__query_graffiti() {
  # When called with --test, just print to stdout for testing
  if [ "${1:-}" = "--test" ]; then
    echo "TODO: Implement full __query_graffiti function with whiptail UI"
    echo "For now, using default graffiti for testing"
    echo "GRAFFITI=EthDocker"
    echo "DEFAULT_GRAFFITI=false"
    return 0
  fi
  
  # When sourced, this will run the actual function
  echo "TODO: Implement full __query_graffiti function with whiptail UI" >&2
  echo "For now, using default graffiti for testing" >&2
  
  # Set default graffiti for testing
  GRAFFITI="EthDocker"
  DEFAULT_GRAFFITI="false"
  return 0
}