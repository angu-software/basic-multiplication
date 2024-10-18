Describe 'split()'
    Include 'lib/foundation/split.sh'

    Describe 'when delimiter is "+"'
        It 'splits the string by "+"'
            When call split '1.0.0+1-RC' '+'
            The output should equal '1.0.0 1-RC'
        End
    End

    Describe 'when delimiter is "-"'
        It 'splits the string by "-"'
            When call split '1.0.0+1-RC' '-'
            The output should equal '1.0.0+1 RC'
        End

        It 'splits the string by " "'
            When call split '1.0.0 1-RC' ' '
            The output should equal '1.0.0 1-RC'
        End
    End
End