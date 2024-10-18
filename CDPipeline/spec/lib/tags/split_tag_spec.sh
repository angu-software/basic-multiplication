Describe 'split_tag()'
    Include 'lib/tags/split_tag.sh'

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