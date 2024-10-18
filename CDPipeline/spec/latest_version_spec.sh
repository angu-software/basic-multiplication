
make_new_rc_tag() {
    TAG="1.0.0.1-RC"
    echo $TAG
}

Describe 'make_new_rc_tag()'
    local TAG_LIST=''

    Describe 'when no tags exist'
        TAG_LIST=''

        It 'returns the first RC tag'
            When call make_new_rc_tag $TAG_LIST
            The output should equal '1.0.0.1-RC'
        End
    End

    Describe 'when one tag exists'
        Pending 'Internal implementaion needs more refinement'

        TAG_LIST='1.0.0.1-RC'

        It 'returns the next RC tag'
            When call make_new_rc_tag $TAG_LIST
            The output should equal '1.0.0.2-RC'
        End
    End
End