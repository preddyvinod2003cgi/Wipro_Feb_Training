*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/

*** Test Cases ***
Verify multiselect check boxs
    Open Browser    ${url}    chrome
    # maximize the browser window
    Maximize Browser Window

    # identify the common elements attribute - //input[@type='checkbox']
    ${elements}=    Get WebElements    xpath://input[@type='checkbox']

    FOR    ${element}    IN    @{elements}
        Click Element    ${element}
        Sleep    2s
    END

    # close browser
    Close Browser
