SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source $SCRIPT_DIR/split_tag.sh

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