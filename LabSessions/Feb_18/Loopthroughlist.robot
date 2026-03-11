*** Variables ***
@{FRUITS}    Apple    Banana    Mango

*** Test Cases ***
Loop List
    FOR    ${item}    IN    @{FRUITS}
        Log    ${item}
    END

*** Test Cases ***
List Length
    ${length}=    Get Length    ${FRUITS}
    Log    ${length}

