#!/usr/bin/env bash
# Environment variable handling functions for ethd

__get_value_from_env() {
  # Call with variable name to read, env file name, and global variable to assign the value to
  # Also sets global __found
  local __var_name="$1"
  local __env_file="$2"
  local __output_var="$3"
  local __output
  local __parsed_value

  if [[ "${__output_var}" = "__parsed_value" || "${__output_var}" = "__output_var" \
      || "${__output_var}" = "__output" || "${__output_var}" = "__env_file" \
      || "${__output_var}" = "__var_name" ]]; then
    echo "__get_value_from_env was called with a conflicting output variable: $__output_var"
    echo "This is a bug."
    exit 70
  fi

  __output=$(awk -v var="$__var_name" '
      BEGIN { __found = 0; __value = "" }

      # Skip empty lines and comments
      /^#|^\s*$/ {
          next
      }

      # Match single-line unquoted value
      $0 ~ "^[ \\t]*"var"=[^\\\"].*$" {
          gsub("^[ \\t]*"var"=", "")
          gsub(/^[ \\t]*|[ \\t]*$/, "", $0)
          __value = $0
          __found = 1
          exit
      }

      # Match empty unquoted value
      $0 ~ "^[ \\t]*"var"=$" {
          __value = ""
          __found = 1
          exit
      }

      # Match a quoted single-line value
      $0 ~ "^[ \\t]*"var"=\\"[^\\\"]*\\"[ \\t]*$" {
          gsub("^[ \\t]*"var"=\\"", "")
          gsub(/\\"[ \\t]*$/, "", $0)
          __value = "\\"" $0 "\\""
          __found = 1
          exit
      }

      # Match the start of a multi-line value (with opening quote)
      $0 ~ "^[ \\t]*"var"=\\"[^\\\"]*$" {
          gsub("^[ \\t]*"var"=\\"", "")
          __value = "\\"" $0 "\n"
          __found = 1
          next
      }

      # Continue collecting lines for a multi-line value
      __found && !/\\"[ \\t]*$/ {
          __value = __value $0 "\n"
          next
      }

      # End of a multi-line value (with closing quote)
      __found && /\\"[ \\t]*$/ {
          gsub(/[ \\t]*\\"[ \\t]*$/, "")
          __value = __value $0 "\\""
          __found = 1
          exit
      }

      END {
          # Print here-doc style so we can parse with awk
          # Print the value as is, including quotes for multi-line
          print "__value<<EOF"
          print __value
          print "EOF"
          print "__found=" __found
      }
  ' "$__env_file")

  # Parse __value using here-doc style
  __parsed_value=$(awk '/^__value<<EOF$/ {getline; while ($0 != "EOF") { print; getline } }' <<< "$__output")
  # Parse __found directly into a global variable
  __found=$(awk -F= '/^__found=/ {print $2}' <<< "$__output")

  # assign value to caller's variable
  printf -v "$__output_var" '%s' "$__parsed_value"
}

__update_value_in_env() {
  # Call as __update_value_in_env "${__var}" "${__value}" "${__env_file}"
  local __var_name="$1"
  local __new_value="$2"
  local __env_file="$3"

  # Escape backslashes for safety
  local __escaped_value
  __escaped_value=$(printf '%s' "${__new_value}" | sed 's/\\/\\\\/g')

  # Check if the variable already exists in the .env file
  if grep -q "^[ \\t]*${__var_name}=" "${__env_file}"; then
      # Variable exists, update it
      awk -v var="${__var_name}" -v new_value="${__escaped_value}" '
          BEGIN { in_block = 0; multi_line = 0 }

          # Match the line that starts with the variable name
          $0 ~ "^[ \\t]*" var "=" {
              # If the value starts with a quote, it may be a multi-line
              if ($0 ~ "^[ \\t]*" var "=\\"") {
                  # Start of multi-line value
                  multi_line = 1
                  # Print the variable name with the new value, replacing & safely
                  gsub(/&/, "\\\\&", new_value)
                  print var "=" new_value
              } else {
                  # Single-line value
                  gsub(/&/, "\\\\&", new_value)
                  print var "=" new_value
              }
              # Set the flag to indicate we are processing the target variable block
              in_block = 1
              next
          }

          # If we encounter a new variable definition, stop skipping lines
          /^[A-Z_][A-Z0-9_]*=/ && in_block {
              in_block = 0
              multi_line = 0
          }

          # Continue to skip lines in a multi-line block if multi_line is true
          multi_line && !/\\"[ \\t]*$/ {
              next
          }

          # If we reach the end of a multi-line value, reset flags
          multi_line && /\\"[ \\t]*$/ {
              in_block = 0
              multi_line = 0
              next
          }

          # Print all lines if not in the target variable block
          { print }
      ' "${__env_file}" | ${__as_owner} tee "${__env_file}.tmp" >/dev/null
      ${__as_owner} mv "${__env_file}.tmp" "${__env_file}"
  else
      # Variable does not exist, append it
      printf "%s=%s\n" "${__var_name}" "${__escaped_value}" | ${__as_owner} tee -a "${__env_file}" >/dev/null
  fi
}