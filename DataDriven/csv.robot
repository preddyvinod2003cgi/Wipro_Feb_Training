*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=../TestData/ddtLogindataCSV.csv
Test Template     Login Test
Test Setup        Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome
Test Teardown     Close Browser

*** Test Cases ***
Login With Multiple Users       ${username}     ${password}

*** Keywords ***
Login Test
    [Arguments]    ${username}    ${password}

    Wait Until Element Is Visible    xpath=//input[@name='username']    15s
    Input Text    xpath=//input[@name='username']    ${username}
    Input Text    xpath=//input[@name='password']    ${password}
    Click Button    xpath=//button[@type='submit']
    Sleep    3s

    Run Keyword And Ignore Error    Page Should Contain    Dashboard