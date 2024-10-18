Describe 'next_rc_tag_from_tag()'
    Include 'lib/tags/next_rc_tag_from_tag.sh'

    local TAG=''

    Describe 'when tag is empty'
        TAG=''

        It 'returns intial  RC tag'
            When call next_rc_tag_from_tag $TAG
            The output should equal '1.0.0+1-RC'
        End
    End

    Describe 'when tag exists'
        TAG='1.0.0+1-RC'

        It 'returns the next RC tag'
            When call next_rc_tag_from_tag $TAG
            The output should equal '1.0.0+2-RC'
        End
    End
End