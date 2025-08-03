# Modular ethd

This is a modularized version of the ethd script, designed to be more maintainable and extensible.

## Structure

- `ethd-modular` - Main script that orchestrates the modules
- `modules/core/` - Core configuration and constants
- `modules/utils/` - Utility functions (Docker handling, environment variables, etc.)
- `modules/commands/` - Individual command implementations
- `modules/tests/` - Test scripts

## Modules

### Core Modules
- `config.sh` - Core configuration variables

### Utility Modules
- `docker.sh` - Docker and Docker Compose handling functions
- `env.sh` - Environment variable handling functions
- `root.sh` - Root user handling functions

### Command Modules
- `help.sh` - Help command implementation
- `config.sh` - Configuration command implementation
- `config/network.sh` - Network-related functions for the config command
- `config/legacy.sh` - Legacy checking functions for the config command
- `config/execution.sh` - Execution client functions for the config command
- `config/mev.sh` - MEV-related functions for the config command
- `config/coinbase.sh` - Coinbase/FEE_RECIPIENT functions for the config command
- `config/graffiti.sh` - Graffiti functions for the config command
- `config/checkpoint.sh` - Checkpoint sync functions for the config command
- `config/grafana.sh` - Grafana functions for the config command
- `config/remote.sh` - Remote beacon functions for the config command
- `config/history.sh` - History expiry functions for the config command
- `config/ssv.sh` - SSV client functions for the config command
- `config/lido.sh` - Lido keys generation functions for the config command
- `config/validator.sh` - Validator client functions for the config command
- `config/consensus.sh` - Consensus client functions for the config command
- `config/obol.sh` - Lido Obol functions for the config command
- `config/dkg.sh` - DKG functions for the config command
- `keys.sh` - Keys command implementation

### Utility Modules
- `utils/ipv6.sh` - IPv6 enabling functions
- `utils/build.sh` - Source build and pull functions
- `utils/os.sh` - OS version nag functions

## Testing

Run the tests locally:

```bash
# Run all tests
cd modules && make test

# Run specific test suites
cd modules && make test-basic
cd modules && make test-comprehensive
cd modules && make test-help
cd modules && make test-config
cd modules && make test-network
```

Tests are also run automatically via GitHub Actions when pushing to the `qwen-code` branch.

## Development

To add a new command:
1. Create a new file in `modules/commands/`
2. Implement the command function
3. Source the new module in `ethd-modular`
4. Add the command to the dispatch logic
5. Add tests in `modules/tests/`
6. Update the Makefile and GitHub Actions workflow