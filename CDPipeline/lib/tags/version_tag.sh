local SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source $SCRIPT_DIR/split_tag.sh

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

build_number_from_tag() {
    local TAG=$1

    if [[ -z "$TAG" ]]; then
        echo 1
        return
    fi

    local SPLIT_TAG=($(split_tag $TAG))
    local BUILD_NUMBER=${SPLIT_TAG[1]}

    echo $BUILD_NUMBER
}