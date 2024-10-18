Describe 'build_number_from_tag()'
    Include 'lib/tags/version_tag.sh'

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