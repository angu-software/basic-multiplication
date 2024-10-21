# TODO: make foundation.sh jist sourcing split.sh and join_args.sh and is_empty and is_not_empty

is_empty() {
    [[ -z "$1" ]]
}

is_not_empty() {
    [[ -n "$1" ]]
}