source "$JABOS_LIB_DIR/version_tag/verify_version_tag.sh"

INITIAL_VERSION="1.0.0"
INITIAL_BUILD_NUMBER=1
RC_IDENTIFIER="RC"
META_SEPARATOR="+"
RC_SEPARATOR="-"

make_version_tag() {
    local VERSION="$1"
    local BUILD_NUMBER="$2"
    local IS_RC="$3"

    local version_tag="${VERSION}${META_SEPARATOR}${BUILD_NUMBER}"

    if is_not_empty "$IS_RC"; then
        version_tag="${version_tag}${RC_SEPARATOR}${RC_IDENTIFIER}"
    fi

    echo "$version_tag"
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
    local TAG="$1"

    if is_empty "$TAG"; then
        echo ""
        return
    fi

    local TAG_SPLIT=($(split "$TAG" "$META_SEPARATOR"))
    set -- "${TAG_SPLIT[@]}"
    local VERSION="$1"
    local META="$2"

    local META_SPLIT=($(split "$META" "$RC_SEPARATOR"))
    set -- "${META_SPLIT[@]}"
    local BUILD_NUMBER="$1"
    local RC="$2"

    echo "$(join_args "$VERSION" "$BUILD_NUMBER" "$RC")"
}

version_from_tag() {
    local TAG="$1"

    if is_empty "$TAG"; then
        echo "$INITIAL_VERSION"
        return
    fi

    local SPLIT_TAG=($(split "$TAG" "$META_SEPARATOR"))
    set -- "${SPLIT_TAG[@]}"
    local VERSION="$1"

    echo "$VERSION"
}

build_number_from_tag() {
    local TAG="$1"

    if is_empty "$TAG"; then
        echo "$INITIAL_BUILD_NUMBER"
        return
    fi

    local SPLIT_TAG=($(split_tag "$TAG"))
    set -- "${SPLIT_TAG[@]}"
    local BUILD_NUMBER="$2"

    echo "$BUILD_NUMBER"
}

sort_tags() {
    local TAG_LIST="$1"
    echo "$(sort -V <<< "$TAG_LIST")"
}

latest_rc_tag_from_tag_list() {
    local TAG_LIST="$1"

    local SORTED_TAGS="$(sort_tags "$TAG_LIST")"
    local LATEST_TAG="$(echo "$SORTED_TAGS" | tail -n 1)"

    echo "$LATEST_TAG"
}

next_rc_tag_from_tag() {
    local TAG="$1"

# TODO: Filter list instead of returning inital tag here
    if is_empty "$TAG" || ! is_rc_version_tag "$TAG"; then
        echo "$(initial_version_rc_tag)"
        return
    fi

    local CURRENT_VERSION="$(version_from_tag $TAG)"
    local CURRENT_BUILD_NUMBER="$(build_number_from_tag $TAG)"
    local NEXT_BUILD_NUMBER="$((CURRENT_BUILD_NUMBER + 1))"

    echo "$(make_version_tag $CURRENT_VERSION $NEXT_BUILD_NUMBER true)"
}