#!/bin/bash

filter_list() {
    local list="$1"
    local filter_func="$2"
    local filtered_list=()

    while IFS= read -r element; do
        if "$filter_func" "$element"; then
            filtered_list+=("$element")
        fi
    done <<< "$list"

    printf "%s\n" "${filtered_list[@]}"
}