#!/usr/bin/env bash
# OS version nag functions for ethd

__nag_os_version() {
  # When called with --test, just print to stdout for testing
  if [ "${1:-}" = "--test" ]; then
    echo "TODO: Implement full __nag_os_version function"
    echo "For now, skipping OS version nag for testing"
    return 0
  fi
  
  # When sourced, this will run the actual function
  echo "TODO: Implement full __nag_os_version function" >&2
  echo "For now, skipping OS version nag for testing" >&2
  
  # For now, we'll just return successfully
  return 0
}