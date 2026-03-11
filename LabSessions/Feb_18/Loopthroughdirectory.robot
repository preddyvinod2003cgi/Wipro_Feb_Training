*** Settings ***
Library    Collections

*** Variables ***
&{USER}    username=admin    password=admin123

*** Test Cases ***
Loop Dictionary
    FOR    ${key}    ${value}    IN    &{USER}
        Log    Key: ${key}    Value: ${value}
    END
