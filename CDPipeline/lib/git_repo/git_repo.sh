local SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]:-${(%):-%x}}")")
source "$SCRIPT_DIR/../foundation/foundation.sh"

git_command() {
    git $@
}

git_sha() {
    local IS_SHORT="$1"

    if is_not_empty "$IS_SHORT"; then
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

# TODO: Consider checking for tag format
set_rc_version_tag() {
    local TAG="$1"
    local SHA="$2"

    local args=$(join_args "$TAG" "$SHA")

    git_command tag "$args"
}

push_tag() {
    local TAG="$1"
    git_command push origin "$TAG"
}