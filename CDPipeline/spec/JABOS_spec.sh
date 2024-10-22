Describe 'JABOS.sh'
    SHA="1234567890"

    Intercept begin 
    __begin__() {
        fetch_tags() {
            echo 'fetch_tags'
        }
        get_rc_version_tags() {
            echo "1.0.0+3-RC"
        }
        git_sha() {
            echo "$SHA"
        }
        set_tag() {
            echo "set_tag $@"
        }
        push_tag() {
            echo "push_tag $@"
        }
    }

    Describe 'when executed to tag a release candidate'
        It 'fetches the git tags'
            When run source ./JABOS.sh
            The output line 1 should equal 'fetch_tags'
        End

        It 'it sets the new rc tag'
            When run source ./JABOS.sh
            The output line 2 should include "set_tag 1.0.0+4-RC $SHA"
        End

        It 'it pushes the RC tag'
            When run source ./JABOS.sh
            The output line 3 should include "push_tag 1.0.0+4-RC"
        End
    End
End