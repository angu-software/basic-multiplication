source 'jabos_paths.sh'

source "$JABOS_LIB_DIR/git_repo/git_repo.sh"
source "$JABOS_LIB_DIR/version_tag/version_tag.sh"

# shellspec interception point
# to sub/mock the used functions
test || __() { :; }
__ begin __

fetch_tags
rc_versions="$(get_rc_version_tags)"
next_rc_tag="$(next_rc_tag_from_tag_list "$rc_versions")"
set_rc_version_tag "$next_rc_tag" "$(git_sha)"
push_tag "$next_rc_tag"