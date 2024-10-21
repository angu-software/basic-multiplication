
git_command() {
    git $@
}

fetch_tags() {
    git_command fetch --tags
}

get_rc_version_tags() {
    git_command tag -l --sort=-v:refname
}

# TODO: Consider checking for tag format
# TODO: take SHA as argument
set_rc_version_tag() {
    local TAG="$1"
    git_command tag "$TAG"
}

push_tag() {
    local TAG="$1"
    git_command push origin "$TAG"
}