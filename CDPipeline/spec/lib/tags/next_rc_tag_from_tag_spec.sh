Describe 'next_rc_tag_from_tag()'
    Include 'lib/tags/next_rc_tag_from_tag.sh'
    
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