*** Settings ***
Library     SeleniumLibrary
Library     DataDriver     file=../TestData/ddtLogindata.xlsx     sheet_name=ddtLogindata

Test Template     Login Test
Test Setup        Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    firefox
Test Teardown     Close Browser


*** Test Cases ***
Login with user     ${username}     ${password}


*** Keywords ***
Login Test
    [Arguments]     ${username}     ${password}

    Wait Until Element Is Visible    xpath://input[@name='username']    timeout=10s
    Input Text    xpath://input[@name='username']    ${username}
    Input Text    xpath://input[@name='password']    ${password}
    Click Element    xpath://button[@type='submit']
    Wait Until Element Is Visible    xpath://h6[@class='oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module']    timeout=5s
    Element Should Be Visible    xpath://h6[@class='oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module']