#!/bin/bash

source 'jabos_paths.sh'

Describe 'filter_list.sh'
    Include 'lib/foundation/filter_list.sh'

    is_even() {
        local num="$1"
        if [[ $((num % 2)) -eq 0 ]]; then  # Perform modulo and check if equal to 0
            return 0  # Even number
        else
            return 1  # Odd number
        fi
    }

    Describe 'filter_list()'
        Describe 'when list has one matching element'
            It 'it returns that element'
                When call filter_list "2" "is_even"
                The output should equal '2'
            End
        End
    End

    Describe 'when list has one none matching element'
        It 'it returns that nothing'
            When call filter_list "3" "is_even"
            The output should equal ''
        End
    End

    Describe 'when list multiple elements'
        Describe 'when the list contains none-mathching elements'
            It 'it only returns the mathcing elements'
                When call filter_list $'1\n2\n3\n4' "is_even"
                The output should equal $'2\n4'
            End
        End
    End
End