Describe 'split()'
    Include 'lib/foundation/split.sh'
    local STRING="1.0.0+1-RC"

    Describe 'when delimiter is "+"'
        It 'it splits the string by "+"'
            When call split "$STRING" "+"
            The output should equal "1.0.0 1-RC"
        End
    End

    Describe 'when delimiter is "-"'
        It 'it splits the string by "-"'
            When call split "$STRING" '-'
            The output should equal '1.0.0+1 RC'
        End

        It 'it splits the string by " "'
            STRING="1.0.0 1-RC"

            When call split "$STRING" ' '
            The output should equal '1.0.0 1-RC'
        End
    End
End