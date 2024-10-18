SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source $SCRIPT_DIR/../foundation/split.sh

# Splits a tag string into its components.
# The tag string is expected to be in the format <major>.<minor>.<patch>+<build>[-RC].
# Parameters: 
#   $1 - The tag string to be split.
# Returns:
#   The components of the tag string.
split_tag() {
    local TAG=$1

    if [[ -z "$TAG" ]]; then
        echo ''
        return
    fi

    local TAG_SPLIT=($(split $TAG '+'))
    local VERSION=${TAG_SPLIT[0]}
    local META=${TAG_SPLIT[1]}
    local META_SPLIT=($(split $META '-'))
    local BUILD_NUMBER=${META_SPLIT[0]}
    local RC=${META_SPLIT[1]}

    if [[ -z "$RC" ]]; then
        echo "$VERSION $BUILD_NUMBER"
        return
    fi

    echo "$VERSION $BUILD_NUMBER $RC"
}