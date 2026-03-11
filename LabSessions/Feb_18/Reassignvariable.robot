*** Variables ***
${COUNT}    5

*** Test Cases ***
Reassign Variable
    Log    Old value: ${COUNT}
    ${COUNT}=    Set Variable    10
    Log    Updated value: ${COUNT}
