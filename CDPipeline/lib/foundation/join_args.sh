local SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]:-${(%):-%x}}")")
source "$SCRIPT_DIR/is_empty.sh"
source "$SCRIPT_DIR/is_not_empty.sh"

join_args() {
  local delimiter=" "  # Get the last parameter (delimiter)
  local result=""

  for param in "$@"; do
    if is_not_empty "$param"; then
      if is_empty "$result"; then
        result="$param"
      else
        result="${result}${delimiter}${param}"
      fi
    fi
  done

  echo "$result"
}