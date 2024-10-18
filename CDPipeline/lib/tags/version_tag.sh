local SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source $SCRIPT_DIR/../foundation/split.sh

local INITIAL_VERSION="1.0.0"
local INITIAL_BUILD_NUMBER=1
local RC_IDENTIFIER="RC"
local META_SEPARATOR="+"
local RC_SEPARATOR="-"

make_version_tag() {
    local VERSION=$1
    local BUILD_NUMBER=$2
    local IS_RC=$3

    if [[ "$IS_RC" == "false" ]]; then
        echo "$VERSION${META_SEPARATOR}$BUILD_NUMBER"
        return
    fi

    echo "$VERSION${META_SEPARATOR}${BUILD_NUMBER}${RC_SEPARATOR}${RC_IDENTIFIER}"
}

initial_version_rc_tag() {
    echo $(make_version_tag $INITIAL_VERSION $INITIAL_BUILD_NUMBER true)
}

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

version_from_tag() {
    local TAG=$1

    if [[ -z "$TAG" ]]; then
        echo $INITIAL_VERSION
        return
    fi

    local SPLIT_TAG=($(split_tag $TAG))
    local VERSION=${SPLIT_TAG[0]}

    echo $VERSION
}

build_number_from_tag() {
    local TAG=$1

    if [[ -z "$TAG" ]]; then
        echo $INITIAL_BUILD_NUMBER
        return
    fi

    local SPLIT_TAG=($(split_tag $TAG))
    local BUILD_NUMBER=${SPLIT_TAG[1]}

    echo $BUILD_NUMBER
}

next_rc_tag_from_tag() {
    local TAG=$1

    if [[ -z "$TAG" ]]; then
        echo "$(initial_version_rc_tag)"
        return
    fi

    local CURRENT_VERSION=$(version_from_tag $TAG)
    local CURRENT_BUILD_NUMBER=$(build_number_from_tag $TAG)
    local NEXT_BUILD_NUMBER=$((CURRENT_BUILD_NUMBER + 1))

    echo $(make_version_tag $CURRENT_VERSION $NEXT_BUILD_NUMBER true)
}