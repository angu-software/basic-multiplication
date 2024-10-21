Describe 'git_repo.sh'
    Include 'lib/git_repo/git_repo.sh'

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
            The variable EXECUTED_GIT_COMMAND should eq "git tag 1.0.0+4-RC"
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
End