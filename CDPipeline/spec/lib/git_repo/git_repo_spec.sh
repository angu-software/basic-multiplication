Describe 'git_repo.sh'
    Include 'lib/git_repo/git_repo.sh'

    Mock git_command
        case "$@" in
            "tag -l --sort=-v:refname")
                echo "1.0.0+3-RC"
                echo "1.0.0+2-RC"
                echo "1.0.0+1-RC"
                ;;
            *)
                return 1
                ;;
        esac
    End

    Describe 'get_rc_version_tags()'
        It 'it returns a list of RC version tags'
            When call get_rc_version_tags
            The output should equal $'1.0.0+3-RC\n1.0.0+2-RC\n1.0.0+1-RC'
        End
    End
End