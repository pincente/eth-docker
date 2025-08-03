#!/usr/bin/env bash
# Grafana querying functions for ethd config command

__query_grafana() {
  # When called with --test, just print to stdout for testing
  if [ "${1:-}" = "--test" ]; then
    echo "TODO: Implement full __query_grafana function with whiptail UI"
    echo "For now, using default grafana settings for testing"
    echo "GRAFANA_CLIENT=grafana.yml:grafana-shared.yml"
    return 0
  fi
  
  # When sourced, this will run the actual function
  echo "TODO: Implement full __query_grafana function with whiptail UI" >&2
  echo "For now, using default grafana settings for testing" >&2
  
  # Set default grafana client for testing
  GRAFANA_CLIENT="grafana.yml:grafana-shared.yml"
  return 0
}