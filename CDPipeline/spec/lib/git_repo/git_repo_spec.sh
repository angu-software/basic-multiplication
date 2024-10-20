Describe 'git_repo.sh'
    Include 'lib/git_repo/git_repo.sh'

    local NEW_RC_TAG="1.0.0+4-RC"
    local EXISTING_RC_TAG="1.0.0+3-RC"

    # Mocked git command
    git_command() {
        case "$1 $2" in
            "tag -l")
                echo "1.0.0+3-RC"
                echo "1.0.0+2-RC"
                echo "1.0.0+1-RC"
                ;;
            "tag 1.0.0+4-RC")
                return 0
                ;;
            "tag $EXISTING_RC_TAG")
                return 1
                ;;
            *)
                return 1
                ;;
        esac
    }

    Describe 'get_rc_version_tags()'
        It 'it returns a list of RC version tags'
            When call get_rc_version_tags
            The output should equal $'1.0.0+3-RC\n1.0.0+2-RC\n1.0.0+1-RC'
        End
    End

    Describe 'set_rc_version_tag()'
        It 'it sets the RC version tag'
            When call set_rc_version_tag "$NEW_RC_TAG"
            The status should be success
        End

        Describe 'when tag already exists'
            It 'it does not set the RC version tag'
                When call set_rc_version_tag "$EXISTING_RC_TAG"
                The status should be failure
            End
        End
    End
End