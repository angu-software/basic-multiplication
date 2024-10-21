source "$JABOS_FOUNDATION_DIR/foundation.sh"

git_command() {
    git $@
}

git_sha() {
    local is_short="$1"

    if is_not_empty "$is_short"; then
        git_command rev-parse --short HEAD
        return
    fi

    git_command rev-parse HEAD
}

fetch_tags() {
    git_command fetch --tags
}

get_rc_version_tags() {
    git_command tag -l --sort=-v:refname
}

set_rc_version_tag() {
    # TODO: Consider checking for tag format
    set_tag "$@"
}

set_tag() {
    local tag="$1"
    local sha="$2"

    local args=$(join_args "$tag" "$sha")

    git_command tag "$args"
}

push_tag() {
    local tag="$1"
    git_command push origin "$tag"
}