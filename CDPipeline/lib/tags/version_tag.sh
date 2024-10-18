local SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

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