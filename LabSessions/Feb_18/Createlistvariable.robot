*** Variables ***
@{FRUITS}    Apple    Banana    Mango

*** Test Cases ***
Print First Fruit
    Log    ${FRUITS}[0]
