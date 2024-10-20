
git_command() {
    git $@
}

get_rc_version_tags() {
    echo "$(git_command tag -l --sort=-v:refname)"
}