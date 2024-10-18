# Splits a string into an array based on a delimiter.
# Parameters:
#   $1 - The string to be split.
#   $2 - The delimiter to use for splitting the string.
# Returns:
#   The elements of the string as an array.
split() {
    local STRING=$1
    local DELIMITER=$2

    IFS="$DELIMITER"
    read -r -a ARRAY <<< "$STRING"
    unset IFS

    echo ${ARRAY[@]}
}