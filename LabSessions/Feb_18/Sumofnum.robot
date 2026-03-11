*** Test Cases ***
Sum Of Two Numbers
    ${a}=    Set Variable    10
    ${b}=    Set Variable    20
    ${sum}=  Evaluate    ${a} + ${b}
    Log    ${sum}
