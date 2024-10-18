# Splits a string into an array based on a delimiter.
# Parameters:
#   $1 - The string to be split.
#   $2 - The delimiter to use for splitting the string.
# Returns:
#   The elements of the string as an array.
split() {
    local STRING=$1
    local DELIMITER=$2

    IFS="$DELIMITER"
    read -r -a ARRAY <<< "$STRING"
    unset IFS

    echo ${ARRAY[@]}
}

# Splits a tag string into its components.
# The tag string is expected to be in the format <major>.<minor>.<patch>+<build>[-RC].
# Parameters: 
#   $1 - The tag string to be split.
# Returns:
#   The components of the tag string.
split_tag() {
    local TAG=$1

    if [[ -z "$TAG" ]]; then
        echo ''
        return
    fi

    local TAG_SPLIT=($(split $TAG '+'))
    local VERSION=${TAG_SPLIT[0]}
    local META=${TAG_SPLIT[1]}
    local META_SPLIT=($(split $META '-'))
    local BUILD_NUMBER=${META_SPLIT[0]}
    local RC=${META_SPLIT[1]}

    if [[ -z "$RC" ]]; then
        echo "$VERSION $BUILD_NUMBER"
        return
    fi

    echo "$VERSION $BUILD_NUMBER $RC"
}

next_rc_tag_from_tag() {
    local TAG=$1

    echo $TAG
}

Describe 'next_rc_tag_from_tag()'
    local TAG=''

    Describe 'when tag is empty'
        TAG=''

        It 'returns an empty string'
            When call next_rc_tag_from_tag $TAG
            The output should equal ''
        End
    End

    Describe 'when tag exists'
        Pending 'Internal implementaion needs more refinement'

        TAG='1.0.0+1-RC'

        It 'returns the next RC tag'
            When call next_rc_tag_from_tag $TAG
            The output should equal '1.0.0+2-RC'
        End
    End
End