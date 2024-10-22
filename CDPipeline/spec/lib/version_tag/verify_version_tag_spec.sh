source 'jabos_paths.sh'

Describe 'verify_rc_version_tag()'
    Include 'lib/version_tag/version_tag_internal.sh'
    Include 'lib/version_tag/verify_version_tag.sh'

    Describe 'when tag is valid rc tag'
        Parameters
            "$(initial_version_rc_tag)"
            "$(make_version_tag "1.0.0" "2" "true")"
        End

        It "it succeeds $1"
            When call verify_rc_version_tag "$1"
            The status should be success
        End
    End

    Describe 'when tag is not an rc tag'
        Parameters
            ""
            "1.0.0"
            "1.0.0+2"
            "1.0.0+2-rc"
            "1.0.0+a-RC"
            "a.b.c+2-RC"
        End

        It "it fails $1"
            When call verify_rc_version_tag "$1"
            The status should be failure
            The error should equal "Tag $1 is not a valid RC version tag.
Tag must be in the format: <version>+<build>-RC
Example: 1.0.0+1-RC"
        End
    End
End