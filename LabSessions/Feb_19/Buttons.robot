*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://rahulshettyacademy.com/AutomationPractice/

*** Test Cases ***
Verify multiselect check boxs
    Open Browser    ${url}    chrome
    Maximize Browser Window

    # get all checkboxes whose id starts with c_bs_
    ${elements}=    Get WebElements    xpath://input[starts-with(@id,'checkBoxOption')]

    FOR    ${element}    IN    @{elements}
        Click Element    ${element}
        Sleep    2s
    END

    Close Browser
