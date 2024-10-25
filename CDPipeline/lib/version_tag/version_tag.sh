source "$JABOS_FOUNDATION_DIR/foundation.sh"
source "$JABOS_LIB_DIR/version_tag/version_tag_internal.sh"

# Description: Determines the next RC tag from a list of tags.
# Parameters:
#   $1 - A string containing a list of tags. List must be newline separated.
# Returns:
#   The next RC tag. If the $1 is empty, it returns the initial version RC tag.
next_rc_tag_from_tag_list() {
    local TAG_LIST="$1"

    TAG_LIST="$(filter_list "$TAG_LIST" "is_rc_version_tag")"

    if is_empty "$TAG_LIST"; then
        echo "$(initial_version_rc_tag)"
        return
    fi

    local LAST_TAG="$(latest_rc_tag_from_tag_list "$TAG_LIST")"

    echo "$(next_rc_tag_from_tag "$LAST_TAG")"
}