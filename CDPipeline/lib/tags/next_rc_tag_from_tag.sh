SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source $SCRIPT_DIR/build_number_from_tag.sh

next_rc_tag_from_tag() {
    local TAG=$1

    if [[ -z "$TAG" ]]; then
        echo 1.0.0+1-RC
        return
    fi

    CURRENT_BUILD_NUMBER=$(build_number_from_tag $TAG)
    NEXT_BUILD_NUMBER=$((CURRENT_BUILD_NUMBER + 1))

    echo "1.0.0+$NEXT_BUILD_NUMBER-RC"
}