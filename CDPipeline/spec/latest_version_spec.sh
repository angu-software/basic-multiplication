
build_number_from_tag() {
    local TAG=$1

    echo 1
}

make_new_rc_tag() {
    local TAG="1.0.0+1-RC"
    echo $TAG
}

# Tag format: <major>.<minor>.<patch>+<build>-RC

Describe 'build_number_from_tag()'
    TAG='1.0.0+1-RC'

    Describe 'when tag is empty'
        TAG=''
        It 'it returns 1'
            When call build_number_from_tag ''
            The output should equal 1
        End
    End
End

Describe 'make_new_rc_tag()'
    local TAG_LIST=''

    Describe 'when no tags exist'
        TAG_LIST=''

        It 'returns the first RC tag'
            When call make_new_rc_tag $TAG_LIST
            The output should equal '1.0.0+1-RC'
        End
    End

    Describe 'when one tag exists'
        Pending 'Internal implementaion needs more refinement'

        TAG_LIST='1.0.0+1-RC'

        It 'returns the next RC tag'
            When call make_new_rc_tag $TAG_LIST
            The output should equal '1.0.0+2-RC'
        End
    End
End