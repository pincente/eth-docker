#!/usr/bin/env bash
# Config command for ethd

# Source network-related functions
source "$(dirname "${BASH_SOURCE[0]}")/config/network.sh"

# Source legacy checking functions
source "$(dirname "${BASH_SOURCE[0]}")/config/legacy.sh"

# Source execution client functions
source "$(dirname "${BASH_SOURCE[0]}")/config/execution.sh"

# Source MEV-related functions
source "$(dirname "${BASH_SOURCE[0]}")/config/mev.sh"

# Source coinbase/FEE_RECIPIENT functions
source "$(dirname "${BASH_SOURCE[0]}")/config/coinbase.sh"

# Source graffiti functions
source "$(dirname "${BASH_SOURCE[0]}")/config/graffiti.sh"

# Source checkpoint sync functions
source "$(dirname "${BASH_SOURCE[0]}")/config/checkpoint.sh"

# Source grafana functions
source "$(dirname "${BASH_SOURCE[0]}")/config/grafana.sh"

# Source remote beacon functions
source "$(dirname "${BASH_SOURCE[0]}")/config/remote.sh"

# Source history expiry functions
source "$(dirname "${BASH_SOURCE[0]}")/config/history.sh"

# Source SSV client functions
source "$(dirname "${BASH_SOURCE[0]}")/config/ssv.sh"

# Source Lido keys generation functions
source "$(dirname "${BASH_SOURCE[0]}")/config/lido.sh"

# Source validator client functions
source "$(dirname "${BASH_SOURCE[0]}")/config/validator.sh"

# Source consensus client functions
source "$(dirname "${BASH_SOURCE[0]}")/config/consensus.sh"

# Source Lido Obol functions
source "$(dirname "${BASH_SOURCE[0]}")/config/obol.sh"

# Source DKG functions
source "$(dirname "${BASH_SOURCE[0]}")/config/dkg.sh"

# Source IPv6 functions
source "$(dirname "${BASH_SOURCE[0]}")/../utils/ipv6.sh"

# Source build functions
source "$(dirname "${BASH_SOURCE[0]}")/../utils/build.sh"

# Source OS functions
source "$(dirname "${BASH_SOURCE[0]}")/../utils/os.sh"

config() {
  echo "Config command - modular version"
  
  # Create ENV file if needed
  if ! [[ -f "${__env_file}" ]]; then
    echo "Creating new .env file from default.env"
    ${__as_owner} cp default.env "${__env_file}"
    __minty_fresh=1
  else
    __minty_fresh=0
  fi

  __during_config=1

  # Call the configuration functions
  __check_legacy
  __query_network
  __query_deployment
  
  case "${__deployment}" in
    "node" | "lido_csm")
      __query_consensus_client
      ;;
    *)
      echo "Deployment type: ${__deployment}"
      ;;
  esac

  # TODO: Implement the rest of the config logic
  echo "Network selected: ${NETWORK}"
  echo "Deployment type: ${__deployment}"
  echo "Consensus client: ${CONSENSUS_CLIENT}"
  
  __during_config=0
  
  echo "Configuration completed (placeholder implementation)"
}