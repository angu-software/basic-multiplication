SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source $SCRIPT_DIR/version_tag.sh

next_rc_tag_from_tag() {
    local TAG=$1

    if [[ -z "$TAG" ]]; then
        echo "$(initial_version_rc_tag)"
        return
    fi

    local CURRENT_BUILD_NUMBER=$(build_number_from_tag $TAG)
    local NEXT_BUILD_NUMBER=$((CURRENT_BUILD_NUMBER + 1))

    echo $(make_version_tag "1.0.0" $NEXT_BUILD_NUMBER true)
}