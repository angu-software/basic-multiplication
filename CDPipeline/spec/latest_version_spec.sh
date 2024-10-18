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

build_number_from_tag() {
    local TAG=$1

    if [[ -z "$TAG" ]]; then
        echo 1
        return
    fi

    local SPLIT_TAG=($(split_tag $TAG))
    local BUILD_NUMBER=${SPLIT_TAG[1]}

    echo $BUILD_NUMBER
}

next_rc_tag_from_tag() {
    local TAG=$1

    echo $TAG
}

Describe 'split_tag()'
    TAG='1.0.0+1-RC'

    It 'it splits the tag into its compnents'
        When call split_tag $TAG
        The output should equal '1.0.0 1 RC'
    End

    Describe 'when tag dose not contain RC indicator'
        TAG='1.0.0+1'

        It 'it splits the tag into its compnents'
            When call split_tag $TAG
            The output should equal '1.0.0 1'
        End
    End

    Describe 'when tag is empty'
        TAG=''
        It 'it returns an empty string'
            When call split_tag $TAG
            The output should equal ''
        End
    End
End

Describe 'build_number_from_tag()'
    TAG='1.0.0+2-RC'

    Describe 'when tag is empty'
        TAG=''
        It 'it returns 1'
            When call build_number_from_tag ''
            The output should equal 1
        End
    End

    Describe 'when tag is not empty'
        It 'it returns the build number'
            When call build_number_from_tag $TAG
            The output should equal 2
        End
    End
End

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