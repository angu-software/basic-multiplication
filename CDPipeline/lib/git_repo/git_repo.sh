
git_command() {
    git $@
}

fetch_tags() {
    git_command fetch --tags
}

get_rc_version_tags() {
    echo "$(git_command tag -l --sort=-v:refname)"
}

set_rc_version_tag() {
    local TAG="$1"
    git_command tag "$TAG"
}