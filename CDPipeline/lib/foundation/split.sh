# Splits a string into an array based on a delimiter.
# Parameters:
#   $1 - The string to be split.
#   $2 - The delimiter to use for splitting the string.
# Returns:
#   The elements of the string as an array.
split() {
    local STRING="$1"
    local DELIMITER="$2"

    IFS="$DELIMITER"
    ARRAY=()
    while IFS="$DELIMITER" read -r -d "$DELIMITER" element; do
        ARRAY+=("$element")
    done <<< "$STRING$DELIMITER"
    unset IFS

    echo "${ARRAY[@]}"
}