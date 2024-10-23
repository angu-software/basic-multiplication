source "$JABOS_FOUNDATION_DIR/foundation.sh"

is_rc_version_tag() {
    local tag="$1"

    set -- $(split_tag "$tag")
    local tag_version="$1"
    local tag_build="$2"
    local tag_rc="$3"
    
    if ! is_version "$tag_version" || ! is_uint "$tag_build" || [[ "$tag_rc" != "$RC_IDENTIFIER" ]]; then
        return 1
    fi
}

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

is_version() {
    local version="$1"
    local version_regex="^([0-9]+\.){2}[0-9]+$"
    
    if [[ "$version" =~ $version_regex ]]; then
        return 0
    fi

    return 1
}