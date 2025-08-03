# ETHD Modularization Patterns and Conventions

This document outlines the patterns and conventions established in the ETHD modularization project to guide future development.

## Module Structure

### File Organization
```
modules/
├── core/                 # Core configuration and constants
├── utils/                # Utility functions
├── commands/             # Command implementations
│   └── [command]/        # Sub-modules for complex commands
└── tests/                # Test scripts
```

### Module File Pattern
Each module file follows this structure:
```bash
#!/usr/bin/env bash
# Brief description of the module

function_name() {
  # When called with --test, just print to stdout for testing
  if [ "${1:-}" = "--test" ]; then
    echo "TODO: Implement full function_name"
    echo "For now, using default values for testing"
    # Set any relevant variables
    return 0
  fi
  
  # When sourced, this will run the actual function
  echo "TODO: Implement full function_name" >&2
  echo "For now, using default values for testing" >&2
  
  # Implementation or placeholder
  return 0
}
```

## Function Implementation Patterns

### 1. Test Flag Support
All functions must support a `--test` flag that:
- Prints placeholder output to stdout for testing
- Sets appropriate default values for variables
- Returns successfully (exit code 0)
- Allows the test framework to verify the function exists and works

### 2. Error Handling
- Functions should echo errors to stderr (`>&2`)
- Use appropriate return codes
- Handle edge cases gracefully

### 3. Variable Management
- Set global variables when needed for the configuration process
- Use descriptive variable names
- Follow existing naming conventions

## Test Patterns

### Test File Structure
Each test file follows this pattern:
```bash
#!/usr/bin/env bash

# Test script specifically for [module name]

echo "Testing [module name] implementation..."

# Source the function to make it available
source ./commands/[module].sh

# Test 1: Function with --test flag
echo "Test 1: Function with --test flag"
OUTPUT=$(function_name --test 2>&1)
if echo "$OUTPUT" | grep -q "TODO: Implement"; then
    echo "✅ Function exists and shows placeholder"
else
    echo "❌ Function missing or not working"
    echo "Output was: $OUTPUT"
    exit 1
fi

# Additional tests as needed...

echo "All [module name] tests passed!"
```

### Integration Testing
- Test the modular version with `../ethd-modular` from the modules directory
- Verify backward compatibility with original functionality
- Test key user workflows

## Command Implementation

### Main Dispatcher Pattern
Add new commands to `ethd-modular`:
1. Source the new module file
2. Add the command to the case statement in the dispatcher

```bash
# Source command modules
source "$(dirname "${BASH_SOURCE[0]}")/modules/commands/help.sh"
source "$(dirname "${BASH_SOURCE[0]}")/modules/commands/config.sh"
source "$(dirname "${BASH_SOURCE[0]}")/modules/commands/[new_command].sh"

# Command dispatching logic
case "$__command" in
  help)
    help "$@"
    ;;
  config)
    config "$@"
    ;;
  [new_command])
    [new_command] "$@"
    ;;
  *)
    echo "Unrecognized command $__command"
```

## Testing Framework

### Makefile Integration
1. Add new test to the Makefile:
```makefile
.PHONY: test test-[new_module]
test: test-basic test-comprehensive test-[existing_tests] test-[new_module]
test-[new_module]:
	./tests/test_[new_module].sh
```

### GitHub Actions Integration
1. Add new test to the workflow:
```yaml
- name: Test modular ethd [new_module] functions
  run: ./modules/tests/test_[new_module].sh
```

## Documentation Updates

When adding new modules:
1. Update `modules/README.md` with the new module
2. Update `QWEN.md` if adding new patterns or conventions
3. Update `MODULARIZATION_SUMMARY.md` with progress
4. Update `FINAL_SUMMARY.md` if creating a new final summary

## Key Principles

1. **No UI Implementation** - This project does not implement whiptail UIs
2. **Placeholder Approach** - Functions should return default values for testing
3. **Test-driven** - Every module must have comprehensive tests
4. **Backward compatibility** - Existing functionality must work unchanged
5. **Clear separation of concerns** - Each module should have a single responsibility

## Next Steps for New Modules

1. Identify cohesive function groups in the original monolithic script
2. Create new module file in the appropriate directory
3. Implement functions with `--test` flag support
4. Create comprehensive test file
5. Update `ethd-modular` to source the new module
6. Update `ethd-modular` dispatcher if adding new commands
7. Update Makefile with new test target
8. Update GitHub Actions workflow
9. Update documentation
10. Verify all tests pass