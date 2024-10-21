Describe 'git_repo.sh'
    Include 'lib/git_repo/git_repo.sh'

    local SHA="a1b2c3d4e5f6"
    local SHA_SHORT="a1b2c3"
    local EXECUTED_GIT_COMMAND

    # Mocked git command
    git_command() {
        EXECUTED_GIT_COMMAND="git $@"
        case "$1 $2" in
            "tag -l")
                echo "1.0.0+3-RC"
                echo "1.0.0+2-RC"
                echo "1.0.0+1-RC"
                ;;
            "rev-parse HEAD")
                echo "$SHA"
                ;;
            "rev-parse --short")
                echo "$SHA_SHORT"
                ;;
            *)
                ;;
        esac
    }

    Describe 'get_rc_version_tags()'
        It 'it returns a list of RC version tags'
            When call get_rc_version_tags
            The output should equal $'1.0.0+3-RC\n1.0.0+2-RC\n1.0.0+1-RC'
        End

        It 'it executes the git list tags command'
            When call get_rc_version_tags
            The variable EXECUTED_GIT_COMMAND should eq "git tag -l --sort=-v:refname"
            The output should be present
        End
    End

    Describe 'set_rc_version_tag()'
        It 'it sets the RC version tag'
            When call set_rc_version_tag "1.0.0+4-RC"
            The variable EXECUTED_GIT_COMMAND should equal "git tag 1.0.0+4-RC"
        End
    End

    Describe 'fetch_tags()'
        It 'it fetches the tags'
            When call fetch_tags
            The variable EXECUTED_GIT_COMMAND should equal "git fetch --tags"
        End
    End

    Describe 'push_tag()'
        It 'it pushes the tag'
            When call push_tag "1.0.0+4-RC"
            The variable EXECUTED_GIT_COMMAND should equal "git push origin 1.0.0+4-RC"
        End
    End

    Describe 'git_sha()'
        It 'it returns the git SHA'
            When call git_sha
            The output should equal "$SHA"
            The variable EXECUTED_GIT_COMMAND should equal "git rev-parse HEAD"
        End

        Describe 'when specified short'
            It 'it returns the short SHA'
                When call git_sha short
                The output should equal "$SHA_SHORT"
                The variable EXECUTED_GIT_COMMAND should equal "git rev-parse --short HEAD"
            End
        End
    End
End