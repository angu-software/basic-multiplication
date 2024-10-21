join_args() {
  local delimiter=" "  # Get the last parameter (delimiter)
  local result=""

  for param in "$@"; do  # Loop through all parameters except the last
    if [[ -n "$param" ]]; then  # Check if the parameter is not empty
      if [[ -z "$result" ]]; then
        result="$param"  # First non-empty parameter
      else
        result="$result$delimiter$param"  # Append with delimiter
      fi
    fi
  done

  echo "$result"
}