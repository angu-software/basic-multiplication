Describe 'verstion_tag'
    Include 'lib/tags/version_tag.sh'
    local VERSION='1.2.3'
    local TAG="$VERSION+2-RC"

    Describe 'build_number_from_tag()'
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
        Describe 'when tag is empty'
            TAG=''

            It 'it returns intial RC tag'
                When call next_rc_tag_from_tag $TAG
                The output should equal '1.0.0+1-RC'
            End
        End

        Describe 'when tag exists'
            Pending 'Needs extraction of version from tag'
            It 'it returns the next RC tag'
                When call next_rc_tag_from_tag $TAG
                The output should equal "$VERSION+2-RC"
            End
        End
    End
End