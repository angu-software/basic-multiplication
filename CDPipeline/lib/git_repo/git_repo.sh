
git_command() {
    git $@
}

git_sha() {
    local IS_SHORT="$1"

    if [[ -n "$IS_SHORT" ]]; then
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

    if [[ -n "$SHA" ]]; then
        git_command tag "$TAG" "$SHA"
        return
    fi

    git_command tag "$TAG"
}

push_tag() {
    local TAG="$1"
    git_command push origin "$TAG"
}