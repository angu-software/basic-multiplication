local SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]:-${(%):-%x}}")")
source "$SCRIPT_DIR/is_empty.sh"
source "$SCRIPT_DIR/is_not_empty.sh"
source "$SCRIPT_DIR/split.sh"
source "$SCRIPT_DIR/join_args.sh"
