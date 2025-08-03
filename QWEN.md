# ETHD Modularization Project - Qwen Code Context

## Project Goal
Refactor the monolithic ETHD bash script into a modular architecture while maintaining full backward compatibility. This project focuses purely on code organization and structure, not on implementing UIs or changing functionality.

## Key Objectives
1. **Modularize the monolithic script** - Break down the single large script into smaller, focused modules
2. **Maintain backward compatibility** - All existing functionality must work exactly as before
3. **Improve code organization** - Group related functions together in logical modules
4. **Enable better testing** - Create comprehensive tests for each module
5. **Preserve placeholder approach** - Use placeholder implementations that return default values rather than implementing full UI

## Project Structure
```
modules/
├── core/                 # Core utilities and configuration
├── commands/             # Individual command implementations
│   ├── help.sh          # Help command
│   ├── config.sh        # Config command and sub-modules
│   ├── keys.sh          # Keys command
│   └── ...              # Other commands
├── utils/               # Utility functions
│   ├── ipv6.sh          # IPv6 functions
│   ├── build.sh         # Build functions
│   └── os.sh            # OS functions
└── tests/               # Test scripts for each module
```

## Workflow
1. **Identify cohesive function groups** in the original monolithic script
2. **Create new module files** for each group in the appropriate directory
3. **Migrate functions** from the monolithic script to the new modules
4. **Update the main script** to source the new modules
5. **Create comprehensive tests** for each module with --test flag support
6. **Verify backward compatibility** by running all tests
7. **Update documentation** to reflect new modules

## Key Principles
- **No UI implementation** - This project does not implement whiptail UIs
- **Placeholder approach** - Functions should return default values for testing
- **Test-driven** - Every module must have comprehensive tests
- **Backward compatibility** - Existing functionality must work unchanged
- **Clear separation of concerns** - Each module should have a single responsibility

## Testing Approach
Each module function should support a `--test` flag that:
- Prints placeholder output to stdout for testing
- Sets appropriate default values for variables
- Returns successfully (exit code 0)
- Allows the test framework to verify the function exists and works

## Next Steps
Continue modularizing remaining commands:
- `update`, `up`/`start`, `down`/`stop`, `restart`
- `logs`, `cmd`, `terminate`
- `prune-*` commands
- `resync-*` commands
- `attach-geth`, `keyimport`

Each command follows the same pattern:
1. Create module file in `modules/commands/`
2. Implement function with `--test` flag support
3. Create test file in `modules/tests/`
4. Update Makefile and GitHub Actions workflow
5. Update documentation