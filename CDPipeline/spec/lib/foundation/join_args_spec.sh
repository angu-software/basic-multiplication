source 'jabos_paths.sh'

Describe 'join_args.sh'
    Include 'lib/foundation/join_args.sh'

    Describe 'join_args()'
        It 'it joins its arguments by " " by default'
            When call join_args "Hello" "World" "!"
            The output should equal "Hello World !"
        End

        It 'it omits empty arguments'
            When call join_args "Hello" "" "World" "!" ""
            The output should equal "Hello World !"
        End

        It 'it omits unset vars'
            When call join_args "Hello" $VAR "World" "!"
            The output should equal "Hello World !"
        End
    End
End