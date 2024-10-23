source "$JABOS_FOUNDATION_DIR/foundation.sh"

# https://stackoverflow.com/a/61835747 
is_uint() {
    case "$1" in 
        *[0-9]*)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

is_not_uint() { 
    $(is_uint "$1")
    if [[ $? -eq 0 ]]; then
        return 1
    fi
}

is_version() {
    local version="$1"
    local version_regex="^([0-9]+\.){2}[0-9]+$"
    
    if [[ "$version" =~ $version_regex ]]; then
        return 0
    fi

    return 1
}

is_not_version() {
    $(is_version "$1")
    if [[ $? -eq 0 ]]; then
        return 1
    fi
}

verify_rc_version_tag() {
    local tag="$1"

    if ! is_rc_version_tag "$tag"; then
        echo "Tag $tag is not a valid RC version tag.
Tag must be in the format: <version>${META_SEPARATOR}<build>${RC_SEPARATOR}${RC_IDENTIFIER}
Example: 1.0.0+1-RC" >&2
        return 1
    fi
}

is_rc_version_tag() {
    local tag="$1"

    set -- $(split_tag "$tag")
    local tag_version="$1"
    local tag_build="$2"
    local tag_rc="$3"
    
    if is_not_version "$tag_version" || is_not_uint "$tag_build" || [[ "$tag_rc" != "$RC_IDENTIFIER" ]]; then
        return 1
    fi
}